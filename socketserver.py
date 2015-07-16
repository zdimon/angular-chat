# -*- coding: utf-8 -*-
import tornado.httpserver
import tornado.websocket
import tornado.ioloop
import tornado.web
import socket
 
 
class WSHandler(tornado.websocket.WebSocketHandler):
    '''
    Websocket server that uses the Tornado websocket handler.
    Please run `pip install tornado` with python of version 2.7.9 or greater to install tornado.
    ''' 
    def open(self):
        print 'new connection'
      
    def on_message(self, message):
        'Accepting message from javasctipt client'
        print 'message received:  %s' % message
        # Reverse Message and send it back
        print 'sending back message: %s' % message[::-1]
        self.write_message(message[::-1])
 
    def on_close(self):
        print 'connection closed'
 
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
