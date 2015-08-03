import json
from django.http import HttpResponse
from chat.models import Tpa, ChatUser, ChatContacts
from jsonview.decorators import json_view
from utils.util import serialize_user


def _add_contact(app_name,owner_id,contact_id):
    ''' 
        Add new contact to owner 

        [server]/api/[app_name]/[owner_id]/[contact_id]/add_contact

        Example: http://chat.localhost/api/tpa1com/14/15/add_contact
    '''
    tpa = Tpa.objects.get(name=app_name)
    owner = ChatUser.objects.get(tpa=tpa,user_id=owner_id)
    contact = ChatUser.objects.get(tpa=tpa,user_id=contact_id)
    try:
        ChatContacts.objects.get(owner=owner,contact=contact) 
        out = { 'status': 1, 'message': 'Contact is already exists' }   
    except:
        new_contact = ChatContacts()
        new_contact.owner = owner
        new_contact.contact = contact
        new_contact.tpa = tpa
        new_contact.save()        
        out = { 'status': 0, 'message': 'Contact has been added' }
    return out 

@json_view
def add_contact(request,app_name,owner_id,contact_id):
    ''' 
        Add new contact to owner 

        [server]/api/[app_name]/[owner_id]/[contact_id]/add_contact

        Example: http://chat.localhost/api/tpa1com/14/15/add_contact

        Responce 1: { 'status': 0, 'message': 'Contact has been added' }

        Responce 2: { 'status': 1, 'message': 'Contact is already exists' }  

    '''
    tpa = Tpa.objects.get(name=app_name)
    owner = ChatUser.objects.get(tpa=tpa,user_id=owner_id)
    contact = ChatUser.objects.get(tpa=tpa,user_id=contact_id)
    try:
        ChatContacts.objects.get(owner=owner,contact=contact) 
        out = { 'status': 1, 'message': 'Contact is already exists' }   
    except:
        new_contact = ChatContacts()
        new_contact.owner = owner
        new_contact.contact = contact
        new_contact.tpa = tpa
        new_contact.save()        
        out = { 'status': 0, 'message': 'Contact has been added' }
    return out 

@json_view
def del_contact(request,app_name,owner_id,contact_id):
    ''' 
        Del contact in owner 

        [server]/api/[app_name]/[owner_id]/[contact_id]/del_contact
        
        Example: http://chat.localhost/api/tpa1com/14/15/del_contact

        Responce 1: { 'status': 0, 'message': 'Contact has been deleted' }

        Responce 2: { 'status': 1, 'message': 'Contact does not exist.' }

    '''
    tpa = Tpa.objects.get(name=app_name)
    owner = ChatUser.objects.get(tpa=tpa,user_id=owner_id)
    contact = ChatUser.objects.get(tpa=tpa,user_id=contact_id)
    try:
        delcont = ChatContacts.objects.get(owner=owner,contact=contact)
        delcont.delete()       
        out = { 'status': 0, 'message': 'Contact has been deleted' }   
    except:       
        out = { 'status': 1, 'message': 'Contact does not exist.' }

    return out

@json_view
def del_all_contacts(request,app_name,owner_id):
    ''' 
        Del all contacts in owner 

        [server]/api/[app_name]/[owner_id]/del_all_contacts
        
        Example: http://chat.localhost/api/tpa1com/150043/del_all_contacts

        Responce 1: { 'status': 0, 'message': 'All Contacts have been deleted.' }

        Responce 2: { 'status': 1, 'message': 'List Contacts is empty.' }

    '''
    tpa = Tpa.objects.get(name=app_name)
    owner = ChatUser.objects.get(tpa=tpa,user_id=owner_id)
    try:
        ChatContacts.objects.filter(owner=owner).delete()     
        out = { 'status': 0, 'message': 'All Contacts have been deleted.' }   
    except:       
        out = { 'status': 1, 'message': 'List Contacts is empty.' }

    return out    


@json_view
def get_contact_list(request,app_name,user_id):
    '''
    Function returns user's contact list

    [server]/api/[app_name]/[user_id]/get_contact_list

    Example: http://chat.localhost/api/tpa1com/1/get_contact_list

    Responce:  {"status": 0, "message": "ok", "contact_list": [{"image": "/static/images/avatar.jpg", "is_invisible": false, "is_invitation_enabled": true, "culture": "ru", "birthday": "1996-12-08", "id": 44, "city": "Washava", "user_id": 3, "name": "serg", "country": "Poland", "gender": "m", "profile_url": "serg_plofile_url", "is_camera_active": false}]}

    '''
    contactlst = []
    tpa = Tpa.objects.get(name=app_name)
    owner = ChatUser.objects.filter(tpa=tpa,user_id=user_id)
    for c in ChatContacts.objects.filter(owner=owner):
        contactlst.append(serialize_user(c.contact))
    return { 'status': 0, 'message': 'ok', 'contact_list': contactlst }
