#!/usr/bin/env python
# vim:fileencoding=utf-8
import os
import tornado.httpserver
import tornado.ioloop
import tornado.wsgi
import sys
import django.core.handlers.wsgi
from django.core.wsgi import get_wsgi_application



def main():
    os.environ['DJANGO_SETTINGS_MODULE'] = 'djapp.settings' # path to your settings module
    application = django.core.handlers.wsgi.WSGIHandler()
    application = get_wsgi_application()
    container = tornado.wsgi.WSGIContainer(application)
    http_server = tornado.httpserver.HTTPServer(container)
    http_server.listen(8888)
    tornado.ioloop.IOLoop.instance().start()

if __name__ == "__main__":
    main()
