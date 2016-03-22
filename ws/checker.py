from websocket import create_connection
import requests
import json

try:
    ws = create_connection("ws://marriage-brides.com:8889/ws")
except:
    print 'killing websocket!!'
    kill $(lsof -t -i:8889)

print "Sending ping"
data = { 'action': 'ping' }
ws.send(json.dumps(data))
print "Receiving..."
result =  ws.recv()
print "Received '%s'" % result
if result!='pong':
    print 'killing websocket!!'
    kill $(lsof -t -i:8889)
ws.close()
