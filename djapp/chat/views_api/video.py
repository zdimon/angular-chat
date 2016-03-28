import json
from django.http import HttpResponse
from jsonview.decorators import json_view
from django.shortcuts import redirect
from utils.api_router import get_url_by_name
from django.views.decorators.csrf import csrf_exempt
import requests
from django.contrib.auth.models import User
from chat.models import ChatUser, Tpa, ChatRoom, ChatUser2Room
from utils.db import MyDB
bd = MyDB()
from utils.util import serialize_user
from utils.redisender import bclient
bclient = bclient()

@json_view
def opponent_mic_on(request,user_id,opponent_id,room_id,app_name):
    ''' 
        Request gives command to opponent authomatically enable mic.

        [server]/api/[user_id]/[opponent_id]/both_mic_on

        Example: http://chat.localhost/api/150041/150034/both_mic_on

        Return: {'status': 0, 'message': 'ok'}
    '''
    tpa = Tpa.objects.get(name=app_name)
    room = ChatRoom.objects.get(pk=room_id)
    room.is_charging_audio = True
    room.save()
    chanel = '%s_%s' % (app_name,opponent_id)
    profile = ChatUser.objects.get(user_id=opponent_id, tpa=tpa)
    mes = { 'action': 'opponent_mic_on', 'profile': serialize_user(profile) }
    bclient.publish(chanel, json.dumps(mes))     
    return {'status': 0, 'message': 'ok'}


@json_view
def opponent_mic_off(request,user_id,opponent_id,room_id,app_name):
    ''' 
        Request gives command to opponent authomatically disable mic.

        [server]/api/[user_id]/[opponent_id]/both_mic_on

        Example: http://chat.localhost/api/150041/150034/both_mic_on

        Return: {'status': 0, 'message': 'ok'}
    '''
    tpa = Tpa.objects.get(name=app_name)
    chanel = '%s_%s' % (app_name,opponent_id)
    room = ChatRoom.objects.get(pk=room_id)
    room.is_charging_audio = True
    room.save()
    profile = ChatUser.objects.get(user_id=opponent_id, tpa=tpa)
    mes = { 'action': 'opponent_mic_off', 'profile': serialize_user(profile) }
    bclient.publish(chanel, json.dumps(mes))     
    return {'status': 0, 'message': 'ok'}




@json_view
def alert_mic_on(request,user_id,opponent_id,app_name):
    ''' 
        Request alert opponent about nessesity of turning mic on.

        [server]/api/[user_id]/[opponent_id]/alert_mic_on

        Example: http://chat.localhost/api/150041/150034/alert_mic_on

        Return: {'status': 0, 'message': 'ok'}
    '''
    tpa = Tpa.objects.get(name=app_name)
    chanel = '%s_%s' % (app_name,opponent_id)
    profile = ChatUser.objects.get(user_id=opponent_id, tpa=tpa)
    mes = { 'action': 'alert_mic_on', 'profile': serialize_user(profile) }
    bclient.publish(chanel, json.dumps(mes))     
    return {'status': 0, 'message': 'ok'}


@json_view
def alert_mic_off(request,user_id,opponent_id,app_name):
    ''' 
        Request alert opponent about nessesity of turning mic off.

        [server]/api/[user_id]/[opponent_id]/alert_mic_on

        Example: http://chat.localhost/api/150041/150034/alert_mic_on

        Return: {'status': 0, 'message': 'ok'}
    '''
    tpa = Tpa.objects.get(name=app_name)
    chanel = '%s_%s' % (app_name,opponent_id)
    profile = ChatUser.objects.get(user_id=opponent_id, tpa=tpa)
    mes = { 'action': 'alert_mic_off', 'profile': serialize_user(profile) }
    bclient.publish(chanel, json.dumps(mes)) 
    return {'status': 0, 'message': 'ok'}


@json_view
def only_mic_on(request,user_id,opponent_id,app_name):
    ''' 
        Request alert opponent about nessesity of turning mic on whem woman turn only mic.

        [server]/api/[user_id]/[opponent_id]/only_mic_on

        Example: http://chat.localhost/api/150041/150034/only_mic_on

        Return: {'status': 0, 'message': 'ok'}
    '''
    tpa = Tpa.objects.get(name=app_name)
    chanel = '%s_%s' % (app_name,opponent_id)
    profile = ChatUser.objects.get(user_id=opponent_id, tpa=tpa)
    mes = { 'action': 'only_mic_on', 'profile': serialize_user(profile) }
    bclient.publish(chanel, json.dumps(mes))   
    profile = ChatUser.objects.get(user_id=opponent_id, tpa=tpa)
    my_chanel = '%s_%s' % (app_name,user_id)
    mes = { 'action': 'opponent_mic_on', 'profile': serialize_user(profile) }
    #bclient.publish(my_chanel, json.dumps(mes))   
    return {'status': 0, 'message': 'ok'}


@json_view
def only_mic_off(request,user_id,opponent_id,app_name):
    ''' 
        Request alert opponent about nessesity of turning mic off whem woman turn only mic.

        [server]/api/[user_id]/[opponent_id]/only_mic_on

        Example: http://chat.localhost/api/150041/150034/only_mic_on

        Return: {'status': 0, 'message': 'ok'}
    '''
    tpa = Tpa.objects.get(name=app_name)
    chanel = '%s_%s' % (app_name,opponent_id)
    profile = ChatUser.objects.get(user_id=opponent_id, tpa=tpa)
    mes = { 'action': 'only_mic_off', 'profile': serialize_user(profile) }
    bclient.publish(chanel, json.dumps(mes)) 
    return {'status': 0, 'message': 'ok'}



@json_view
def turn_mic_on(request,user_id,app_name):
    ''' 
        Request turns mic on.

        [server]/api/[user_id]/turn_mic_on

        Example: http://chat.localhost/api/150041/turn_mic_on

        Return: {'status': 0, 'message': 'ok'}
    '''
    tpa = Tpa.objects.get(name=app_name)
    owner = ChatUser.objects.get(user_id=user_id, tpa=tpa)
    sql = "select chat_chatroom.id from chat_chatuser2room, chat_chatroom where chat_chatroom.id = chat_chatuser2room.room_id and chat_chatroom.is_charging_video = 1 and chat_chatroom.is_closed = 0"
    rooms = bd.select(sql)
    for r in rooms.record:
        bd.update('update chat_chatroom set is_charging_audio=1 where id = %s' % r['id'])
    return {'status': 0, 'message': 'ok'}

@json_view
def turn_mic_off(request,user_id,app_name):
    ''' 
        Request turns mic off.

        [server]/api/[user_id]/turn_mic_on

        Example: http://chat.localhost/api/150041/turn_mic_on

        Return: {'status': 0, 'message': 'ok'}
    '''
    tpa = Tpa.objects.get(name=app_name)
    owner = ChatUser.objects.get(user_id=user_id, tpa=tpa)
    sql = "select chat_chatroom.id from chat_chatuser2room, chat_chatroom where chat_chatroom.id = chat_chatuser2room.room_id and chat_chatroom.is_charging_video = 1"
    rooms = bd.select(sql)
    for r in rooms.record:
        bd.update('update chat_chatroom set is_charging_audio=0 where id = %s' % r['id'])
    return {'status': 0, 'message': 'ok'}



@json_view
def show_my_cam(request,user_id,app_name):
    ''' 
        Request fires after adding video block into the DOM.

        Here we send broadcast request to users online to show video indicator.    

        [server]/api/[user_id]/show_my_cam

        Example: http://chat.localhost/api/150041/show_my_cam

        Return: {'status': 0, 'message': 'ok'}
    '''
    try:
        tpa = Tpa.objects.get(name=app_name)
        owner = ChatUser.objects.get(user_id=user_id, tpa=tpa)
        owner.is_camera_active = True
        owner.save()
        tpa = Tpa.objects.get(name=app_name)
        camerausers = []
        for ou in ChatUser.objects.filter(is_camera_active=1).all():
            camerausers.append(ou.user_id)
        print 'wcam %s' % camerausers
        users = ChatUser.objects.filter(is_online=1).all()
        for u in users:
            mes = { 'action': 'update_cam_indicators', 'data': camerausers, 'owner': owner.user_id, 'cam_status': 'on' }
            bclient.publish('%s_%s' % (tpa.name, u.user_id), json.dumps(mes))    
        return {'status': 0, 'message': 'ok'}
    except Exception, e:
        return {'status': 1, 'message': e}



@json_view
def hide_my_cam(request,user_id,app_name):
    ''' 
        Request fires after removing video block from the DOM.

        Here we send broadcast request to users online to hide video indicator.    

        [server]/api/[user_id]/hide_my_cam

        Example: http://chat.localhost/api/150041/hide_my_cam

        Return: {'status': 0, 'message': 'ok'}
    '''
    try:
        tpa = Tpa.objects.get(name=app_name)
        owner = ChatUser.objects.get(user_id=user_id, tpa=tpa)
        owner.is_camera_active = False
        owner.save()
        camerausers = []
        for ou in ChatUser.objects.filter(is_camera_active=1).all():
            camerausers.append(ou.user_id)
        tpa = Tpa.objects.get(name=app_name)
        users = ChatUser.objects.filter(is_online=1).all()
        for u in users:
            mes = { 'action': 'update_cam_indicators', 'data': camerausers, 'owner': owner.user_id, 'cam_status': 'off' }
            bclient.publish('%s_%s' % (tpa.name, u.user_id), json.dumps(mes))  
        # mark rooms as no video charging
        for c2r in ChatUser2Room.objects.filter(user=owner).all():
            room = c2r.room
            room.is_charging_video = False
            room.save()  
        return {'status': 0, 'message': 'ok'}
        

    except Exception, e:
        return {'status': 1, 'message': e}



@json_view
def show_opponent_cam(request,user_id,opponent_id,app_name,room_id):
    ''' 
        Request fires after user turn apponent cam on.

        We mark room object as with video watching.   

        Send notivication to girl about man start watching her.

        [server]/api/[user_id]/[opponent_id]/[app_name]/[room_id]/show_opponent_cam

        Example: http://chat.localhost/api/150046/150040/tpa1com/5/show_opponent_cam

        Return: {'status': 0, 'message': 'ok'}
    '''
    #tpa = Tpa.objects.get(name=app_name)
    #import pdb; pdb.set_trace()
    tpa = Tpa.objects.get(name=app_name)
    owner = ChatUser.objects.get(user_id=user_id, tpa=tpa)
    room =  ChatRoom.objects.get(pk=room_id)
    u2r = ChatUser2Room.objects.get(user=owner,room=room)
    u2r.is_video_watching = True
    u2r.save()
    if owner.gender=='m':
        room.is_charging_video = True
        room.save()
    mes = { 'action': 'i_started_watching_you', 'user_id': owner.user_id, 'opponent_id': opponent_id }
    bclient.publish('%s_%s' % (app_name, opponent_id), json.dumps(mes)) 

    if(owner.gender == 'm'):
        # deduct money
        data = []
        data.append({'action': 'video', 'app_name': app_name,  'user_id': user_id, 'opponent_id': opponent_id, 'room_id': room_id, 'price': str(tpa.price_video) })     
        print requests.post(tpa.charge_url,data=json.dumps(data)).content


    return {'status': 0, 'message': 'ok', 'user_id': user_id}



@json_view
def hide_opponent_cam(request,user_id,opponent_id,app_name,room_id):
    ''' 
        Request fires after user turn apponent cam off.

        We mark room object as without video watching.   

        [server]/api/[user_id]/[app_name]/[room_id]/hide_opponent_cam

        Example: http://chat.localhost/api/150046/tpa1com/hide_my_cam

        Return: {'status': 0, 'message': 'ok'}
    '''
    tpa = Tpa.objects.get(name=app_name)
    owner = ChatUser.objects.get(user_id=user_id, tpa=tpa)
    room =  ChatRoom.objects.get(pk=room_id)
    u2r = ChatUser2Room.objects.get(user=owner,room=room)
    u2r.is_video_watching = False
    u2r.save()
    room.is_charging_video = False
    room.save()
    mes = { 'action': 'i_stopted_watching_you', 'user_id': owner.user_id, 'opponent_id': opponent_id }
    bclient.publish('%s_%s' % (app_name, opponent_id), json.dumps(mes)) 
    return {'status': 0, 'message': 'ok', 'user_id': user_id}



@json_view
def hide_opponent_only_mic(request,user_id,opponent_id,app_name,room_id):
    ''' 
        Request fires after user turn apponent only mic off.

        We mark room object as without audio charging.   

        [server]/api/[user_id]/[app_name]/[room_id]/hide_opponent_only_mic

        Example: http://chat.localhost/api/150046/tpa1com/hide_opponent_only_mic

        Return: {'status': 0, 'message': 'ok'}
    '''
    tpa = Tpa.objects.get(name=app_name)
    room =  ChatRoom.objects.get(pk=room_id) 
    room.is_charging_audio = False
    room.save()
    return {'status': 0, 'message': 'ok', 'user_id': user_id}



@json_view
def show_opponent_only_mic(request,user_id,opponent_id,app_name,room_id):
    ''' 
        Request fires after user turn apponent only mic on.

        We mark room object as with audio charging.   

        [server]/api/[user_id]/[app_name]/[room_id]/show_opponent_only_mic

        Example: http://chat.localhost/api/150046/tpa1com/show_opponent_only_mic

        Return: {'status': 0, 'message': 'ok'}
    '''
    tpa = Tpa.objects.get(name=app_name)
    room =  ChatRoom.objects.get(pk=room_id) 
    room.is_charging_audio = True
    room.save()
    return {'status': 0, 'message': 'ok', 'user_id': user_id}








    


