#!/usr/bin/env python
from websocket import create_connection
import requests
import json
import os
import sys
from subprocess import call
import time

import datetime



while True:

    time.sleep(10) 
    print 'check'
   
    Command_reload = '/home/webmaster/ngchat_ve/angular-chat/djapp/kill_ws.sh'

    url2 = 'http://marriage-brides.com:8882/api/tpa1com/config.js'
    rez = requests.get(url2)
    if rez.status_code != 200:
        call(Command_reload) 
        print 'restarting'   
        f = open('restart.log','a')
        f.write('reloading ws - %s' % datetime.datetime.now() )
        f.close()


    url2 = 'http://marriage-brides.com:8883/api/tpa1com/config.js'
    rez = requests.get(url2)
    if rez.status_code != 200:
        call(Command_reload) 
        print 'restarting'   
        f = open('restart.log','a')
        f.write('reloading ws - %s' % datetime.datetime.now() )
        f.close()

    url2 = 'http://marriage-brides.com:8884/api/tpa1com/config.js'
    rez = requests.get(url2)
    if rez.status_code != 200:
        call(Command_reload) 
        print 'restarting'   
        f = open('restart.log','a')
        f.write('reloading ws - %s' % datetime.datetime.now() )
        f.close()





