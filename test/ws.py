import unittest
import websocket
from websocket import create_connection

class TestStringMethods(unittest.TestCase):




    def setUp(self):
        #self.ws = create_connection("ws://localhost:8888/ws")
        #self.ws.send("Hello, World")
        def on_message(ws, message):
            print message

        def on_error(ws, error):
            print error

        def on_close(ws):
            print "### closed ###"

        def on_open(ws):
            print 'start serve'
            self.ws.send("Hello, World")

        self.ws = websocket.WebSocketApp("ws://localhost:8888/ws",
        on_message = on_message,
        on_error = on_error,
        on_close = on_close)
        self.ws.on_open = on_open
        self.ws.run_forever()
        
        
    def test_connect(self):
        self.assertEqual('foo'.upper(), 'FOO')


if __name__ == '__main__':
    unittest.main()

