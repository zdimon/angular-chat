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




    def handle(self,message):  
        if message['action'] == 'send_message':
            print 'jjjjjjjjjjjjjjjjjjjjjjjjjjjjj'




            
