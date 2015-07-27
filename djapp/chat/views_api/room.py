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
def get_room_or_create(request,caler_id,caler_id):
    '''
    Function return existed room identifier or create new room.
    Also it create two records in ChatUser2Room model.

    [server]/api/[caler_id]/[caler_id]/get_online

    Example: http://chat.localhost/api/14/40/get_online
    '''
    userlst_profile = []
    tpa = Tpa.objects.get(name=app_name)
    for u in ChatUser.objects.filter(tpa=tpa,is_online=1):
        userlst_profile.append(serialize_user(u))
    return { 'status': 0, 'message': 'ok', 'user_list': userlst_profile }


    







