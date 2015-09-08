import json
from django.http import HttpResponse
from jsonview.decorators import json_view
from django.shortcuts import redirect
from utils.util import read_conf, get_url_by_name
from django.views.decorators.csrf import csrf_exempt
import requests
from django.contrib.auth.models import User
from chat.models import ChatUser, ChatContacts
from chat.models import Tpa
from utils.util import serialize_user, get_url_by_name
from djapp.local import TPA_SERVER

@json_view
def accept_invitation(request,app_name,user_id):
    '''
    Function allows user to accept all the invitations from another users with opposite gender.

    [server]/api/[app_name]/[user_id]/accept_invitation

    Example: http://chat.localhost/api/tpa1com/150031/accept_invitation
    '''
    tpa = Tpa.objects.get(name=app_name)
    user = ChatUser.objects.get(tpa=tpa,user_id=user_id)
    user.is_invitation_enabled = True
    user.save()
    return { 'status': 0, 'message': 'ok' }


@json_view
def decline_invitation(request,app_name,user_id):
    '''
    Function does not allow user to accept all the invitations from another users with opposite gender.

    [server]/api/[app_name]/[user_id]/decline_invitation

    Example: http://chat.localhost/api/tpa1com/150031/decline_invitation
    '''
    tpa = Tpa.objects.get(name=app_name)
    user = ChatUser.objects.get(tpa=tpa,user_id=user_id)
    user.is_invitation_enabled = False
    user.save()
    return { 'status': 0, 'message': 'ok' }


@json_view
def check_accessebility(request,app_name,user_id):
    '''
    Function checks accessebility of the user to accept invitation.

    [server]/api/[app_name]/[user_id]/check_accessebility

    Example: http://chat.localhost/api/tpa1com/150031/check_accessebility
    '''
    tpa = Tpa.objects.get(name=app_name)
    user = ChatUser.objects.get(tpa=tpa,user_id=user_id)
    if (user.is_invitation_enabled == False):
        return { 'status': 1, 'message': '%s is temporary unvailable' % user.name }
    else:
        return { 'status': 0, 'message': 'ok' }



