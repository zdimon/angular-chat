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
import time
from utils.api_router import get_url_by_name

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
            WHERE chat_chatroom.is_closed=False AND chat_chatroom.id = u1.room_id AND u1.user_id = '%s' AND u2.user_id = '%s' 
            AND u1.room_id = u2.room_id AND u1.tpa_id = u2.tpa_id AND u1.tpa_id = '%s'
            ORDER BY u1.room_id DESC
            LIMIT 1
        """ % (int(opponent.id), int(caler.id), int(tpa.id)))
    #import pdb; pdb.set_trace()
    if r.rowcount > 0 :
        room = ChatRoom.objects.get(pk = r.record[0]['id'])
        return { 'status': 0, 'message': 'Room is exist', 'room_id': str(room.id), 'video_charging': room.is_charging_video }

    if r.rowcount == 0 :       
        room = ChatRoom()
        room.tpa = tpa
        room.save()
        room.add_user(caler)
        room.add_user(opponent)
        room.save()
        participans = { str(caler.user_id) : serialize_user(caler), str(opponent.user_id) : serialize_user(opponent) }
        return { 'status': 0, 'message': 'Room was created', 'room_id': str(room.id), 'participans': participans, 'video_charging': room.is_charging_video }


@json_view
def close_chat_room(request,app_name,room_id, opponent_id, user_id):
    '''
    Function closes chat session.
    
    [server]/api/[app_name]/[room_id]/[opponent_id]/[user_id]/close_chat_room

    Example: http://chat.localhost/api/tpa1com/34/190023/12678/close_chat_room

    **user_id** = user WHO closed the room

    '''
    room = ChatRoom.objects.get(pk = room_id)
    room.is_charging_text = False
    room.is_charging_video = False
    room.is_charging_audio = False
    room.is_closed = True
    room.save()
    mes = { 'action': 'close_room', 
            'room_id': room_id,
            'user_id': user_id
          }
   
    bclient.publish('%s_%s' % (app_name, opponent_id), json.dumps(mes))
    # send commant to remove this opponent from list of the active opponent in js
    mess_ac = { 'action': 'contact_deactivate', 'user_id': user_id }
    bclient.publish('%s_%s' % (app_name, opponent_id), json.dumps(mess_ac))    
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

    Check if user is available.

    Check message out on stop words and replace them.

    Add owner to opponent's contact list.

    If the message is first send notification to tpa side.

    parameters by POST: app_name,owner_id,room_id,message

    [server]/api/save_message

    Example: http://chat.localhost/api/save_message
    '''
    #import pdb; pdb.set_trace()
    b = json.loads(request.body)
    #time.sleep(1)

    b['message'] = stop_words(b['message'])

    if(check_message(b['message']) == False):
        message = 'This message contains prohibited information!'
    else:
        message = b['message']         
    tpa = Tpa.objects.get(name=b['app_name'])
    owner = ChatUser.objects.get(tpa=tpa,user_id=int(b['owner_id']))
    
    if (owner.gender=='m'):
        balance = get_user_balance(tpa,owner)
        if balance < 3:
            return  { 'status': 1, 'message': 'Your account is emply. Please replanish your account.' }
    room = ChatRoom.objects.get(tpa=tpa,id=int(b['room_id']))
    
    # Set servers locale to Kiev time to save same date of message for girl and man
    import pytz, datetime
    local = pytz.utc
    naive = datetime.datetime.strptime (time.strftime("%Y-%m-%d %H:%M:%S", time.gmtime()), "%Y-%m-%d %H:%M:%S")
    local_dt = local.localize(naive, is_dst=None)
    utc_dt = local_dt.astimezone (pytz.timezone ("Europe/Kiev"))
    
    cm = ChatMessage()
    cm.tpa = tpa
    cm.user = owner
    cm.room = room
    cm.message = message
    cm.created = utc_dt
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
                                'owner': serialize_user(owner),  
                                'participants': b['participants']          
                                }
                  }
           
            bclient.publish(p, json.dumps(mes))
            opponent = ChatUser.objects.get(user_id=p.split('_')[1])
            #import pdb; pdb.set_trace()
            
            if owner != opponent:
                # check accessebilities
                #import pdb; pdb.set_trace()
                check_avalible_url = get_url_by_name('check_accessebility',{'user_id': opponent.user_id, 'app_name': b['app_name']})
                print 'REQUEST_____%s' % check_avalible_url
                res = json.loads(requests.get(check_avalible_url).content)
                if(res['status']==1):
                    print 'noooooo'
                    mes = { 'action': 'say_busy', 'message': 'Sorry but I am busy now.', 'user_profile':  serialize_user(opponent)}
                    owner_chanel = '%s_%s' % (b['app_name'], owner.user_id)
                    bclient.publish(owner_chanel, json.dumps(mes))
                # adding contact 
                is_sent = False
                if opponent.gender == 'w':
                    add_me_to_contact_if_not_exist(tpa,owner,opponent,p)
                #if it man just show multiinvite popup
                else:
                    
                    try:
                        cont = ChatContacts.objects.get(tpa=tpa,owner=opponent,contact=owner)
                    except:
                        data = {'message': cm.message, 'opponent': serialize_user(owner), 'id': str(owner.user_id) }
                        mes = { 'action': 'show_multi_invite_notification', 'data': data }
                        bclient.publish('%s_%s' % (b['app_name'], opponent.user_id), json.dumps(mes))
                        is_sent = True                     
                contact = _add_contact(tpa.name,owner.user_id,opponent.user_id)
                mark_new_message(owner,opponent)
                if(opponent.is_online):
                    mes_contact = { 'action': 'add_opponent_in_my_contact_list', 'user_id': opponent.user_id, 'profile': serialize_user(opponent) }
                    mes_online = { 'action': 'update_users_online' }
                    owner_chanel = '%s_%s' % (b['app_name'], owner.user_id)
                    opponent_chanel = '%s_%s' % (b['app_name'], opponent.user_id)
                    bclient.publish(owner_chanel, json.dumps(mes_contact))
                    bclient.publish(owner_chanel, json.dumps(mes_online))
                    if is_sent == False:
                        data = {'message': cm.message, 'id': cm.id, 'opponent': serialize_user(owner)}
                        mes = { 'action': 'show_new_message_notification', 'data': data }
                        bclient.publish('%s_%s' % (tpa.name, opponent.user_id), json.dumps(mes))
                # send commant to add this opponent to list of the active opponent in js
                mess_ac = { 'action': 'contact_activate', 'user_id': owner.user_id, 'profile': serialize_user(owner) }
                bclient.publish(opponent_chanel, json.dumps(mess_ac))
                
    except Exception, e:
        print e
    
    

    return  { 'status': 0, 'message': b['message'], 'room_id': str(room.id), 'owner_id': str(owner.id), 'participants': arr_participants }


def mark_new_message(owner,contact):
    '''
    Get contact object and set has_new_message is Tru if this contact is not active.

    :param owner:
    :param room:
    :return: contact
    '''
    #import pdb; pdb.set_trace()
    try:
        conn = ChatContacts.objects.get(contact=owner,owner=contact)
        #if conn.is_active == False:
        conn.has_new_message = True
        conn.save()
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
        mes = { 'action': 'add_me_in_contact_list', 'user_id': owner.user_id, 'profile': serialize_user(owner) }
        bclient.publish(chanel, json.dumps(mes))
        print 'ssssend %s' % chanel

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
    message = ChatMessage.objects.filter(room=room).order_by("id")[0:30]

    for m in message:
        user_info = ChatUser.objects.get(user_id=m.user.user_id)
        lst_chat_message.append({'id':m.id, 'created': str(m.created.time()), 'owner': serialize_user(m.user), 'message':m.message, 'is_translated': m.is_translated, 'message_translate': m.message_trans })
    return  { 'status': 0, 'message': lst_chat_message }


@json_view
def invite(request,app_name,owner_id,contact_id):
    '''
    Function send invite to opponent. 

    REMOVED Add the opponent to the contact list.

    Mark contact as active

    Create the room. Put the user into the room.
     
    '''
    # return emptyness if request went without contact_id
    if contact_id == '0': 
        return {'status': 1, 'message': 'Contact does not defined'}
    # mark contact as does not have new message if it exists
    contact = _get_contact(app_name,owner_id,contact_id)
    rm = _get_room_or_create(app_name,owner_id,contact_id)
    room = ChatRoom.objects.get(pk=rm['room_id'])
    if(contact):
        contact.has_new_message = False
        contact.activity = time.time()
        contact.room = room
        contact.save()
        contact_data = {'activity': int(time.time())}
    else:
        contact_data = {}
   
    owner_chanel = '%s_%s' % (app_name, owner_id)
    
    
    #contact.set_active(rm['room_id'])
    tpa = Tpa.objects.get(name=app_name)
    owner = ChatUser.objects.get(user_id=owner_id,tpa=tpa)
    contact_user = ChatUser.objects.get(user_id=contact_id,tpa=tpa)
    print "SEND TO "+ owner_chanel
    mes = { 'action': 'put_me_in_room', 'room_id': rm['room_id'], 'owner_id': owner_id,'contact_id':contact_id, 'contact': serialize_user(contact_user), 'contact_data': contact_data, 'source': 'views/room.py'}
    bclient.publish(owner_chanel, json.dumps(mes))
    
    if(contact_user.is_online):
        mes = { 'action': 'show_inv_win', 'room_id': rm['room_id'], 'user_profile': serialize_user(owner)}
        contact_chanel = '%s_%s' % (app_name, contact_id)
        bclient.publish(contact_chanel, json.dumps(mes))

    out = _get_room_or_create(app_name,owner_id,contact_id)
    out['opponent'] = serialize_user(contact_user)
    out['contact_data'] = contact_data
    return out


@csrf_exempt
@json_view
def multi_invitation(request):
    '''
    Function send invite to multiply opponent. 
     
    '''
    b = json.loads(request.body)
    print b
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
   



@csrf_exempt
@json_view
def save_translation(request,app_name):
    '''
    Function saves translation 

    '''
    m = ChatMessage.objects.get(pk=request.POST['message_id'])
    m.is_translated = True
    m.message_trans = request.POST['translation']
    m.save()
    return  { 'status': 0, 'message': 'Ok trans %s %s' % (request.POST['message_id'],request.POST['translation']) }





