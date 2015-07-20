# -*- coding: utf-8 -*-
import logging
from optparse import make_option
from django.core.exceptions import ObjectDoesNotExist
from django.core.management.base import BaseCommand
from django.core.files import File
from random import randint
import csv
from django.contrib.auth.models import User
from chat.models import *
from utils.colorize import bcolors
#logger = logging.getLogger(__name__) 


class Command(BaseCommand):
    ''' Test data loading.
        To run this command type ./manage.py load_data in your terminal.
    '''
    def handle(self, *args, **options):
        
        print bcolors.WARNING+'start'
        
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

        men = ['vova','fedor', 'oleg', 'serg', 'dima', 'alex']
        women = ['olga','sveta', 'luba', 'marina', 'natasha', 'vera']

        for m in men:
            print 'process..........%s' % m

        for w in women:
            print 'process..........%s' % w


        print 'stop process'


        
