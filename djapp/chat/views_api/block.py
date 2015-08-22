import json
from django.http import HttpResponse
from jsonview.decorators import json_view
from django.shortcuts import redirect
from utils.util import read_conf, get_url_by_name
from django.views.decorators.csrf import csrf_exempt
import requests
from django.contrib.auth.models import User
from chat.models import ChatUser, Tpa, ChatBlocklist

import brukva
bclient = brukva.Client()
bclient.connect()


@json_view
def block_user(request,user_id,block_id,app_name):
    ''' 
        Request to block user.


        [server]/api/[user_id]/[block_id]/app_name/block_user

        Example: http://chat.localhost/api/150041/150020/tpa1com/block_user

        Return 1: {'status': 0, 'message': 'ok'}

        Return 2: {'status': 1, 'message': 'user not found'}

        Return 3: {'status': 1, 'message': 'user is already block'}

    '''
    try:
        tpa = Tpa.objects.get(name=app_name)
        user = ChatUser.objects.get(user_id=user_id)
        block = ChatUser.objects.get(user_id=block_id)
    except:
        return {'status': 1, 'message': 'user not found'}
    try:
        ChatBlocklist.objects.get(user_id=user_id,block_id=block_id, tpa=tpa)
        return {'status': 1, 'message': 'user is already block'}
    except:
        b = ChatBlocklist()
        b.user_id = user_id
        b.block_id = block_id
        b.tpa = tpa
        b.save()
        return {'status': 0, 'message': 'ok'}
    

    
@json_view
def unblock_user(request,user_id,block_id,app_name):
    ''' 
        Request to unblock user.


        [server]/api/[user_id]/[block_id]/app_name/block_user

        Example: http://chat.localhost/api/150041/150020/tpa1com/block_user

        Return 1: {'status': 0, 'message': 'ok'}

        Return 2: {'status': 1, 'message': 'user not found'}


    '''
    try:
        tpa = Tpa.objects.get(name=app_name)
        user = ChatUser.objects.get(user_id=user_id)
        block = ChatUser.objects.get(user_id=block_id)
    except:
        return {'status': 1, 'message': 'user not found'}
    try:
        b = ChatBlocklist.objects.get(user_id=user_id,block_id=block_id, tpa=tpa)
        b.delete()
    except:
        return {'status': 1, 'message': 'error during deleting'}



@json_view
def check_block_user(request,user_id,block_id,app_name):
    ''' 
        Request to check if user is block.


        [server]/api/[user_id]/[block_id]/app_name/check_block_user

        Example: http://chat.localhost/api/150041/150020/tpa1com/check_block_user

        Return: {'status': 0, 'block': 'yes/no'}

    '''
    try:
        tpa = Tpa.objects.get(name=app_name)
        b = ChatBlocklist.objects.get(user_id=user_id,block_id=block_id, tpa=tpa)
        return {'status': 0, 'block': 'yes'}
    except:
        return {'status': 0, 'block': 'no'}



