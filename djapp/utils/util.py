import random
from chat.models import *
from django.contrib.auth.models import User
from utils.colorize import bcolors
from djapp.settings import BASE_DIR

def read_conf():
    #path = BASE_DIR+'../www/api.conf.js'
    ar = BASE_DIR.split('/')
    path = '/'.join(ar[:len(ar)-1])+'/www/api.conf.js'
    exec open(path).read()
    return apiconf


def clean_db():
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
    User.objects.all().delete()
    

    print bcolors.WARNING+'Done cleaning DB'

def load_db():

    print bcolors.WARNING+'Start loading data in DB'

    t = Tpa()
    t.name = '1-st Tpa'
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
    u.save()
    
    for m in men:
        print 'process..........%s' % m
        u = ChatUser()
        u.gender = 'm'
        u.name = m
        u.age = random.randint(18, 65)
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
        u.tpa = t
        u.save()
        cmen.append(u)

    for w in women:
        print 'process..........%s' % w
        u = ChatUser()
        u.gender = 'w'
        u.name = w
        u.age = random.randint(18, 65)
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

        print 'Done loading data in DB'
