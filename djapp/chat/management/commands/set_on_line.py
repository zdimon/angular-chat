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
from utils.util import *
#logger = logging.getLogger(__name__) 


class Command(BaseCommand):
    ''' Test data loading.
        To run this command type ./manage.py load_data in your terminal.
    '''
    def handle(self, *args, **options):
        set_on_line()

        


        
