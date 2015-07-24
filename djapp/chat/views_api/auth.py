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

        Example: http://localhost/api/is_auth.

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

        Example: http://localhost/api/23/login.   

        in session to determitate authentication status 
    '''
    request.session['is_auth'] = 'true'
    request.session['user_id'] = user_id
    return { 'status': 0 }
     
 

@json_view
def logout(request):
    ''' 
        Logout function. 

        Delete variables request.session['is_auth'] and request.session['user_id'] from session 
    '''
    del request.session['is_auth']
    del request.session['user_id']
    return { 'status': 0 }







