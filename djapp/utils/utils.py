import random

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
    User.objects.all().exclude(username='admin').delete()

    print bcolors.WARNING+'Done cleaning DB'

def load_db():

    print bcolors.WARNING+'Start loading data in DB'

    men = ['vova','fedor', 'oleg', 'serg', 'dima', 'alex']
    women = ['olga','sveta', 'luba', 'marina', 'natasha', 'vera']

    for m in men:
        print 'process..........%s' % m
        u = ChatUser()
        u.gender = 'm'
        u.name = m
        u.age = random.randint(18, 65)
        u.email = m+'@gmail.com'
        u.country = random.choice({'Ukraine':['Kiev','Kharkiv','Odessa'],'Russia':['Moskow','Sant Peterburg','Rostov'],'Great Britain':['London','Glasgo'],'Poland':['Washava','Krakiv'],'Germany':['',''],'USA':['Texas','Chicago']})
        
        u.save()

    for w in women:
        print 'process..........%s' % w
        u = ChatUser()
        u.gender = 'w'
        u.name = w
        u.save()

        print 'Done loadinng data in DB'
