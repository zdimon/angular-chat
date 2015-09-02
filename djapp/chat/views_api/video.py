import json
from django.http import HttpResponse
from jsonview.decorators import json_view
from django.shortcuts import redirect
from utils.util import read_conf, get_url_by_name
from django.views.decorators.csrf import csrf_exempt
import requests
from django.contrib.auth.models import User
from chat.models import ChatUser, Tpa, ChatRoom, ChatUser2Room

import brukva
bclient = brukva.Client()
bclient.connect()


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
        owner = ChatUser.objects.get(user_id=user_id)
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
        owner = ChatUser.objects.get(user_id=user_id)
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
    owner = ChatUser.objects.get(user_id=user_id)
    tpa = Tpa.objects.get(name=app_name)
    room =  ChatRoom.objects.get(pk=room_id)
    u2r = ChatUser2Room.objects.get(user=owner,room=room)
    u2r.is_video_watching = True
    u2r.save()
    room.is_charging_video = True
    room.save()
    mes = { 'action': 'i_started_watching_you', 'user_id': owner.user_id, 'opponent_id': opponent_id }
    bclient.publish('%s_%s' % (app_name, opponent_id), json.dumps(mes)) 

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
    owner = ChatUser.objects.get(user_id=user_id)
    room =  ChatRoom.objects.get(pk=room_id)
    u2r = ChatUser2Room.objects.get(user=owner,room=room)
    u2r.is_video_watching = False
    u2r.save()
    room.is_charging_video = False
    room.save()
    mes = { 'action': 'i_stopted_watching_you', 'user_id': owner.user_id, 'opponent_id': opponent_id }
    bclient.publish('%s_%s' % (app_name, opponent_id), json.dumps(mes)) 
    return {'status': 0, 'message': 'ok', 'user_id': user_id}






    


