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

         Example: http://chat.localhost/api/150014/login   

            http://chat.localhost/api/150043/login
    
            http://chat.localhost/api/150031/login

        in session to determitate authentication status 
    '''
    try:
        cuser = ChatUser.objects.get(user_id=user_id)
    except:
        url = get_url_by_name('get_profile_from_tpa',{'user_id':user_id})
        print 'REQUEST_____%s' % url
        responce = requests.get(url)
        cuser = ChatUser.objects.get(user_id=user_id)
    request.session['is_auth'] = 'true'
    request.session['user_id'] = user_id
    #return { 'status': 0, 'user_id': user_id, 'username': cuser.name }
    return redirect('http://chat.localhost/video-chat')
     
 

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


    






