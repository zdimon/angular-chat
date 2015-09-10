# -*- coding: utf-8 -*-
import json
from django.http import HttpResponse
from jsonview.decorators import json_view
from django.shortcuts import redirect
from django.views.decorators.csrf import csrf_exempt
import requests
from django.contrib.auth.models import User
from chat.models import ChatUser,ChatRoom,ChatMessage, ChatContacts, ChatStopword
from chat.models import Tpa
from utils.util import read_conf, serialize_user
from utils.db import MyDB
from contact import _add_contact, _get_contact
import brukva
bclient = brukva.Client()
bclient.connect()
import re
bd = MyDB()

def check_message(message):
    ''' Check content of the message on phone number or email or url address '''
    message =  message.strip()
    message =  message.replace('+','')
    if re.match(r"([^@|\s]+@[^@]+\.[^@|\s]+)", message): 
        return False
    if re.match(r"[0-9][0-9][0-9]*.", message): 
        return False
    if message.find('.com')>0 or \
       message.find('http://')>0 or \
       message.find('www')>0 or \
       message.find('.ua')>0 or \
       message.find('.net')>0 or \
       message.find('.ru')>0 or \
       message.find('.org')>0:
       return False
    return True

def get_user_balance(tpa,user):
    url = tpa.get_balance_url
    url = url.replace('[user_id]',str(user.user_id))
    result = json.loads(requests.get(url).content)
    return result['balance']


def _get_room_or_create(app_name,caler_id,opponent_id):
    '''
    Function return existed room identifier or create new room.

    Also it create two records in ChatUser2Room model.
    '''
    tpa = Tpa.objects.get(name=app_name)
    opponent = ChatUser.objects.get(tpa=tpa,user_id=opponent_id)
    caler = ChatUser.objects.get(tpa=tpa,user_id=caler_id)
    r = bd.select("""
            SELECT DISTINCT u1.room_id AS id, u1.user_id AS opponent, u2.user_id AS caler
            FROM   chat_chatuser2room u1, chat_chatuser2room u2, chat_chatroom
            WHERE chat_chatroom.is_closed=False AND chat_chatroom.id = u1.room_id AND u1.user_id = '%s' AND u2.user_id = '%s' AND u1.room_id = u2.room_id AND u1.tpa_id = u2.tpa_id AND u1.tpa_id = '%s'
            ORDER BY u1.room_id DESC
            LIMIT 1
        """ % (int(opponent.id), int(caler.id), int(tpa.id)))
    #import pdb; pdb.set_trace()
    if r.rowcount > 0 :
        room_id = ChatRoom.objects.get(pk = r.record[0]['id'])
        return { 'status': 0, 'message': 'Room is exist', 'room_id': str(room_id.id) }

    if r.rowcount == 0 :       
        room = ChatRoom()
        room.tpa = tpa
        room.save()
        room.add_user(caler)
        room.add_user(opponent)
        room.save()
        participans = { str(caler.user_id) : serialize_user(caler), str(opponent.user_id) : serialize_user(opponent) }
        return { 'status': 0, 'message': 'Room was created', 'room_id': str(room.id), 'participans': participans }


@json_view
def close_chat_room(request,app_name,room_id, opponent_id):
    '''
    Function closes chat session.
    
    [server]/api/[app_name]/[room_id]/close_chat_room

    Example: http://chat.localhost/api/tpa1com/34/close_chat_room
    '''
    room = ChatRoom.objects.get(pk = room_id)
    room.is_charging_text = False
    room.is_charging_video = False
    room.is_charging_audio = False
    room.save()
    mes = { 'action': 'close_room', 
            'room_id': room_id
          }
   
    bclient.publish('%s_%s' % (app_name, opponent_id), json.dumps(mes))
    return  { 'status': 0, 'message': 'Ok' }



@json_view
def show_feather(request,app_name,room_id,opponent_id):
    '''
    Function sends message to user to show feather indicator to notice about user is started typing.
    
    [server]/api/[app_name]/[room_id]/[opponent_id]/show_feather

    Example: http://chat.localhost/api/tpa1com/34/150014/show_feather
    '''
    mes = { 'action': 'show_feather', 
            'room_id': room_id
          }
   
    bclient.publish('%s_%s' % (app_name, opponent_id), json.dumps(mes))
    return  { 'status': 0, 'message': 'Ok' }


@json_view
def get_room_or_create(request,app_name,caler_id,opponent_id):
    '''
    Function return existed room identifier or create new room.
    Also it create two records in ChatUser2Room model.

    [server]/api/[app_name]/[caler_id]/[opponent_id]/get_online

    Example: http://chat.localhost/api/tpa1com/150031/150014/get_online
    '''
    return _get_room_or_create(app_name,caler_id,opponent_id)


def stop_words(message):
    stopwords = []
    stopwordsreplace = []
    for i in ChatStopword.objects.all():
        stopwords.append(i.word)
        stopwordsreplace.append(i.replace)
    if (any(substring in message for substring in stopwords)):
        for i,s in enumerate(stopwords):
            message = message.replace(s,stopwordsreplace[i])
    return message

@csrf_exempt
@json_view
def save_message(request):
    '''
    Function save message owner in DB,

    Check message out on stop words and replace them.

    Add owner to opponent's contact list.

    If the message is first send notification to tpa side.

    parameters by POST: app_name,owner_id,room_id,message

    [server]/api/save_message

    Example: http://chat.localhost/api/save_message
    '''
    #import pdb; pdb.set_trace()
    b = json.loads(request.body)

    b['message'] = stop_words(b['message'])

    if(check_message(b['message']) == False):
        message = 'This message contains prohibited information!'
    else:
        message = b['message']         
    tpa = Tpa.objects.get(name=b['app_name'])
    owner = ChatUser.objects.get(tpa=tpa,user_id=int(b['owner_id']))
    
    if (owner.gender=='m'):
        balance = get_user_balance(tpa,owner)
        print balance
        if balance < 3:
            return  { 'status': 1, 'message': 'Your account is emply. Please replanish your account.' }
    room = ChatRoom.objects.get(tpa=tpa,id=int(b['room_id']))
    cm = ChatMessage()
    cm.tpa = tpa
    cm.user = owner
    cm.room = room
    cm.message = message
    gender = owner.gender
    cm.save()
    charge_for_chat(cm,room,tpa) #charging
    try:
        arr_participants = []
        for p in b['participants']:
            arr_participants.append(p.split('_')[1])
            mes = { 'action': 'show_message', 'room_id': b['room_id'], 
                    'message': {'id': cm.id, 
                                'created': str(cm.created.time().strftime('%H:%M:%S')),
                                'message':cm.message,
                                'room_id':cm.room_id,
                                'owner': serialize_user(owner)            
                                }
                  }
           
            bclient.publish(p, json.dumps(mes))
            opponent = ChatUser.objects.get(user_id=p.split('_')[1])
            #import pdb; pdb.set_trace()
            if owner != opponent:
                # adding contact
                add_me_to_contact_if_not_exist(tpa,owner,opponent,p)
                contact = _add_contact(tpa.name,owner.user_id,opponent.user_id)
                mes_contact = { 'action': 'update_contact' }
                mes_online = { 'action': 'update_users_online' }
                owner_chanel = '%s_%s' % (b['app_name'], owner.user_id)
                bclient.publish(owner_chanel, json.dumps(mes_contact))
                bclient.publish(owner_chanel, json.dumps(mes_online))
                if room.get_count_messages()<2999:
                    data = {'message': cm.message, 'id': cm.id, 'opponent': serialize_user(owner)}
                    mes = { 'action': 'show_new_message_notification', 'data': data }
                    bclient.publish('%s_%s' % (tpa.name, opponent.user_id), json.dumps(mes))
            else:
                # mark contact as it has new message if it exists
                contact = _get_contact(app_name,opponent.user_id,owner.user_id)
                if(contact):
                    contact.has_new_message = True
                    contact.save()
                    
                
    except Exception, e:
        print e
    mark_new_message(room, owner)

    return  { 'status': 0, 'message': b['message'], 'room_id': str(room.id), 'owner_id': str(owner.id), 'participants': arr_participants }


def mark_new_message(room, owner):
    '''
    Get contact object and set has_new_message is Tru if this contact is not active.

    :param owner:
    :param room:
    :return: contact
    '''
    for o in room.get_participants_except_user(owner):
        try:
            contact = ChatContacts.objects.get(room=room,owner=o)
            if contact.is_active == False:
                contact.has_new_message = True
                contact.save()
        except:
            pass

def add_me_to_contact_if_not_exist(tpa,owner,opponent,chanel):
    '''

    :param owner:
    :param opponent:
    :return:
    '''
    try:
        cont = ChatContacts.objects.get(tpa=tpa,owner=opponent,contact=owner)
    except:
        mes = { 'action': 'add_me_in_contact_list', 'user_id': owner.user_id }
        bclient.publish(chanel, json.dumps(mes))

@json_view
def get_messages(request,room_id):
    '''
    Function get message in DB for room and app_name

    [server]/api/[room_id]/get_message

    Example: http://chat.localhost/api/23/get_message
    '''
    #import pdb; pdb.set_trace()
    lst_chat_message = []
    room = ChatRoom.objects.get(id=int(room_id))
    message = ChatMessage.objects.filter(room=room).order_by("id")

    for m in message:
        user_info = ChatUser.objects.get(user_id=m.user.user_id)
        lst_chat_message.append({'id':m.id, 'created': str(m.created.time()), 'owner': serialize_user(m.user), 'message':m.message })
    return  { 'status': 0, 'message': lst_chat_message }


@json_view
def invite(request,app_name,owner_id,contact_id):
    '''
    Function send invite to opponent. 

    REMOVED Add the opponent to the contact list.

    Mark contact as active

    Create the room. Put the user into the room.
     
    '''
    # mark contact as does not have new message if it exists
    contact = _get_contact(app_name,owner_id,contact_id)
    if(contact):
        contact.has_new_message = False
        contact.save()
   
    owner_chanel = '%s_%s' % (app_name, owner_id)
    contact_chanel = '%s_%s' % (app_name, contact_id)
    rm = _get_room_or_create(app_name,owner_id,contact_id)
    #contact.set_active(rm['room_id'])
    tpa = Tpa.objects.get(name=app_name)
    owner = ChatUser.objects.get(user_id=owner_id,tpa=tpa)
    contact_user = ChatUser.objects.get(user_id=contact_id,tpa=tpa)
    mes = { 'action': 'put_me_in_room', 'room_id': rm['room_id'], 'owner_id': owner_id,'contact_id':contact_id, 'contact': serialize_user(contact_user) }
    bclient.publish(owner_chanel, json.dumps(mes))
    mes = { 'action': 'show_inv_win', 'room_id': rm['room_id'], 'user_profile': serialize_user(owner)}
    bclient.publish(contact_chanel, json.dumps(mes))
    return _get_room_or_create(app_name,owner_id,contact_id)


@csrf_exempt
@json_view
def multi_invitation(request):
    '''
    Function send invite to multiply opponent. 
     
    '''
    b = json.loads(request.body)
    #print b
    #import pdb; pdb.set_trace()
    tpa = Tpa.objects.get(name=b['app_name'])
    owner = ChatUser.objects.get(tpa=tpa,user_id=int(b['owner_id']))
    id = str(b['owner_id'])
    data = {'message': b['message'], 'opponent': serialize_user(owner), 'id': id }
    mes = { 'action': 'show_multi_invite_notification', 'data': data }
    bclient.publish('%s_%s' % (b['app_name'], str(b['opponent_id'])), json.dumps(mes)) 
    #print 'sent to %s_%s ' %   (b['app_name'], str(b['opponent_id']))
    return  { 'status': 0, 'message': 'ok' }



def charge_for_chat(lm,room,tpa):
    from datetime import datetime, timedelta
    from django.utils.dateformat import format
    import time
    print('Charging for chat room %s price %s timeout %s' % (room, tpa.price_text_chat, tpa.timeout_chating))
    curt = int(format(lm.created, 'U'))
    try:
        lme = room.get_last_message_enother_user(lm)        
        en = int(format(lme.created, 'U'))   
        fork = curt - en
        if (fork<tpa.timeout_chating):
            print '...DEDUCT FOR %s SEC' % fork
            room.is_charging_text = True
            room.save()
        else:
            room.is_charging_text = False
            room.save()
            print '...TOO LONG %s SEC' % fork
    except:
        pass
    #    print 'no messages'
    #    room.is_charging = False
    #    room.save()
   




