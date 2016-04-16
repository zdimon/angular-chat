from websocket import create_connection
import requests
import json
import os
import sys
from subprocess import call
import time

while True:

    time.sleep(30) 
    print 'check'
    connect_timeout = 1
    url = 'http://marriage-brides.com:5555/info'
    #url = 'http://localhost:8889/ws'

    #bashCommand = '/home/zdimon/www/ngchat_ve/chat/djapp/kill.sh'
    bashCommand = '/home/webmaster/ngchat_ve/angular-chat/djapp/kill.sh'
    #rez = requests.get(url,timeout=(connect_timeout, 5))
    try:
        rez = requests.get(url,timeout=(connect_timeout, 5))
    except:
        print 'killing websocket becouse timeout!!'
        call(bashCommand)
        sys.exit("quit")

    Command_reload = 'service uwsgi restart'
    url2 = 'http://marriage-brides.com/api/tpa1com/config.js'
    rez = requests.get(url2)
    if rez.status_code != 200:
        call(Command_reload)
        sys.exit("quit")


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
