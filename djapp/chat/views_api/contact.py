import json
from django.http import HttpResponse
from chat.models import Tpa, ChatUser, ChatContacts
from jsonview.decorators import json_view
from utils.util import serialize_user
import time
from django.views.decorators.csrf import csrf_exempt
from utils.redisender import bclient
bclient = bclient()

def _get_contact(app_name,owner_id,contact_id):
    ''' 
        Try to retrieve contact terord
    '''
    tpa = Tpa.objects.get(name=app_name)
    owner = ChatUser.objects.get(tpa=tpa,user_id=owner_id)
    contactuser = ChatUser.objects.get(tpa=tpa,user_id=contact_id)
    try:
        contact = ChatContacts.objects.get(owner=owner,contact=contactuser) 
        return contact
    except:   
        return False



def _add_contact(app_name,owner_id,contact_id):
    ''' 
        Add new contact to owner 

        [server]/api/[app_name]/[owner_id]/[contact_id]/add_contact

        Example: http://chat.localhost/api/tpa1com/14/15/add_contact
    '''
    tpa = Tpa.objects.get(name=app_name)
    owner = ChatUser.objects.get(tpa=tpa,user_id=owner_id)
    contactuser = ChatUser.objects.get(tpa=tpa,user_id=contact_id)
    try:
        contact = ChatContacts.objects.get(owner=owner,contact=contactuser) 
    except:
        contact = ChatContacts()
        contact.owner = owner
        contact.contact = contactuser
        contact.tpa = tpa
        contact.save()        
    return contact 

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
    if(user_id=='undefined'):
        return { 'status': 1, 'message': 'undefined user' }

    owner = ChatUser.objects.filter(tpa=tpa,user_id=user_id)
    for c in ChatContacts.objects.filter(owner=owner):
        contact = serialize_user(c.contact)
        contact['has_new_message'] = c.has_new_message   
        contact['activity'] = c.activity
        #try:
        #    contact['is_room_closed'] = c.room.is_closed
        #except:
        #    pass
	contact['contact_id'] = c.id  
        contactlst.append(contact)
    return { 'status': 0, 'message': 'ok', 'user_list': contactlst }



@json_view
def get_contact_list_ids(request,app_name,user_id):
    '''
    Function returns user's ids contact list online for invitation

    [server]/api/[app_name]/[user_id]/get_contact_list_ids

    Example: http://chat.localhost/api/tpa1com/1/get_contact_list_ids

    Responce:  {"status": 0, "message": "ok", "contact_list": [150023, 150032]}

    '''
    contactlst = []
    tpa = Tpa.objects.get(name=app_name)
    owner = ChatUser.objects.filter(tpa=tpa,user_id=user_id)
    
    for c in ChatContacts.objects.filter(owner=owner):
        if(c.contact.is_online):
            contactlst.append(c.contact.user_id)
    return { 'status': 0, 'message': 'ok', 'count': len(contactlst), 'contact_list': contactlst }


        
@csrf_exempt
@json_view
def send_invitation(request):
    '''
    Function saves invitation from woman.

    parameters by POST: app_name,owner_id,contact_id,message

    [server]/api/send_invitation

    Example: http://chat.localhost/api/send_invitation
    '''
    #import pdb; pdb.set_trace() 
    b = json.loads(request.body)
    print b
    tpa = Tpa.objects.get(name=b['app_name'])
    owner = ChatUser.objects.get(tpa=tpa,user_id=int(b['owner_id']))
    data = {'message': b['message'], 'opponent': serialize_user(owner), 'id': int(time.time()) }
    mes = { 'action': 'show_invite_notification', 'data': data }
    bclient.publish('%s_%s' % (b['app_name'], str(b['contact_id'])), json.dumps(mes)) 

    return  { 'status': 0 }


@json_view
def mark_watching_profile(request,app_name,user_id,opponent_id):
    ''' 
        Request to mark indicator about user is watching profile.

        [server]/api/[app_name]/[user_id]/[opponent_id]/mark_watching_profile

        Example: http://chat.localhost/api/tpa1com/14/15/mark_watching_profile

        Responce 1: { 'status': 0, 'message': 'ok' }
    '''
    mes = { 'action': 'mark_watching_profile', 'user_id': user_id }
    bclient.publish('%s_%s' % (app_name,opponent_id), json.dumps(mes)) 
    return { 'status': 0, 'message': 'ok' }


