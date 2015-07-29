# -*- coding: utf-8 -*-
import json
from django.http import HttpResponse
from jsonview.decorators import json_view
from django.shortcuts import redirect
from utils.util import read_conf
from django.views.decorators.csrf import csrf_exempt
import requests
from django.contrib.auth.models import User
from chat.models import ChatUser,ChatRoom,ChatMessage
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
        return { 'status': 0, 'message': 'Room is exist', 'room_id': str(room_id) }

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
    tpa = Tpa.objects.get(name=request.POST['app_name'])
    owner = ChatUser.objects.get(tpa=tpa,user_id=int(request.POST['owner_id']))
    room = ChatRoom.objects.get(tpa=tpa,id=int(request.POST['room_id']))
    cm = ChatMessage()
    cm.tpa = tpa
    cm.user = owner
    cm.room = room
    cm.message = request.POST['message']
    gender = owner.gender
    cm.save()
    return  { 'status': 0, 'message': request.POST['message'], 'room_id': str(room.id), 'owner_id': str(owner.id) }

@json_view
def get_message(request,room_id):
    '''
    Function get message in DB for room and app_name

    [server]/api/[room_id]/get_message

    Example: http://chat.localhost/api/23/get_message
    '''
    #import pdb; pdb.set_trace()
    lst_chat_message = []
    room = ChatRoom.objects.get(id=int(room_id))
    message = ChatMessage.objects.filter(room=room)
    for m in message:
        lst_chat_message.append({'id':m.user.id, 'user_id':m.user.user_id, 'gender':m.gender,'message':m.message,'created':m.created })
    return  { 'status': 0, 'message': lst_chat_message }

@json_view
def invite(request,app_name,owner_id,contact_id):
    '''
    Function send owner invite in opponent 
    '''
    print 'jjjjjjjjj'
    #apiconf = read_conf()
    #app_name = apiconf['config']['app_name']
    _add_contact(app_name,owner_id,contact_id)
    mes = { 'action': 'update_contact' }
    r = '%s_%s' % (app_name, owner_id)
    bclient.publish(r, json.dumps(mes))
    return _get_room_or_create(app_name,owner_id,contact_id)
