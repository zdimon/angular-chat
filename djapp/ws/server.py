from tornado import websocket, web, ioloop, autoreload
from sockjs.tornado import SockJSRouter, SockJSConnection
from sockjs.tornado.periodic import Callback
import json
import os
import tornadoredis
from tornado import gen
cl = []
from chat.tasks import set_online, clean_online
from utils.redisender import bclient
bclient = bclient()


class ChatConnection(SockJSConnection): 
    global clients
    clients = []
    def __init__(self,*args):
        super(ChatConnection, self).__init__(*args)  
        self._connect_to_redis()
        self.current_user_id = None
        self.is_subscribed = False

    @gen.engine
    def _listen(self,channel):
        yield gen.Task(self._redis_client.subscribe, channel)
        self._redis_client.listen(self._on_update)

    @gen.coroutine
    def _on_update(self, message):
        """
        Receive Message from Redis when data become published and send it to selected client.
        :param message (Redis Message): data from redis
        """
        
        body = json.loads(message.body)
        #print body
        self.send(message.body)
        #self.write_message(message.body)


    def _connect_to_redis(self):
        self._redis_client = tornadoredis.Client(host='localhost', port=6379)
        self._redis_client.connect()

    def check_origin(self, origin):
        return True

    def on_message(self, msg):
        #print msg
        message = json.loads(msg)
        #print message[1]['user_id']
        act = message[0]
        data = json.loads(message[1])
        #print data
        self.send(message)

        if act == 'connect':
            print clients
            self.current_user_id = data["user_id"]
            if not int(data["user_id"]) in clients:
                clients.append(int(data["user_id"]))
            if self.is_subscribed==False:
                chanel = '%s_%s' % (data['tpa'],data['user_id'])
                self._listen(chanel)
                print 'I an listening %s chanel' % chanel
                self.is_subscribed = True

            
            set_online.delay(data)
        

    def open(self):
        if self not in cl:
            cl.append(self)

    def on_close(self):
        if self in cl:
            cl.remove(self)
        try:
            clients.remove(int(self.current_user_id))
        except:
            print 'Error removing client'

ChatRouter = SockJSRouter(ChatConnection, '/chat')

app = web.Application(ChatRouter.urls)


def check_online():
    print 'clean online %s' % clients
    clean_online.delay(clients)





if __name__ == '__main__':
    import logging
    logging.getLogger().setLevel(logging.DEBUG)
    app.listen(5555)
    clean_online.delay([])
    # to reload tornado server after changing index.html template
    #autoreload.watch('index.html') 
    #autoreload.watch('angular.html')
    #sockjs.tornado.periodic.Callback(clean_online, 1000).start()
    #tornado.ioloop.PeriodicCallback(clean_online, 1000).start()
    io_loop = ioloop.IOLoop.instance()
    autoreload.start(io_loop)  
    ioloop.IOLoop.instance().start()


    print "server is runing on 5555 port"

