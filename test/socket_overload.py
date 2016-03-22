import websocket
from websocket import create_connection
import logging
import json
import sys, os
sys.path.append(os.path.join(os.path.dirname(__file__), '../djapp'))
import brukva
bclient = brukva.Client()
bclient.connect()

import time

def test_brukva():
    mes = { 'action': 'close_room' }
    print 'send to test_test'
    for i in range(1000000):
        bclient.publish('test_test', json.dumps(mes))
    

def test():

    def on_message(ws, message):
        print message

    def on_error(ws, error):
        #print error
        print 'errrrrr'

    def on_close(ws):
        print "### closed ###"

    def on_open(ws):
        print 'start serve'
        data = { 'action': 'connect', 'tpa': 'test', 'user_id': '150032', 'source': 'site' }
        ws.send(json.dumps(data))


    ws = websocket.WebSocketApp("ws://localhost:8889/ws",
    on_message = on_message,
    on_error = on_error,
    on_close = on_close)
    ws.on_open = on_open
    ws.run_forever()
    ws.close()
    
        
        


if __name__ == '__main__':
    test()
    import sys
    sys.exit("quit")


