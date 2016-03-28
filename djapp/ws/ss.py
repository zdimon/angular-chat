# -*- coding: utf-8 -*-
import tornado.httpserver
import tornado.websocket
import tornado.ioloop
import tornado.web
import socket
import json
from processor import handle
import logging
import brukva
c = brukva.Client()
c.connect()
logger = logging.getLogger(__name__)
logger.setLevel('DEBUG')

import sys, os
sys.path.append(os.path.join(os.path.dirname(__file__), '../djapp'))

from utils.db import MyDB
bd = MyDB()
import sockjs.tornado
from sockjs.tornado import SockJSRouter, SockJSConnection
from tornado import web, ioloop

class WSHandler(sockjs.tornado.SockJSConnection):
    '''
    Websocket server that uses the Tornado websocket handler.
    Please run `pip install tornado` with python of version 2.7.9 or greater to install tornado.
    ''' 
    participants = set() # List of users online
    def __init__(self,*args):
        '''Initialization'''
        super(WSHandler, self).__init__(*args)  
        self.client = brukva.Client()
        self.client.connect()
        self.current_user_id = None
        self.current_user_name = None
        self.tpa_id = None
        self.tpa_name = None
        self.processor = None

    def open(self):
        print 'new connection'
        self.participants.add(self)

    def subscribe(self, room):
        '''Subscribing user to the channel in the REDIS server'''
        self.client.subscribe(room) # Redis subscribe
        logger.debug('subscribing to room %s' % (room, )) # Debug
        self.client.listen(self.redis_message)

    def pass_message(self, message):
        self.write_message(json.dumps(message)) 

      
    def on_message(self, message):
        'Accepting message from javasctipt client'
        print 'message received:  %s' % message
        
        
        

 
    def on_close(self):
        ''' Method whith fires when connection is closed. '''
        print 'connection closed'
        #self.set_user_offline()


    

    def redis_message(self, result):
        ''' recieving  message from redis server, 
            convertin it in json format 
            and sending it to the current chanel
        '''
        
        message = json.loads(result.body)
        print message
        #self.write_message(json.dumps({'status': 1}))
        self.write_message(json.dumps(message))

    def check_origin(self, origin):
        return True 
 

 
if __name__ == '__main__':
    EchoRouter = SockJSRouter(WSHandler, '/ws')
    
    app = web.Application(EchoRouter.urls)
    app.listen(8888)
    print "Start server..."
    ioloop.IOLoop.instance().start()
