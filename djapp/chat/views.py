from django.shortcuts import render
import json
from django.http import HttpResponse
from django.template import loader, RequestContext
from django.contrib.auth.models import User
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import login as login_user
from chat.models import Tpa, ChatUser, ChatContacts
from djapp.settings import DATABASES
import PySQLPool
import requests
from utils.util import read_conf, get_url_by_name, serialize_user
import datetime
from utils.db import MyDB
from chat.views_api.contact import *
from chat.views_api.auth import * 
from chat.views_api.online import *
from chat.views_api.room import *
from chat.views_api.video import *
from jsonview.decorators import json_view

bd = MyDB()

    #users = bd.select('select * from users_info')
    #bd.update('update chat_chatuser set is_online=0')
    #for u in users.record:
    #    userslst.append({'name': u['name'],  'user_id': u['user_id']}) 


def config(request,app_name):
    tpa = Tpa.objects.get(name=app_name)
    t = loader.get_template('config.js.tpl')
    c = RequestContext(request,{'tpa':tpa})
    return HttpResponse(t.render(c))    


@csrf_exempt
@json_view
def charge(request):
    '''
        Input data
        { 'action': 'video_charge', 
          'user_id': 150040, 
          'opponent_id': 150042, 
          'room_id': 23 
        }        
    '''
    json_data = json.loads(request.body)
    sql = 'select id,coins from users where login="%s"' % json_data['user_id']
    user = bd.get(sql)
    if json_data['price']<user['coins']:
        new_coins = user['coins'] - json_data['price']
        sql = 'update users set coins=%s where id=%d' % (new_coins,user['id'])
        print sql
        bd.update(sql)
        status = 0
    else:
        status = 1
    return {'user_id': json_data['user_id'], 'account': user['coins'], 'status': status}


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
def get_profile_from_tpa(request,user_id,app_name):
    '''
    Function get profile user from outer DB (Tpa) and 
    if user not exist in our DB save into our DB.

    [server]/api/get_profile_from_tpa/[user_id]

    Example: http://chat.locahost/api/get_profile_from_tpa/14
    '''
    tpa = Tpa.objects.get(name=app_name)
    try:
        ChatUser.objects.get(user_id=user_id,tpa=tpa)
        out = {
                'status': 1,
                'message': 'User is exits in Our DB',
                }
    except:
        u_login = bd.get('select id,login, role_id from users where login= %s' % int(user_id))
        u = bd.get('select * from users_info where user_id = %d' % int(u_login['id']))
        
        try:
            u['name']
        except:
            return {'status': 1, 'message': 'Profile does not exist!'}

        u_photo = bd.get('select image from users_photos where user_id = %d and main = 1' % int(u_login['id']))
        try:
            photo = u_photo['image']
        except:
            photo = ''

        if u_login['role_id']==3:
            gender = 'w'
        else:
            gender = 'm'

        out = { 'status': 0, 'user_profile': {
                                                'user_id':u_login['login'],
                                                'name':u['name'],
                                                'birthday': datetime.datetime.fromtimestamp(u['birthday']).strftime('%Y-%m-%d'),
                                                'country':u['country'],
                                                'city':u['city'],
                                                'culture':u['languages'], 
                                                'gender': gender, 
                                                'image': photo, 
                                                'profile_url': '/lady/profile/%s' % u_login['login'],
                                                'tpa': tpa.name
                                                }
                  }
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



