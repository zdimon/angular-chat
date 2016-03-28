import json
from django.http import HttpResponse
from jsonview.decorators import json_view
from django.shortcuts import redirect
from django.views.decorators.csrf import csrf_exempt
from chat.models import Tpa
from utils.redisender import bclient
bclient = bclient()

@json_view
def get_prices(request,app_name):
    ''' 
        Get prices

        [server]/api/[app_name]/get_prices

        Example: http://chat.localhost/api/tpa1com/get_prices

        Responce 1: { 'status': 0, 'prices': {'text': '2.0', 'video': '3.0', 'audio': '1.0', 'timeout': '60'} }

        Responce 2: { 'status': 1, 'message': 'Some error.' }

    ''' 
    try:
        tpa = Tpa.objects.get(name=app_name)
        return { 'status': 0, 'prices': {'text': tpa.price_text_chat, 'video': tpa.price_video, 'audio': tpa.price_audio, 'timeout': tpa.timeout_chating} }
    except:
        return { 'status': 1, 'message': 'Some error.' }
    

@csrf_exempt
@json_view
def set_prices(request,app_name):
    ''' 
        Get prices

        [server]/api/[app_name]/set_prices

        Example: http://chat.localhost/api/tpa1com/get_prices

        Responce 1: { 'status': 0, 'prices': {'text': '2.0', 'video': '3.0', 'audio': '1.0', 'timeout': '60'} }

        Responce 2: { 'status': 1, 'message': 'Some error.' }

    ''' 
    #try:
    tpa = Tpa.objects.get(name=app_name)
    tpa.price_text_chat = request.POST['text']
    tpa.price_video = request.POST['video']
    tpa.price_audio = request.POST['audio']
    tpa.timeout_chating = request.POST['timeout']
    tpa.save()
    return { 'status': 0, 'prices': {'text': tpa.price_text_chat, 'video': tpa.price_video, 'audio': tpa.price_audio, 'delay': tpa.timeout_chating} }
    #except:
    #    return { 'status': 1, 'message': 'Some error.' }


    







