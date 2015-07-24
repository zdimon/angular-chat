import json
from django.http import HttpResponse
from jsonview.decorators import json_view
from django.shortcuts import redirect
from utils.util import read_conf, get_url_by_name
from django.views.decorators.csrf import csrf_exempt

@json_view
def is_auth(request,app_name):
    if(request.user.is_authenticated()):
        out = {
            'status': 0,
            'user_id': request.user.id,
            'username': request.user.username
        }
    else:
        out = {
            'status': 1,
            'message': 'user is not authorized'
        }
    return out

@json_view
@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    try:
        user = User.objects.get(username=username)
        if user.check_password(password):
            user.backend = 'django.contrib.auth.backends.ModelBackend'
            login_user(request,user)
            out = { 'status': 0, 'message': 'ok', 'username': user.username, 'user_id': user.id }
        else:
            out = { 'status': 1, 'message': 'Password does not match!' }
    except:
        out = { 'status': 1, 'message': 'User does not found!' }
    return out        
 

@json_view
def logout(request):
    from django.contrib.auth import logout
    logout(request)
    out = {
        'status': 0,
        'message': 'ok',
    }
    return out



@json_view
def autologin(request,user_id):
    try:
        user = User.objects.get(user_id=user_id)
    except:
        url = get_url_by_name('get_profile_from_tpa',{'user_id':user_id})
        responce = requests.get(url)
        user = User.objects.get(user_id=user_id)
    user.backend = 'django.contrib.auth.backends.ModelBackend'
    login_user(request,user)
    return redirect('test')




