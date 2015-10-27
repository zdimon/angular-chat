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

@json_view
def get_online_except_contact(request,app_name,user_id):
    '''
    Function return list of users with opposite gender who are online except those who is not in contact list.

    [server]/api/[app_name]/[user_id]/get_online_except_contact

    Example: http://chat.localhost/api/tpa1com/150031/get_online_except_contact
    '''
    userlst_profile = []
    tpa = Tpa.objects.get(name=app_name)
    if user_id == 'undefined':
        #users_online = ChatUser.objects.filter(tpa=tpa,is_online=1)
        users_online = []
    else:
        owner = ChatUser.objects.get(tpa=tpa,user_id=user_id)
        users_online = ChatUser.objects.filter(tpa=tpa,is_online=1).exclude(gender=owner.gender)
        cc = ChatContacts.objects.filter(tpa=tpa,owner=owner)
        for c in cc:
            users_online = users_online.exclude(id=c.contact.id)
    for u in users_online:        
        userlst_profile.append(serialize_user(u))
    return { 'status': 0, 'message': 'ok', 'user_list': userlst_profile }




@json_view
def get_online(request,app_name,user_id):
    '''
    Function return list of users with opposite gender who are on line

    [server]/api/[app_name]/[user_id]/get_online

    Example: http://chat.localhost/api/tpa1com/150031/get_online
    '''
    userlst_profile = []
    tpa = Tpa.objects.get(name=app_name)
    if user_id == 'undefined':
        return { 'status': 0, 'message': 'ok', 'user_list': {} }
    else:
        try:
            owner = ChatUser.objects.get(tpa=tpa,user_id=user_id)
        except:
            url = get_url_by_name('get_profile_from_tpa',{'user_id':user_id,'app_name':app_name,'signal_server': TPA_SERVER})
            responce = requests.get(url)
            owner = ChatUser.objects.get(tpa=tpa,user_id=user_id)
        users_online = ChatUser.objects.filter(tpa=tpa,is_online=1).exclude(gender=owner.gender)
        for u in users_online:        
            userlst_profile.append(serialize_user(u))
    return { 'status': 0, 'message': 'ok', 'user_list': userlst_profile }



@json_view
def get_online_ids(request,app_name,user_id):
    '''
    Function return list of users (IDs) with opposite gender who are on line and not in contact list

    [server]/api/[app_name]/[user_id]/get_online_ids

    Example: http://chat.localhost/api/tpa1com/150031/get_online_ids
    '''
    userlst_profile = []
    tpa = Tpa.objects.get(name=app_name)
    owner = ChatUser.objects.get(tpa=tpa,user_id=user_id)
    users_online = ChatUser.objects.filter(tpa=tpa,is_online=1).exclude(gender=owner.gender)
    contacts = []
    for c in ChatContacts.objects.filter(owner=owner):
        contacts.append(int(c.contact.user_id))
    print contacts
    for u in users_online: 
        if not u.user_id in contacts:       
            userlst_profile.append(u.user_id)
    return { 'status': 0, 'message': 'ok', 'count': len(userlst_profile), 'user_list': userlst_profile }


@csrf_exempt
@json_view
def send_message(request):
    '''
    Function make a request to send message to the user's inbox'.

    parameters by POST: app_name,owner_id,contact_id,message

    [server]/api/send_message

    Example: http://chat.localhost/api/send_message
    '''
    #import pdb; pdb.set_trace() 
    b = json.loads(request.body)
    print b
    tpa = Tpa.objects.get(name=b['app_name'])
    owner = ChatUser.objects.get(tpa=tpa,user_id=int(b['owner_id']))

  
    return  { 'status': 0 }
    







