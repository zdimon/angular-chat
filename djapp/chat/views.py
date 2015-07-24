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
from utils.util import read_conf, get_url_by_name
import datetime
from utils.db import MyDB
from chat.views_api.contact import *
from chat.views_api.auth import * 
from jsonview.decorators import json_view

bd = MyDB()

def test(request):
    t = loader.get_template('test.html')
    users = bd.select('select * from users_info')
    cont = {}
    userslst = []
    for u in users.record:
        userslst.append({'name': u['name'],  'user_id': u['user_id']})
    cont = {'users': userslst}
    c = RequestContext(request,cont)
    return HttpResponse(t.render(c))


def home(request):
    t = loader.get_template('base.html')
    c = RequestContext(request,{})
    return HttpResponse(t.render(c))

@json_view
def get_online(request,app_name):
    '''
    Function return list users is on line

    [server]/api/[app_name]/get_online

    Example: http://chat.localhost/api/tpa1com/get_online
    '''
    userlst_profile = []
    tpa = Tpa.objects.get(name=app_name)
    for u in ChatUser.objects.filter(tpa=tpa,is_online=1):
        userlst_profile.append(serialize_user(u))
    return { 'status': 0, 'message': 'ok', 'user_list': userlst_profile }

@json_view
def get_contact_list(request,app_name,user_id):
    '''
    Function return contact list for current user 

    [server]/api/[app_name]/[user_id]/get_contact_list

    Example: http://chat.localhost/api/tpa1com/14/get_contact_list
    '''
    contactlst = []
    tpa = Tpa.objects.get(name=app_name)
    owner = ChatUser.objects.filter(tpa=tpa,user_id=user_id)
    for c in ChatContacts.objects.filter(owner=owner):
        contactlst.append({'owner':c.owner.name,'contact':c.contact.name})
    return { 'status': 0, 'message': 'ok', 'contact_list': contactlst }
 
        

def has_opponent(request,user_id):
    out = {
        'status': 1,
        'contact_id': 5
    }
    return HttpResponse(json.dumps(out), content_type='application/json')  
 

@json_view
def get_profile_from_tpa(request,user_id):
    '''
    Function get profile user from outer DB (Tpa) and 
    if user not exist in our DB save into our DB.

    [server]/api/get_profile_from_tpa/[user_id]

    Example: http://chat.locahost/api/get_profile_from_tpa/14
    '''
    apiconf = read_conf()
    tpa = Tpa.objects.get(name=apiconf['config']['app_name'])
    try:
        ChatUser.objects.get(user_id=user_id,tpa=tpa)
        out = {
                'status': 1,
                'message': 'User is exits in Our DB',
                }
    except:
        users = bd.select('select * from users_info where user_id = %d' % int(user_id))
        for u in users.record:
            print u['name'], u['last_name']
            out = { 'status': 0, 'user_profile': {'user_id':u['user_id'],'name':u['name'],'birthday': datetime.datetime.fromtimestamp(u['birthday']).strftime('%Y-%m-%d'),'country':u['country'],'city':u['city'],'culture':u['languages']}
                  }
        save_profile_in_our_db(out['user_profile'])
    return out 


def save_profile_in_our_db(dict_profile_from_tpa):
    apiconf = read_conf()
    u = ChatUser()
    u.user_id = dict_profile_from_tpa['user_id']
    u.name = dict_profile_from_tpa['name']
    u.birthday = dict_profile_from_tpa['birthday']
    u.country = dict_profile_from_tpa['country']
    u.city = dict_profile_from_tpa['city']
    u.culture = dict_profile_from_tpa['culture']
    tpa = Tpa.objects.get(name=apiconf['config']['app_name'])
    u.tpa = tpa
    u.save()

def get_profile(request,user_id):
    try:
        u_name = ChatUser.objects.get(user_id=user_id)
        out = {
            'status': 0,
            'user_profile': serialize_user(u_name)
        }
        return HttpResponse(json.dumps(out), content_type='application/json')
    except:
        url = get_url_by_name('get_profile_from_tpa',{'user_id':user_id})
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

def serialize_user(user):
    return ({'id':user.id, 'user_id':user.user_id,'gender':user.gender,'name':user.name,
                    'birthday':str(user.birthday),
                    'country':user.country,'city':user.city,'image':user.image,
                    'profile_url':user.profile_url,'culture':user.culture,
                    'is_camera_active':user.is_camera_active, 
                    'is_invisible': user.is_invisible, 
                    'is_invitation_enabled': user.is_invitation_enabled})

