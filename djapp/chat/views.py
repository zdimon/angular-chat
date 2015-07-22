from django.shortcuts import render
import json
from django.http import HttpResponse
from django.template import loader, RequestContext
from django.contrib.auth.models import User
from django.views.decorators.csrf import csrf_exempt

def home(request):
    t = loader.get_template('base.html')
    c = RequestContext(request,{})
    return HttpResponse(t.render(c))


def get_online(request,app_id):
    context = { }
    out = {
        'status': 0,
        'user_list': [
            {'username': 'Oleg'},
            {'username': 'Oleg'},
            {'username': 'Dima'},
            {'username': 'Dima'},
            {'username': 'Vova'}
        ]
    }
    return HttpResponse(json.dumps(out), content_type='application/json')  


def has_opponent(request,user_id):
    out = {
        'status': 1,
        'contact_id': 5
    }
    return HttpResponse(json.dumps(out), content_type='application/json')  



def is_auth(request,app_id):
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
    return HttpResponse(json.dumps(out), content_type='application/json')  

@csrf_exempt
def login(request):
    import pdb; pdb.set_trace()
    #data = json.loads(request.body)
    username = request.POST['username']
    password = request.POST['password']
    
    
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
   

