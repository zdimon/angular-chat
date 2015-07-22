from django.shortcuts import render
import json
from django.http import HttpResponse
from django.template import loader, RequestContext
from django.contrib.auth.models import User
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import login as login_user
from chat.models import Tpa, ChatUser, ChatContacts

def home(request):
    t = loader.get_template('base.html')
    c = RequestContext(request,{})
    return HttpResponse(t.render(c))

@csrf_exempt
def get_online(request,app_id):
    #import pdb; pdb.set_trace()
    userlst = []
    tpa = Tpa.objects.get(name=app_id)
    for u in ChatUser.objects.filter(tpa=tpa,is_online=1):
        userlst.append({'user_id':u.id,'gender':u.gender,'name':u.name,'age':u.age,
                        'country':u.country,'city':u.city,'image':u.image,
                        'profile_url':u.profile_url,'culture':u.culture,
                        'is_camera_active':u.is_camera_active, 
                        'is_invisible': u.is_invisible, 
                        'is_invitation_enabled': u.is_invitation_enabled})
    out = { 'status': 0, 'message': 'ok', 'user_list': userlst }
    return HttpResponse(json.dumps(out), content_type='application/json')  

@csrf_exempt
def get_contact_list(request,app_id):
    import pdb; pdb.set_trace()
    contactlst = []
    tpa = Tpa.objects.get(name=app_id)
    for c in ChatContacts.objects.filter(tpa=tpa):
        contactlst.append({'owner':c.owner.name,'contact':c.contact.name})
    out = { 'status': 0, 'message': 'ok', 'contact_list': contactlst }
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
    #import pdb; pdb.set_trace()
    #data = json.loads(request.body)
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
   

