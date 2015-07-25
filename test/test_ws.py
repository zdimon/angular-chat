from tornado.testing import AsyncHTTPTestCase, gen_test
from tornado.websocket import WebSocketHandler, websocket_connect
from tornado.web import Application
import tornado 
import json
import sys, os
sys.path.append(os.path.join(os.path.dirname(__file__), '../djapp'))
from utils.db import MyDB
bd = MyDB()

class MyHandler(WebSocketHandler):
    """ This is the server code you're testing."""

    def on_message(self, message):
        # Put whatever response you want in here.
        self.write_message("a_response\n")


class EchoWebSocketHandler(tornado.websocket.WebSocketHandler):
    def on_message(self, message):
        self.write_message(message)


class WebSocketTest(AsyncHTTPTestCase):
    def get_app(self):
        app = Application([('/', EchoWebSocketHandler)])
        return app

    @gen_test
    def test_connection(self):
        #bd.update('update chat_chatuser set is_online=0')
        ws = yield websocket_connect(
            'ws://localhost:8888/ws',
            io_loop=self.io_loop)
        ws.write_message(json.dumps({'action': 'connect'}))
        response = yield ws.read_message()
        response = json.loads(response)
        self.assertEqual("'tpa'", response['message'])

        ws.write_message(json.dumps({'action': 'connect', 'user_id': 1, 'tpa': 'tpa1com'}))
        response = yield ws.read_message()
        response = json.loads(response)
        self.assertEqual(0, response['status'])

        print response
        cnt = bd.count('select * from chat_chatuser where is_online=1 and user_id=%s' % response['user_id'])
        
        self.assertEqual(1, cnt)
        print '###%s' % cnt





