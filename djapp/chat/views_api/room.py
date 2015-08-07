# -*- coding: utf-8 -*-
import json
from django.http import HttpResponse
from jsonview.decorators import json_view
from django.shortcuts import redirect
from utils.util import read_conf
from django.views.decorators.csrf import csrf_exempt
import requests
from django.contrib.auth.models import User
from chat.models import ChatUser,ChatRoom,ChatMessage, ChatContacts
from chat.models import Tpa
from utils.util import read_conf, serialize_user
from utils.db import MyDB
from contact import _add_contact
import brukva

bclient = brukva.Client()
bclient.connect()

bd = MyDB()

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
def get_room_or_create(request,app_name,caler_id,opponent_id):
    '''
    Function return existed room identifier or create new room.
    Also it create two records in ChatUser2Room model.

    [server]/api/[app_name]/[caler_id]/[opponent_id]/get_online

    Example: http://chat.localhost/api/tpa1com/150031/150014/get_online
    '''
    return _get_room_or_create(app_name,caler_id,opponent_id)



@csrf_exempt
@json_view
def save_message(request):
    '''
    Function save message owner in DB 

    parameters by POST: app_name,owner_id,room_id,message

    [server]/api/save_message

    Example: http://chat.localhost/api/save_message
    '''
    #import pdb; pdb.set_trace()
    b = json.loads(request.body)
    tpa = Tpa.objects.get(name=b['app_name'])
    owner = ChatUser.objects.get(tpa=tpa,user_id=int(b['owner_id']))
    room = ChatRoom.objects.get(tpa=tpa,id=int(b['room_id']))
    cm = ChatMessage()
    cm.tpa = tpa
    cm.user = owner
    cm.room = room
    cm.message = b['message']
    gender = owner.gender
    cm.save()
    try:
        for p in b['participants']:
            mes = { 'action': 'show_message', 'room_id': b['room_id'], 
                    'message': {'id': cm.id, 
                                'time': str(cm.created.time()),
                                'message':cm.message,
                                'room_id':cm.room_id,
                                'owner': serialize_user(owner)            
                                }
                  }
           
            bclient.publish(p, json.dumps(mes))
            opponent = ChatUser.objects.get(user_id=p.split('_')[1])
            if owner != opponent:
                add_me_to_contact_if_not_exist(tpa,owner,opponent,p)
    except Exception, e:
        print e
    mark_new_message(room, owner)

    return  { 'status': 0, 'message': b['message'], 'room_id': str(room.id), 'owner_id': str(owner.id) }


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

    Add the opponent to the contact list.

    Mark contact as active

    Create the room. Put the user into the room.
     
    '''
    #apiconf = read_conf()
    #app_name = apiconf['config']['app_name']
    contact = _add_contact(app_name,owner_id,contact_id)
    mes = { 'action': 'update_contact' }
    owner_chanel = '%s_%s' % (app_name, owner_id)
    contact_chanel = '%s_%s' % (app_name, contact_id)
    bclient.publish(owner_chanel, json.dumps(mes))
    rm = _get_room_or_create(app_name,owner_id,contact_id)
    contact.set_active(rm['room_id'])
    tpa = Tpa.objects.get(name=app_name)
    owner = ChatUser.objects.get(user_id=owner_id,tpa=tpa)
    mes = { 'action': 'put_me_in_room', 'room_id': rm['room_id'], 'owner_id': owner_id,'contact_id':contact_id }
    bclient.publish(owner_chanel, json.dumps(mes))
    mes = { 'action': 'show_inv_win', 'room_id': rm['room_id'], 'user_profile': serialize_user(owner)}
    bclient.publish(contact_chanel, json.dumps(mes))
    return _get_room_or_create(app_name,owner_id,contact_id)



