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

    def open(self):
        print 'new connection'

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
            self.subscribe('%s_%s' % (message["tpa"], message["user_id"]))
            self.current_user_id = message["user_id"]    
            #set_user_online(message["user_id"])    
        self.processor.handle(message)

 
    def on_close(self):
        ''' Method whith fires when connection is closed. '''
        print 'connection closed'
        set_user_offline(self.current_user_id)


    def set_user_online(self,user_id):
        '''TODO'''
        pass


    def set_user_offline(self,user_id):
        '''TODO'''
        pass

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
