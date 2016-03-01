# -*- coding: utf-8 -*-
import logging
from optparse import make_option
from django.core.exceptions import ObjectDoesNotExist
from django.core.management.base import BaseCommand
from django.core.files import File
from random import randint
import csv
from chat.models import ChatUser
import time
import requests

#logger = logging.getLogger(__name__) 


class Command(BaseCommand):
    ''' Test data loading.
        To run this command type ./manage.py load_data in your terminal.
    '''
    def handle(self, *args, **options):
        print 'Updating!!!!'
        i = 0
        for u in ChatUser.objects.filter(gender='w'):
            i = i+1
            url =  'http://marriage-brides.com/api/tpa1com/%s/update_user' % u.user_id
            print '%s %s' % (i,url)
            time.sleep(0.5)
            requests.get(url)

        
