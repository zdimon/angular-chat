import json
from django.http import HttpResponse
from jsonview.decorators import json_view
from django.shortcuts import redirect
from utils.api_router import get_url_by_name
from django.views.decorators.csrf import csrf_exempt
import requests
from django.contrib.auth.models import User
from chat.models import ChatUser, ChatContacts
from chat.models import Tpa
from utils.util import serialize_user, get_url_by_name
from djapp.local import TPA_SERVER
import brukva
bclient = brukva.Client()
bclient.connect()
from utils.db import MyDB
bd = MyDB()
import time 


@json_view
def set_connected(request,app_name,user_id,source):
    tpa = Tpa.objects.get(name=app_name)
    user = ChatUser.objects.get(tpa=tpa,user_id=user_id)
    user.is_online = 1
    user.activity = int(time.time())
    user.save()
    #if(source=='chat_side'):
    mes1 = {'action': 'update_users_online'}
    mes2 = {'action': 'set_me_online', 'uid': user_id}
    for u in ChatUser.objects.filter(is_online=1).exclude(user_id=user_id):
    #for u in ChatUser.objects.all().exclude(user_id=user_id):
        bclient.publish('%s_%s' % (app_name,u.user_id), json.dumps(mes1))
        bclient.publish('%s_%s' % (app_name,u.user_id), json.dumps(mes2))
        
    # TODO
    bd.update('update users set online=1 where login=%s' % user_id)
    return { 'status': 0, 'message': 'ok' } 



@json_view
def set_disconnected(request,app_name,user_id,source):
    tpa = Tpa.objects.get(name=app_name)
    user = ChatUser.objects.get(tpa=tpa,user_id=user_id)
    user.is_online = 0
    user.is_camera_active = 0
    user.save()
    mes1 = {'action': 'update_users_online'}
    mes2 = {'action': 'set_me_offline', 'uid': user_id}
    for u in ChatUser.objects.filter(is_online=1).exclude(user_id=user_id):
        bclient.publish('%s_%s' % (app_name,u.user_id), json.dumps(mes1))
        bclient.publish('%s_%s' % (app_name,u.user_id), json.dumps(mes2))
        print 'send to %s_%s' % (app_name,u.user_id)
    # TODO
    bd.update('update users set online=0 where login=%s' % user_id)  
    # close active rooms
    ssql = '''select chat_chatroom.id
            from  chat_chatroom, chat_chatuser2room, chat_chatuser
            where chat_chatroom.id = chat_chatuser2room.room_id and
             chat_chatuser2room.user_id=chat_chatuser.id and
             chat_chatroom.is_closed = 0 and
             chat_chatuser.user_id = %s''' % user_id
    rooms = bd.select(ssql)
    for r in rooms.record:             
        print 'CLOSE ROOM %s for user %s' % (r['id'],user_id)
        bd.update('update chat_chatroom set is_charging_text = 0, is_charging_video = 0, is_charging_audio = 0, is_closed=1 where chat_chatroom.id = %s' % r['id'])      
    return { 'status': 0, 'message': 'ok' } 


@json_view
def accept_invitation(request,app_name,user_id):
    '''
    Function allows user to accept all the invitations from another users with opposite gender.

    [server]/api/[app_name]/[user_id]/accept_invitation

    Example: http://chat.localhost/api/tpa1com/150031/accept_invitation
    '''
    tpa = Tpa.objects.get(name=app_name)
    user = ChatUser.objects.get(tpa=tpa,user_id=user_id)
    user.is_invitation_enabled = True
    user.save()
    return { 'status': 0, 'message': 'ok' }


@json_view
def decline_invitation(request,app_name,user_id):
    '''
    Function does not allow user to accept all the invitations from another users with opposite gender.

    [server]/api/[app_name]/[user_id]/decline_invitation

    Example: http://chat.localhost/api/tpa1com/150031/decline_invitation
    '''
    tpa = Tpa.objects.get(name=app_name)
    user = ChatUser.objects.get(tpa=tpa,user_id=user_id)
    user.is_invitation_enabled = False
    user.save()
    return { 'status': 0, 'message': 'ok' }


@json_view
def check_accessebility(request,app_name,user_id):
    '''
    Function checks accessebility of the user to accept invitation.

    [server]/api/[app_name]/[user_id]/check_accessebility

    Example: http://chat.localhost/api/tpa1com/150031/check_accessebility
    '''
    tpa = Tpa.objects.get(name=app_name)
    user = ChatUser.objects.get(tpa=tpa,user_id=user_id)
    if (user.is_invitation_enabled == False):
        return { 'status': 1, 'message': '%s is temporary unvailable' % user.name }
    else:
        return { 'status': 0, 'message': 'ok' }


@json_view
def say_busy(request,user_id,opponent_id,app_name):
    ''' 
        Send message to opponet about youa are busy now

        [server]/api/[app_name]/[user_id]/[opponent_id]/say_busy

        Example: http://chat.localhost/api/tpa1com/150040/150042/say_busy

        Return: {'status': 0, message: 'ok'}
    '''
    tpa = Tpa.objects.get(name=app_name)
    opponent = ChatUser.objects.get(tpa=tpa,user_id=opponent_id)
    user = ChatUser.objects.get(tpa=tpa,user_id=user_id)
    message = { 'action': 'say_busy', 'message': 'Sorry but I am busy now.', 'user_profile': serialize_user(user) }
    opponent_chanel = '%s_%s' % (app_name, opponent_id)
    bclient.publish(opponent_chanel, json.dumps(message))    
    return {'status': 0, 'message': 'ok'}


@json_view
def say_close(request,user_id,opponent_id,app_name):
    ''' 
        Send message to opponet about you are close invitation window

        [server]/api/[app_name]/[user_id]/[opponent_id]/say_close

        Example: http://chat.localhost/api/tpa1com/150040/150042/say_close

        Return: {'status': 0, message: 'ok'}
    '''
    tpa = Tpa.objects.get(name=app_name)
    opponent = ChatUser.objects.get(tpa=tpa,user_id=opponent_id)
    user = ChatUser.objects.get(tpa=tpa,user_id=user_id)
    message = { 'action': 'say_busy', 'message': '%s is occupied at the moment.' % user.name, 'user_profile': serialize_user(user) }
    opponent_chanel = '%s_%s' % (app_name, opponent_id)
    bclient.publish(opponent_chanel, json.dumps(message))    
    return {'status': 0, 'message': 'ok'}



