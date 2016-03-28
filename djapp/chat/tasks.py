# -*- coding: utf-8 -*-

import datetime
from celery import task
import time
from utils.api_router import get_url_by_name
from django.core.urlresolvers import reverse
from django.conf import settings
from utils.db import MyDB
bd = MyDB()
import requests
import requests

from utils.api_router import get_url_by_name

@task()
def set_online(message):
    url = get_url_by_name('set_connected',{'user_id':message["user_id"], 'app_name': message["tpa"], 'source': message['source']})
    try:
        requests.get(url)
        print 'REQUEST %s' % url
    except:
        print '!!ERROR!! can not make a request to %s' % url
    


@task(name='charge-money')
def charge_money():
    sql = '''select chat_chatroom.id, 
                    chat_chatroom.activity, 
                    chat_chatroom.is_charging_text, 
                    chat_chatroom.is_charging_video, 
                    chat_chatroom.is_charging_audio,
                    chat_tpa.price_text_chat, 
                    chat_tpa.price_video, 
                    chat_tpa.price_audio, 
                    chat_tpa.name as app_name, 
                    chat_tpa.timeout_chating
             from chat_chatroom, chat_tpa  
             where 
             chat_chatroom.tpa_id = chat_tpa.id and chat_chatroom.is_closed = 0 and
             (is_charging_text="%s" or is_charging_video="%s" or is_charging_audio="%s")''' % (1,1,1)
    rooms = bd.select(sql)
    data = []
    url = False
    for room in rooms.record: 
        #url = room['charge_url']
        url = get_url_by_name('charge_request',{ 'app_name': room["app_name"]})
        # select users from room
        sql = ''' select chat_chatuser.user_id, chat_chatuser.gender 
                  from chat_chatuser, chat_chatuser2room
                  where chat_chatuser2room.user_id = chat_chatuser.id 
                        and chat_chatuser2room.room_id = %s 
              ''' % room['id']

        users = bd.select(sql)
        for u in users.record:
            #print 'room %s user %s' % (room['id'],u['gender'])
            if u['gender'] == 'm':
                man = u['user_id']
            else:
                woman = u['user_id']

        if(room['is_charging_text']==1):
            now = int(time.time())
            timeout = room['activity']+room['timeout_chating']
            #print 'checking %s %s' % (now,timeout)
            if(now>timeout):
                sql_update = ''' update chat_chatroom set is_charging_text=0 where id = %s  ''' % room['id']
                bd.update(sql_update)
                #print 'TIMOUT   00000000'
            else:
                data.append({'action': 'text_chat', 'app_name': room['app_name'],  'user_id': man, 'opponent_id': woman, 'room_id': room['id'], 'price': str(room['price_text_chat']) })
                #print data
                

        if(room['is_charging_video']==1):     
             data.append({'action': 'video', 'app_name': room['app_name'],  'user_id': man, 'opponent_id': woman, 'room_id': room['id'], 'price': str(room['price_video']) })   

        if(room['is_charging_audio']==1):     
             data.append({'action': 'audio', 'app_name': room['app_name'],  'user_id': man, 'opponent_id': woman, 'room_id': room['id'], 'price': str(room['price_audio']) })    

    if url:  
        print "Charge request to %s " % url
        print "DATA %s" % data
        print requests.post(url,json=data).content  


