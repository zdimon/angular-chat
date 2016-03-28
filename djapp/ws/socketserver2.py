import tornado.ioloop
import tornado.web
import tornado.websocket
import tornado.httpserver
from tornado.options import parse_command_line
from tornado import gen

import logging
import tornadoredis
import json

from urlparse import urlparse

from django.core.management.base import NoArgsCommand
from django.conf import settings

logging = logging.getLogger('base.tornado')

# store clients in dictionary..
clients = dict()

REDIS_URL = 'redis://localhost:6379/'
# REDIS_UPDATES_CHANNEL = 'django_bus'

class WSHandler(tornado.websocket.WebSocketHandler):
    def __init__(self, *args, **kwargs):
        self.client_id = None
        self._redis_client = None
        super(WSHandler, self).__init__(*args, **kwargs)
        self._connect_to_redis()
        self._listen()

    def open(self, *args):
        self.client_id = self.get_argument("Id")
        self.stream.set_nodelay(True)
        clients[self.client_id] = self

    def on_message(self, message):
        """
        :param message (str, not-parsed JSON): data from client (web browser)
        """
        print("on message")

    @gen.coroutine
    def _on_update(self, message):
        """
        Receive Message from Redis when data become published and send it to selected client.
        :param message (Redis Message): data from redis
        """
        body = json.loads(message.body)
        if self.client_id == body['client_id']:
            self.write_message(message.body)

    @tornado.gen.engine
    def _listen(self):
        """
        Listening chanel 'REDIS_UPDATES_CHANNEL'
        """
        yield tornado.gen.Task(self._redis_client.subscribe, settings.REDIS_UPDATES_CHANNEL)
        self._redis_client.listen(self._on_update)

    def on_close(self):
        """
        When client will disconnect (close web browser) then shut down connection for selected client
        """
        if self.client_id in clients:
            del clients[self.client_id]
            self._redis_client.unsubscribe(settings.REDIS_UPDATES_CHANNEL)
            self._redis_client.disconnect()

    def check_origin(self, origin):
        """
        Check if incoming connection is in supported domain
        :param origin (str): Origin/Domain of connection
        """
        return True

    def _connect_to_redis(self):
        """
        Extracts connection parameters from settings variable 'REDIS_URL' and
        connects stored client to Redis server.
        """
        redis_url = settings.REDIS_URL
        parsed = urlparse(redis_url)
        self._redis_client = tornadoredis.Client(host=parsed.hostname, port=parsed.port)
        self._redis_client.connect()


application = tornado.web.Application([
    (r'/ws', WSHandler),
])


if __name__ == "__main__":
    http_server = tornado.httpserver.HTTPServer(application)
    http_server.listen(8889)
    myIP = '127.0.0.1'
    print '*** Websocket Server Started at %s***' % myIP
    #tornado.ioloop.PeriodicCallback(send_charge_request, 60000).start()
    #tornado.ioloop.PeriodicCallback(clean_online, 60000).start()
    #tornado.autoreload.watch('restart')
    #tornado.autoreload.watch('socketserver.py')
    io_loop = tornado.ioloop.IOLoop.instance()
    #tornado.autoreload.start(io_loop)
    io_loop.start()  



class Command(NoArgsCommand):
    def handle_noargs(self, **kwargs):
        logging.info('Started Tornado')
        parse_command_line()
        app.listen(8889)
        tornado.ioloop.IOLoop.instance().start()
