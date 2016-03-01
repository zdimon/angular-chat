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
        for u in ChatUser.objects.filter(gender='m'):
            print 'reseting %s' % u.name
            u.is_camera_active = False
            u.save()

        
