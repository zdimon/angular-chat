from tornado.testing import AsyncHTTPTestCase, gen_test
from tornado.websocket import WebSocketHandler, websocket_connect
from tornado.web import Application
import tornado 
import json
from websocket import create_connection
import sys, os
sys.path.append(os.path.join(os.path.dirname(__file__), '../djapp'))
from utils.db import MyDB
bd = MyDB()



class EchoWebSocketHandler(tornado.websocket.WebSocketHandler):
    def on_message(self, message):
        self.write_message(message)


class WebSocketTest(AsyncHTTPTestCase):
    def get_app(self):
        app = Application([('/', EchoWebSocketHandler)])
        return app

  

    @gen_test
    def test_online(self):
        ws = yield websocket_connect(
            'ws://localhost:8888/ws',
            io_loop=self.io_loop)
        ws.write_message(json.dumps({'action': 'update_users_online'}))
        response = yield ws.read_message()
        
        response = json.loads(response)
        
        self.assertEqual('update_users_online', response['action'])


    

