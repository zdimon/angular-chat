from django.shortcuts import render
import json
from django.http import HttpResponse
from django.template import loader, RequestContext

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
