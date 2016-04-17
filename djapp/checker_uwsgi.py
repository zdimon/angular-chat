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
   
    Command_reload = 'service uwsgi restart'
    url2 = 'http://marriage-brides.com/api/tpa1com/config.js'
    rez = requests.get(url2)
    if rez.status_code != 200:
        call(Command_reload) 
        print 'restarting'   
        f = open('restart.log','w+')
        f.write('reloading - %s' % datetime.datetime.now() )
        f.close()
#        sys.exit("quit")


'''

    try:
        ws = create_connection("http://marriage-brides.com:5555/info")
    except:
        print 'killing websocket becouse no connection!!'
        call(bashCommand)
        sys.exit("quit")

    #print "Sending ping"
    data = { 'action': 'ping' }
    ws.send(json.dumps(data))
    #print "Receiving..."
    result =  ws.recv()
    #print "Received '%s'" % result
    if result!='pong':
        print 'killing websocket becouse no ping!!'
        call(bashCommand)
    ws.close()

'''
