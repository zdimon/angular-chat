import json
from django.http import HttpResponse
from jsonview.decorators import json_view
from django.shortcuts import redirect
from django.views.decorators.csrf import csrf_exempt
import requests
from django.contrib.auth.models import User
from chat.models import ChatUser, Tpa
from utils.api_router import get_url_by_name
from utils.util import serialize_user
import brukva
bclient = brukva.Client()
bclient.connect()
from djapp.local import TPA_SERVER
from utils.db import MyDB
bd = MyDB()


@json_view
def get_favorites(request,user_id,app_name):
    ''' 
        Get favorite list

        [server]/api/[app_name]/[user_id]/get_favorites

        Example: http://chat.localhost/api/tpa1com/150040/get_favorites

        Return: {'status': 0, message: 'ok'}
    ''' 
    tpa = Tpa.objects.get(name=app_name)
    get_fav_url = tpa.favorite_url
    fav = requests.post(get_fav_url, json=json.dumps(request.body)).content
    print 'REQUEST %s content %s' % (get_fav_url, fav)
    fav = json.loads(fav)  
    return {'status': 0, 'favorites': fav}


@json_view
def del_favorite(request,user_id,opponent_id,app_name):
    ''' 
        Delete favorite 

        [server]/api/[app_name]/[user_id]/[opponent_id]/get_favorite

        Example: http://chat.localhost/api/tpa1com/150040/150045/del_favorit

        Return: {'status': 0, message: 'ok'}
    '''
    tpa = Tpa.objects.get(name=app_name)
    opponent = ChatUser.objects.get(tpa=tpa,user_id=opponent_id)  
    return {'status': 0, 'message': 'ok'}


@json_view
def add_favorite(request,user_id,opponent_id,app_name):
    ''' 
        Add favorite 

        [server]/api/[app_name]/[user_id]/[opponent_id]/add_favorite

        Example: http://chat.localhost/api/tpa1com/150040/150045/add_favorite

        Return: {'status': 0, message: 'ok'}
    '''
    tpa = Tpa.objects.get(name=app_name)
    return {'status': 0, 'message': 'ok'}




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
    message = { 'action': 'say_busy', 'message': 'Sorry but I am busy now.', 'user_profile': serialize_user(opponent) }
    opponent_chanel = '%s_%s' % (app_name, opponent_id)
    bclient.publish(opponent_chanel, json.dumps(message))    
    return {'status': 0, 'message': 'ok'}


@json_view
def get_balance(request,user_id,app_name):
    ''' 
        Get user's balance

        [server]/api/[app_name]/[user_id]/get_balance

        Example: http://chat.localhost/api/tpa1com/150040/get_balance

        Return: {'status': 0, 'user_id': 150040, 'balance': 35}
    '''
    
    #try:
    sql = 'select coins from users where login="%s"' % user_id
    user = bd.get(sql)
    #print(user)
    #print '---'+str(user['coins'])
    if user['coins']<3:
        status = 1
    else:
        status = 0
    return {'status': status, 'user_id': user_id, 'balance': user['coins']}
    #except:
    #    return {'status': 1, 'id': 0}


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
        return {'status': 0, 'id': request.session['user_id']}
    except:
        return {'status': 1, 'id': 0}
    

@json_view
def login(request,user_id, app_name):
    ''' 
        Login function. Set couple variables
 
             request.session['is_auth']

             request.session['user_id']  

            [server]/api/[user_id]/[app_name]login  

         Example: http://chat.localhost/api/150014/tpa1com/login   

            http://chat.localhost/api/150043/tpa1com/login
    
            http://chat.localhost/api/150031/tpa1com/login

        in session to determitate authentication status 
    '''
    try:
        cuser = ChatUser.objects.get(user_id=user_id)
    except:
        url = get_url_by_name('get_profile_from_tpa',{'user_id':user_id, 'app_name': app_name})
        print 'REQUEST_____%s' % url
        responce = requests.get(url)
        cuser = ChatUser.objects.get(user_id=user_id)
    request.session['is_auth'] = 'true'
    request.session['user_id'] = user_id
    #return { 'status': 0, 'user_id': user_id, 'username': cuser.name }
    from djapp.settings import TPA_SERVER
    return redirect('http://%s/video-chat' % TPA_SERVER)
     



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


    







