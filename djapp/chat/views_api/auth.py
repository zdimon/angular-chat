import json
from django.http import HttpResponse
from jsonview.decorators import json_view
from django.shortcuts import redirect
from utils.util import read_conf, get_url_by_name
from django.views.decorators.csrf import csrf_exempt
import requests
from django.contrib.auth.models import User
from chat.models import ChatUser


@json_view
def is_auth(request,app_name):
    ''' 
        Checking if user authenticated or not.

        [server]/api/[app_name]/is_auth 

        Example: http://chat.localhost/api/tpa1com/is_auth

        Return: {'status': 0, 'user_id': request.session['user_id']}
    '''
    try:
        is_auth = request.session['is_auth']
        return {'status': 0, 'user_id': request.session['user_id']}
    except:
        return {'status': 1, 'message': 'user is not authorized'}
    

@json_view
def login(request,user_id):
    ''' 
        Login function. Set couple variables
 
             request.session['is_auth']

             request.session['user_id']  

            [server]/api/[user_id]/login  

         Example: http://chat.localhost/api/23/login   

        in session to determitate authentication status 
    '''
    request.session['is_auth'] = 'true'
    request.session['user_id'] = user_id
    return { 'status': 0 }
     
 

@json_view
def logout(request):
    ''' 
        Logout function. 
        
        [server]/api/logout

        Delete variables request.session['is_auth'] and request.session['user_id'] from session 
        Example: http://chat.localhost/api/logout
    '''
    del request.session['is_auth']
    del request.session['user_id']
    return { 'status': 0 }

@json_view
def has_opponent(request,user_id):
    '''
    [server]/api/[user_id]/has_opponent
    '''
    pass

@json_view
def get_online(request,app_name):
    '''
    [server]/api/[app_name]/get_online
    '''
    
    







