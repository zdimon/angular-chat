import json
from django.http import HttpResponse
from chat.models import Tpa, ChatUser, ChatContacts

def add_contact(request,app_name,owner_id,contact_id):
    ''' Add new contact to owner 
    api/(?P<app_name>[^\.]+)/(?P<owner_id>[^\.]+)/(?P<contact_id>[^\.]+)/add_contact$'''
    tpa = Tpa.objects.get(name=app_name)
    owner = ChatUser.objects.get(tpa=tpa,user_id=owner_id)
    contact = ChatUser.objects.get(tpa=tpa,user_id=contact_id)
    try:
        ChatContacts.objects.get(owner=owner,contact=contact) 
        out = { 'status': 1, 'message': 'Contact exist' }   
    except:
        new_contact = ChatContacts()
        new_contact.owner = owner
        new_contact.contact = contact
        new_contact.tpa = tpa
        new_contact.save()        
        out = { 'status': 0, 'message': 'Sucsessful add contact' }

    return HttpResponse(json.dumps(out), content_type='application/json') 
