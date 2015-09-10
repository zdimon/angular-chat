from django.shortcuts import render
import json
from django.http import HttpResponse
from django.template import loader, RequestContext
from django.contrib.auth.models import User
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import login as login_user
from chat.models import Tpa, ChatUser, ChatContacts, ChatTransactions, ChatRoom
from djapp.settings import DATABASES
import PySQLPool
import requests
from utils.api_router import get_url_by_name
from utils.util import serialize_user
import datetime
from utils.db import MyDB
from chat.views_api.contact import *
from chat.views_api.auth import * 
from chat.views_api.online import *
from chat.views_api.room import *
from chat.views_api.video import *
from chat.views_api.block import *
from chat.views_api.status import *
from jsonview.decorators import json_view
from djapp.local import TPA_SERVER

import brukva
bclient = brukva.Client()
bclient.connect()

bd = MyDB()

    #users = bd.select('select * from users_info')
    #bd.update('update chat_chatuser set is_online=0')
    #for u in users.record:
    #    userslst.append({'name': u['name'],  'user_id': u['user_id']}) 


@json_view
def initialization(request,app_name,user_id):
    '''
        Chat initialization.
        
        Request gets follows information:
        
        1. Check if user is authenticated.

        2. User profile.

        3. Contact list.

        4. User online list.

        
    
    '''
    tpa = Tpa.objects.get(name=app_name)
    
    #1
    #is_login_url = get_url_by_name('is_login',{'user_id':user_id,'app_name':app_name,'signal_server': TPA_SERVER})
    #owner = requests.get(is_login_url).content
    #is_login = json.loads(is_login)

    #2
    get_profile_url = get_url_by_name('get_profile',{'user_id':user_id,'app_name':app_name,'signal_server': TPA_SERVER})
    owner = requests.get(get_profile_url).content
    owner = json.loads(owner)

    #3
    get_contact_url = get_url_by_name('get_contact_list',{'user_id':user_id,'app_name':app_name,'signal_server': TPA_SERVER})
    contact = requests.get(get_contact_url).content
    contact = json.loads(contact) 

    #4
    get_online_url = get_url_by_name('get_online_except_contact',{'user_id':user_id,'app_name':app_name,'signal_server': TPA_SERVER})
    online = requests.get(get_online_url).content
    online = json.loads(online)  


    return {'status': 0, 'is_login': is_login, 'online': online, 'contact': contact, 'owner': owner}



def config(request,app_name):
    tpa = Tpa.objects.get(name=app_name)
    t = loader.get_template('config.js.tpl')
    c = RequestContext(request,{'tpa':tpa})
    return HttpResponse(t.render(c))    


def create_transaction(room_id,user_id,opponent_id, app_name, price,type):
    import decimal
    print 'start transaction room_id - %s ' % room_id
    tpa = Tpa.objects.get(name=app_name)
    room = ChatRoom.objects.get(pk=room_id)
    man = ChatUser.objects.get(user_id=user_id) 
    woman = ChatUser.objects.get(user_id=opponent_id) 
    try:
        tr = ChatTransactions.objects.get(room=room,man=man,woman=woman, tpa=tpa)
        if(type=='text_chat'):
            tr.coins_text = tr.coins_text + decimal.Decimal(float(price))
        if(type=="video"):
            tr.coins_video = tr.coins_video + decimal.Decimal(float(price))
        if(type=="audio"):
            tr.coins_audio = tr.coins_audio + decimal.Decimal(float(price))
        tr.save()
    except Exception, e:
        print e
        tr = ChatTransactions()
        tr.man = man
        tr.woman = woman
        tr.tpa = tpa
        tr.room = room
        if(type=='text_chat'):
            tr.coins_text = price
            tr.coins_video = 0
            tr.coins_audio = 0
        if(type=="video"):
            tr.coins_video = price
            tr.coins_text = 0
            tr.coins_audio = 0
        if(type=="audio"):
            tr.coins_audio = price
            tr.coins_text = 0   
            tr.coins_video = 0     
        tr.save()
    

@csrf_exempt
@json_view
def charge_request(request,app_name):
    '''
        Input data
        [

            { 
              'action': 'video/text_chat', 
              'user_id': 150040, 
              'opponent_id': 150042, 
              'room_id': 23,
              'app_name': 'tpa1com',
              'price': 2 
            }
        ]    

        Make external request to application to charge money.       
        Send notification to men to update account on the page.
        
    
    '''
    
    json_data = json.loads(request.body)
    tpa = Tpa.objects.get(name=app_name)
    #print 'request to %s ' % tpa.charge_url
    res = requests.post(tpa.charge_url,json=json_data).content
    res = json.loads(res)
    #print res

    for i in res:
        mes = { 'action': 'update_balance', 'balance': i['balance'] }
        chanel = '%s_%s' % (app_name, i['user_id'])
        bclient.publish(chanel, json.dumps(mes))
        print 'send to -%s %s' %  (chanel,mes)
    return {'status': 0, 'message': 'ok'}


def home(request):
    t = loader.get_template('base.html')
    c = RequestContext(request,{})
    return HttpResponse(t.render(c))

 
        

def has_opponent(request,user_id):
    out = {
        'status': 1,
        'contact_id': 5
    }
    return HttpResponse(json.dumps(out), content_type='application/json')  
 

@json_view
def update_user(request,user_id,app_name):
    '''
         Function update or create user.
        
         Example: http://chat.locahost/api/tpa1com/150032/update_user
        
    '''
    url = get_url_by_name('get_profile_from_tpa',{'user_id':user_id,'app_name':app_name,'signal_server': TPA_SERVER})
    responce = requests.get(url)
    return {'status': 0, 'message': 'ok'}

# TODO

def _get_profile_brides(user_id, tpa):
    u_login = bd.get('select id,login, role_id from users where login= %s' % int(user_id))
    u = bd.get('select * from users_info where user_id = %d' % int(u_login['id']))
    
    try:
        u['name']
    except:
        return {'status': 1, 'message': 'Profile does not exist!'}

    u_photo = bd.get('select image from users_photos where user_id = %d and main = 1' % int(u_login['id']))
    try:
        photo = 'http://'+TPA_SERVER+'/Media/images/users/small/'+u_photo['image']
    except:
        if u_login['role_id']==3:
            photo = '/Media/pic/woman_134x179.jpg'
        else:
            photo = '/Media/pic/man_134x179.jpg'
    if u_login['role_id']==3:
        gender = 'w'
    else:
        gender = 'm'
    try:
        birth = datetime.datetime.fromtimestamp(u['birthday']).strftime('%Y-%m-%d')
    except:
        birth = '1900-01-01'
    if u['name'] == None :
        u['name']='undefined'
    out = { 'status': 0, 'user_profile': {
                                            'user_id':u_login['login'],
                                            'name':u['name'],
                                            'birthday': birth,
                                            'country':u['country'],
                                            'city':u['city'],
                                            'culture':u['languages'], 
                                            'gender': gender, 
                                            'image': photo, 
                                            'profile_url': '/lady/profile/%s' % u_login['login'],
                                            'tpa': tpa.name
                                            }
                  }
    return out

@json_view
def get_profile_from_tpa(request,user_id,app_name):
    '''
    Function get profile user from outer DB (Tpa) and 
    if user not exist in our DB save into our DB.


    [server]/api/[app_name]/get_profile_from_tpa/[user_id]

    Example: http://chat.locahost/api/tpa1com/get_profile_from_tpa/150064
    '''
    tpa = Tpa.objects.get(name=app_name)
    try:
        u = ChatUser.objects.get(user_id=user_id,tpa=tpa)
        profile = _get_profile_brides(user_id,tpa)
        update_profile_in_our_db(profile['user_profile'],u)
        out = {
                'status': 1,
                'message': 'User is exits in Our DB and has been updated',
                'profile': profile
                }
    except:
        out = _get_profile_brides(user_id, tpa)
        save_profile_in_our_db(out['user_profile'])
    return out 


def save_profile_in_our_db(dict_profile_from_tpa):
    tpa = Tpa.objects.get(name=dict_profile_from_tpa['tpa'])
    u = ChatUser()
    u.user_id = dict_profile_from_tpa['user_id']
    u.name = dict_profile_from_tpa['name']
    u.birthday = dict_profile_from_tpa['birthday']
    u.country = dict_profile_from_tpa['country']
    u.city = dict_profile_from_tpa['city']
    u.culture = dict_profile_from_tpa['culture']
    u.profile_url = dict_profile_from_tpa['profile_url']
    u.image = dict_profile_from_tpa['image']
    u.gender = dict_profile_from_tpa['gender']
    u.tpa = tpa
    u.save()

def update_profile_in_our_db(dict_profile_from_tpa, u):
    u.name = dict_profile_from_tpa['name']
    u.birthday = dict_profile_from_tpa['birthday']
    u.country = dict_profile_from_tpa['country']
    u.city = dict_profile_from_tpa['city']
    u.culture = dict_profile_from_tpa['culture']
    u.profile_url = dict_profile_from_tpa['profile_url']
    u.image = dict_profile_from_tpa['image']
    u.gender = dict_profile_from_tpa['gender']
    u.save()


def get_profile(request,user_id,app_name):
    from djapp.settings import TPA_SERVER
    try:
        tpa = Tpa.objects.get(name=app_name)
        u_name = ChatUser.objects.get(user_id=user_id,tpa=tpa)
        out = {
            'status': 0,
            'user_profile': serialize_user(u_name)
        }
        return HttpResponse(json.dumps(out), content_type='application/json')
    except:
        url = get_url_by_name('get_profile_from_tpa',{'user_id':user_id,'app_name':app_name,'signal_server': TPA_SERVER})
        print 'REQUEST TO %s' % url
        responce = requests.get(url)
        outdata = json.loads(responce.content)
        print outdata  
       
        out = {
            'status': 0,
            'message': 'ok',
            'outdata': outdata
        }
        return HttpResponse(json.dumps(out), content_type='application/json')



