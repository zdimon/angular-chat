# -*- coding: utf-8 -*-
import json
from django.http import HttpResponse
from jsonview.decorators import json_view
from django.shortcuts import redirect
from utils.util import read_conf, get_url_by_name
from django.views.decorators.csrf import csrf_exempt
import requests
from django.contrib.auth.models import User
from chat.models import ChatUser,ChatRoom
from chat.models import Tpa
from utils.util import read_conf, serialize_user
from utils.db import MyDB

bd = MyDB()


@json_view
def get_room_or_create(request,app_name,caler_id,opponent_id):
    '''
    Function return existed room identifier or create new room.
    Also it create two records in ChatUser2Room model.

    [server]/api/[app_name]/[caler_id]/[opponent_id]/get_online

    Example: http://chat.localhost/api/tpa1com/14/40/get_online
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



    







