from django.shortcuts import render
import json
from django.http import HttpResponse
from django.template import loader, RequestContext
from django.contrib.auth.models import User

def home(request):
    t = loader.get_template('base.html')
    c = RequestContext(request,{})
    return HttpResponse(t.render(c))


def get_online(request,app_id):
    context = { }
    out = {
        'status': 0,
        'user_list': [
            {'name': 'Oleg'},
            {'name': 'Oleg'},
            {'name': 'Dima'},
            {'name': 'Dima'},
            {'name': 'Vova'}
        ]
    }
    return HttpResponse(json.dumps(out), content_type='application/json')  


def is_auth(request):
    if(request.user.is_authenticated()):
        out = {
            'status': 0,
            'user_id': request.user.id
        }
    else:
        out = {
            'status': 1,
            'message': 'user is not authorized'
        }
    return HttpResponse(json.dumps(out), content_type='application/json')  


def login(request):
    data = json.loads(request.body)
    username = data['username']
    password = data['password']
    
    #import pdb; pdb.set_trace()
    try:
        user = User.objects.get(username=username)
        if user.check_password(password):
            user.backend = 'django.contrib.auth.backends.ModelBackend'
            login(request,user)
            out = { 'status': 0, 'message': 'ok', 'username': user.username, 'user_id': user.id }
        else:
            out = { 'status': 1, 'message': 'Password does not match!' }
    except:
        out = { 'status': 1, 'message': 'User does not found!' }
        
    context = { }
   
    return HttpResponse(json.dumps(out), content_type='application/json')  

def logout(request):
    from django.contrib.auth import logout
    logout(request)
    out = {
        'status': 0,
        'message': 'ok',
    }
    return HttpResponse(json.dumps(out), content_type='application/json')   
   

