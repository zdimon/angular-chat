#import tornadoredis
#bclient = tornadoredis.Client(host='localhost', port=6379)
import json

def singleton(class_):
  instances = {}
  def getinstance(*args, **kwargs):
    if class_ not in instances:
        instances[class_] = class_(*args, **kwargs)
    return instances[class_]
  return getinstance

import brukva

@singleton
class bclient():
    def publish(self,channel,message):
        bc = brukva.Client()
        bc.connect()
        m = json.loads(message)
        mes = [m['action'],m]
        #m.append(message['action'])
        #message = [message['action'],message]
        mes = json.dumps(mes)
        print "%s mess %s" % (channel,mes)
        self.bc.publish(str(channel), mes)
        bc.disconnect()
   
