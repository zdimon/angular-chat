import random
from utils.colorize import bcolors
import datetime
from utils.db import MyDB

bd = MyDB()


def read_conf():
    from djapp.settings import BASE_DIR
    #path = BASE_DIR+'../www/api.conf.js'
    ar = BASE_DIR.split('/')
    path = '/'.join(ar[:len(ar)-1])+'/www/api.conf.js'
    exec open(path).read()
    return apiconf

def get_url_by_name(name,dict_key):
    apiconf = read_conf()
    url = 'http://'+apiconf['api'][name]['url']
    url = url.replace('[server]',apiconf['config']['signal_server'])
    url = url.replace('[app_name]',apiconf['config']['app_name'])
    for key in dict_key:
        url = url.replace('[%s]' % key, dict_key[key])
    return url

def clean_db():
    from chat.models import *
    from django.contrib.auth.models import User
    print bcolors.WARNING+'Start cleaning DB'      
    ChatStopword.objects.all().delete()
    ChatTemplates.objects.all().delete()
    ChatTransactions.objects.all().delete()
    ChatFriends.objects.all().delete()
    ChatContacts.objects.all().delete()
    ChatMessage.objects.all().delete()
    ChatUser2Room.objects.all().delete()
    ChatRoom.objects.all().delete()
    ChatUser.objects.all().delete()
    Tpa.objects.all().delete()
    User.objects.exclude(username='admin').delete()
    print bcolors.WARNING+'Done cleaning DB'

def load_db():
    from chat.models import *
    from django.contrib.auth.models import User
    print bcolors.WARNING+'Start loading data in DB'

    t = Tpa()
    t.name = 'tpa1com'
    t.domain ='tpa1.com'
    t.timeout_chating = 30
    t.save()

    men = ['vova','fedor', 'oleg', 'serg', 'dima', 'alex']
    women = ['olga','sveta', 'luba', 'marina', 'natasha', 'vera']
    cmen = []

    
    u = User()
    u.username = 'admin'
    u.set_password('admin')
    u.is_active=True
    u.is_staff=True
    u.is_superuser = True

    try:
        u.save()
    except:
        pass

    for m in men:
        print 'process..........%s' % m
        u = ChatUser()
        u.gender = 'm'
        u.name = m
        year = random.choice(range(1950, 2001))
        month = random.choice(range(1, 13))
        day = random.choice(range(1, 29))
        u.birthday = str(year)+'-'+str(month)+'-'+str(day)
        u.email = m+'@gmail.com'
        cr = random.randint(0,5)
        country = (['Ukraine','Russia','Great Britain','Poland','Germany','USA'])
        city = (['Kiev','Odessa'],
        ['Moskow','Sant Peterburg'],
        ['London','Glasgo'],
        ['Washava','Krakiv'],
        ['Berlin','Munhen'],
        ['Texas','Chicago'])
        u.country = country[cr]
        u.city = city[cr][random.randint(0,1)]
        u.image = '/static/images/avatar.jpg'
        u.profile_url = m+'_plofile_url'
        u.culture = random.choice(['de','ru','en'])
        u.is_online = random.choice([True,False])
        u.user_id = str(ChatUser.objects.all().count())
        u.tpa = t
        u.save()
        cmen.append(u)

    for w in women:
        print 'process..........%s' % w
        u = ChatUser()
        u.gender = 'w'
        u.name = w
        year = random.choice(range(1950, 2001))
        month = random.choice(range(1, 13))
        day = random.choice(range(1, 29))
        u.birthday = str(year)+'-'+str(month)+'-'+str(day)
        u.email = m+'@gmail.com'
        cr = random.randint(0,5)
        country = (['Ukraine','Russia','Great Britain','Poland','Germany','USA'])
        city = (['Kiev','Odessa'],
        ['Moskow','Sant Peterburg'],
        ['London','Glasgo'],
        ['Washava','Krakiv'],
        ['Berlin','Munhen'],
        ['Texas','Chicago'])
        u.country = country[cr]
        u.city = city[cr][random.randint(0,1)]
        u.image = '/static/images/avatar.jpg'
        u.profile_url = m+'_plofile_url'
        u.culture = random.choice(['de','ru','en'])
        u.is_online = random.choice([True,False])
        u.user_id = str(ChatUser.objects.all().count())
        u.tpa = t
        u.save()
        chat_c = ChatContacts()
        chat_c.owner = u
        rc = random.randint(0,5)
        chat_c.contact = cmen[rc]
        chat_c.tpa = t
        chat_c.save()
        chat_c = ChatContacts()
        chat_c.owner = cmen[rc]
        chat_c.contact = u
        chat_c.tpa = t
        chat_c.save() 

     
    for u in range(5):
        men.append('man'+str(u))
        women.append('woman'+str(u))

    for m in men:
        u = User()
        u.username = m
        u.set_password('111')

    for m in women:
        u = User()
        u.username = m
        u.set_password('111')

    print 'Done loading data in DB'

def load_db_from_tpa():
    from chat.models import *
    from django.contrib.auth.models import User
    import PySQLPool
    from djapp.settings import DATABASES
    import requests

    t = Tpa()
    t.name = 'tpa1com'
    t.domain ='tpa1.com'
    t.timeout_chating = 30
    t.save()

    u = User()
    u.username = 'admin'
    u.set_password('admin')
    u.is_active=True
    u.is_staff=True
    u.is_superuser = True
    try:
        u.save()
    except:
        pass

    print bcolors.WARNING+'Start loading data in DB from TPA'
    users = bd.select('select * from users_info')
    for u in users.record:
            url = get_url_by_name('get_profile',{'user_id':str(u['user_id'])})
            responce = requests.get(url)
    print 'Done loading data in DB from TPA'



def serialize_user(user):
    return ({'id':user.id, 'user_id':user.user_id,'gender':user.gender,'name':user.name,
                    'birthday':str(user.birthday),
                    'country':user.country,'city':user.city,'image':user.image,
                    'profile_url':user.profile_url,'culture':user.culture,
                    'is_camera_active':user.is_camera_active, 
                    'is_invisible': user.is_invisible, 
                    'is_invitation_enabled': user.is_invitation_enabled})




