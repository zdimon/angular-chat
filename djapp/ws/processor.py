import json
import logging
import brukva
c = brukva.Client()
c.connect()
logger = logging.getLogger(__name__)
logger.setLevel('DEBUG')
import requests

import sys, os
sys.path.append(os.path.join(os.path.dirname(__file__), '../djapp'))

from utils.db import MyDB
bd = MyDB()


def handle(message,connection): 


    if message['action'] == 'invite':
        mes = {'action': 'invite', 'user_id': connection.current_user_id}
        c.publish('%s_%s' % ( message['tpa'], message['opponent'] ), json.dumps(mes))

    if message['action'] == 'update_users_online':           
        mes = json.dumps({'action': 'update_users_online'})
        connection.broadcast(mes) 

    if message['action'] == 'video_charge':           
        tpa = bd.get('select id, name, charge_url from chat_tpa where name="%s" ' % message["app_name"])
        print 'video charging from %s ' % message
        data = [
                    {
                        'action': 'video', 
                        'user_id': message['user_id'], 
                        'opponent_id': message['opponent_id'], 
                        'price': 2, 
                        'app_name': message['app_name'],
                        'room_id': message["room_id"]
                    }
               ]
        url =  tpa['charge_url']
        #print bcolors.blue('REQUEST TO %s' % url)
        #headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}
        responce = requests.post(url, data=json.dumps(data))
        responce = json.loads(responce.content)
        # send command to close video
        if(responce['status']==1): 
            mes = {'action': 'close_video'}
            c.publish('%s_%s' % ( message['app_name'], message['user_id'] ), json.dumps(mes))            
        
        #if(respo)












            
