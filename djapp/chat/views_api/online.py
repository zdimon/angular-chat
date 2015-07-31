import json
from django.http import HttpResponse
from jsonview.decorators import json_view
from django.shortcuts import redirect
from utils.util import read_conf, get_url_by_name
from django.views.decorators.csrf import csrf_exempt
import requests
from django.contrib.auth.models import User
from chat.models import ChatUser
from chat.models import Tpa
from utils.util import serialize_user

@json_view
def get_online(request,app_name,user_id):
    '''
    Function return list of users who are on line

    [server]/api/[app_name]/[user_id]/get_online

    Example: http://chat.localhost/api/tpa1com/150031/get_online
    '''
    userlst_profile = []
    tpa = Tpa.objects.get(name=app_name)
    cc = ChatContacts.objects.filter(tpa=tpa,user_id=user_id)
    for u in ChatUser.objects.filter(tpa=tpa,is_online=1):
        userlst_profile.append(serialize_user(u))
    return { 'status': 0, 'message': 'ok', 'user_list': userlst_profile }


    







