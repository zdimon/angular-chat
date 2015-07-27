import json
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


def handle(message,connection): 

    if message['action'] == 'send_message':
        mes = { "action" : "send_message", "message": message['message']}
        c.publish('%s_%s' % (  message['tpa_name'], message['user_id'] ), json.dumps(mes))

    if message['action'] == 'invite':
        mes = {'action': 'invite', 'user_id': self.current_user_id}
        c.publish('%s_%s' % ( message['tpa'], message['opponent'] ), json.dumps(mes))

    if message['action'] == 'update_users_online':           
        mes = json.dumps({'action': 'update_users_online'})
        connection.broadcast(mes) 

    if message['action'] == 'get_users_online':           
        pass







            
