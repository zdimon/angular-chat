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
    connect_timeout = 1
    time.sleep(30) 
    print 'check'
   
    Command_reload = '/home/webmaster/ngchat_ve/angular-chat/djapp/kill_ws.sh'

    
    for p in [8882,8883,8884]:
        url2 = 'http://marriage-brides.com:%s/api/tpa1com/config.js' % p
        rez = requests.get(url2)
        print 'check %s post om 200' % p
        if rez.status_code != 200:
            call(Command_reload) 
            print 'restarting'   
            f = open('restart.log','a')
            f.write('reloading ws - %s' % datetime.datetime.now() )
            f.close()



    for p in [8882,8883,8884]:
        url = 'http://marriage-brides.com:%s/api/tpa1com/config.js' % p
        print 'check %s post on timeout' % p
        try:
            rez = requests.get(url,timeout=(connect_timeout, 5))
        except:
            print 'killing websocket becouse timeout!!'
            call(Command_reload)
            f = open('restart.log','a')
            f.write('reloading becouse timeout ws - %s' % datetime.datetime.now() )
            f.close()




