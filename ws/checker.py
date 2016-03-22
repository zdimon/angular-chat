from websocket import create_connection
import requests
import json
import os
import sys
from subprocess import call
bashCommand = '/home/zdimon/www/ngchat_ve/chat/djapp/kill.sh'
print 'connect'
ws = create_connection("ws://marriage-brides.com:8889/ws")

try:
    ws = create_connection("ws://marriage-brides.com:8889/ws")
except:
    print 'killing websocket becouse no connection!!'
    call(bashCommand)
    sys.exit("quit")

print "Sending ping"
data = { 'action': 'ping' }
ws.send(json.dumps(data))
print "Receiving..."
result =  ws.recv()
print "Received '%s'" % result
if result!='pong':
    print 'killing websocket becouse no ping!!'
    call(bashCommand)
ws.close()
