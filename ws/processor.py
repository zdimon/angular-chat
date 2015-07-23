import json

import logging
import brukva
c = brukva.Client()
c.connect()
logger = logging.getLogger(__name__)
logger.setLevel('DEBUG')

class MessageProcessor(object):
    '''This  class manages with income messages from javascript. '''

    def __init__(self,*args):
        super(MessageProcessor, self).__init__(*args)
        self.client = brukva.Client()

    def subscribe(self, room):
        '''Subscribing user to the channel in the REDIS server'''
        self.client.subscribe(room) # Redis subscribe
        logger.debug('subscribing to room %s' % (room, )) # Debug
        self.client.listen(self.redis_message)


    def handle(self,message):  
        message = json.loads(message) 
        if message['action'] == 'connect':
            self.subscribe('%s_%s' % (message["tpa"], message["user_id"]))
            
