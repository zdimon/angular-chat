import json
import logging
import brukva
c = brukva.Client()
c.connect()
logger = logging.getLogger(__name__)
logger.setLevel('DEBUG')



def handle(message):  
    #print '######'
    if message['action'] == 'invite':
        mes = {'action': 'invite'}
        c.publish('%s_%s' % ( message['tpa'], message['opponent'] ), json.dumps(mes))
        print "invite"
    if message['action'] == 'send_message':
        mes = { "action" : "send_message", "message": message['message']}
        c.publish('%s_%s' % (  message['tpa_name'], message['user_id'] ), json.dumps(mes))



            
