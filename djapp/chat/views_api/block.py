import json
from django.http import HttpResponse
from jsonview.decorators import json_view
from django.shortcuts import redirect
from utils.util import read_conf, get_url_by_name
from django.views.decorators.csrf import csrf_exempt
import requests
from django.contrib.auth.models import User
from chat.models import ChatUser, Tpa, ChatUserBlocked

import brukva
bclient = brukva.Client()
bclient.connect()


@json_view
def block_user(request,user_id,blocked_id,app_name):
    ''' 
        Request to block user.


        [server]/api/[user_id]/[blocked_id]/app_name/block_user

        Example: http://chat.localhost/api/150041/150020/tpa1com/block_user

        Return 1: {'status': 0, 'message': 'ok'}

        Return 2: {'status': 1, 'message': 'user not found'}

        Return 3: {'status': 1, 'message': 'user is already blocked'}

    '''
    pass


    
@json_view
def unblock_user(request,user_id,blocked_id,app_name):
    ''' 
        Request to unblock user.


        [server]/api/[user_id]/[blocked_id]/app_name/block_user

        Example: http://chat.localhost/api/150041/150020/tpa1com/block_user

        Return 1: {'status': 0, 'message': 'ok'}

        Return 2: {'status': 1, 'message': 'user not found'}


    '''
    pass


