from tornado.testing import AsyncHTTPTestCase, gen_test
from tornado.websocket import WebSocketHandler, websocket_connect
from tornado.web import Application
import tornado 
import json
from websocket import create_connection
import sys, os
sys.path.append(os.path.join(os.path.dirname(__file__), '../djapp'))
sys.path.append(os.path.join(os.path.dirname(__file__), '../ws'))
from utils.db import MyDB
bd = MyDB()
import brukva
c = brukva.Client()
c.connect()


class EchoWebSocketHandler(tornado.websocket.WebSocketHandler):
    def on_message(self, message):
        self.write_message(message)


class WebSocketTest(AsyncHTTPTestCase):

    def __init__(self,*args):
        '''Initialization'''
        super(WebSocketTest, self).__init__(*args)  
        self.client = brukva.Client()
        self.client.connect()

    def get_app(self):
        app = Application([('/', EchoWebSocketHandler)])
        return app

  

    @gen_test
    def test_online(self):
        ws = yield websocket_connect(
            'ws://localhost:8888/ws',
            io_loop=self.io_loop)

        '''Subscribing user to the channel in the REDIS server'''
        self.client.subscribe('tpa1com_14') # Redis subscribe
        print 'subscribe to tpa1com_14'
        self.client.listen(self.redis_message)
        ws.write_message(json.dumps({'action': 'connect', 'user_id': 14, 'tpa': 'tpa1com'}))
        response = yield ws.read_message()
        ws.write_message(json.dumps({'action': 'invite', 'opponent': 14, 'tpa': 'tpa1com'}))
        response = yield ws.read_message()
        #self.assertEqual('update_users_online', response['action'])
    def redis_message(self, result):
        message = json.loads(result.body)
        print message   

        


    

