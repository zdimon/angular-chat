# -*- coding: utf-8 -*-
import tornado.httpserver
import tornado.websocket
import tornado.ioloop
import tornado.web
import socket
import json
from processor import MessageProcessor
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

 
class WSHandler(tornado.websocket.WebSocketHandler):
    '''
    Websocket server that uses the Tornado websocket handler.
    Please run `pip install tornado` with python of version 2.7.9 or greater to install tornado.
    ''' 
   
    def __init__(self,*args):
        '''Initialization'''
        super(WSHandler, self).__init__(*args)  
        self.processor = MessageProcessor() 
        self.client = brukva.Client()
        self.client.connect()
        self.current_user_id = None
        self.current_user_name = None
        self.tpa_id = None
        self.tpa_name = None

    def open(self):
        print 'new connection'
        bd.update('SET SQL_SAFE_UPDATES=0')
        bd.update('update chat_chatuser set is_online=0')

    def subscribe(self, room):
        '''Subscribing user to the channel in the REDIS server'''
        self.client.subscribe(room) # Redis subscribe
        logger.debug('subscribing to room %s' % (room, )) # Debug
        self.client.listen(self.redis_message)

      
    def on_message(self, message):
        'Accepting message from javasctipt client'
        print 'message received:  %s' % message
        message = json.loads(message) 

        if message['action'] == 'connect':
            try:
                chanel = '%s_%s' % (message["tpa"], message["user_id"])
                self.subscribe(chanel)
                tpa = bd.get('select id, name from chat_tpa where name="%s" ' % message["tpa"])
                user = bd.get('select name from chat_chatuser where user_id="%s" ' % message["user_id"])
                self.current_user_id = message["user_id"]
                self.current_user_name = user['name']
                
                self.tpa_id = tpa['id']
                self.tpa_name = tpa['name']
                logger.debug('current tpa information %s %s' % (self.tpa_id, self.tpa_name ))
                self.write_message(json.dumps({'status': 0, 'user_id':  self.current_user_id, 'user_name':  self.current_user_name, 'message': 'you have been connected to %s' % chanel })) 
                self.set_user_online()
            except Exception, e:
                self.write_message(json.dumps({'status': 1, 'message': str(e)})) 
            
    
        self.processor.handle(message)
        

 
    def on_close(self):
        ''' Method whith fires when connection is closed. '''
        print 'connection closed'
        self.set_user_offline()


    def set_user_online(self):
        bd.update('update chat_chatuser set is_online=1 where user_id=%s and tpa_id=%s' % (self.current_user_id, self.tpa_id))


    def set_user_offline(self):
        bd.update('update chat_chatuser set is_online=0 where user_id=%s and tpa_id=%s' % (self.current_user_id, self.tpa_id))

    def redis_message(self, result):
        ''' recieving  message from redis server, 
            convertin it in json format 
            and sending it to the current chanel
        '''
        message = json.loads(result.body)
        self.send(json.dumps(message))

 
    def check_origin(self, origin):
        return True
 
application = tornado.web.Application([
    (r'/ws', WSHandler),
])
 
 
if __name__ == "__main__":
    http_server = tornado.httpserver.HTTPServer(application)
    http_server.listen(8888)
    myIP = socket.gethostbyname(socket.gethostname())
    print '*** Websocket Server Started at %s***' % myIP
    tornado.ioloop.IOLoop.instance().start()
