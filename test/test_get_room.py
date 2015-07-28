import redgreenunittest as unittest
from colorize import bcolors
import json
import requests
from base import TestBase
from utils.util import get_url_by_name, read_conf

class TestStringMethods(TestBase):

        
    def test_get_room(self):
        '''
            Checking creating room by passing tree variables

            @caler_id: User whitch call enother one

            @opponent_id: User id who is called

            @app_name: Name of the application (TPA)      

            Router: [server]/api/[caler_id]/[opponent_id]/get_room_or_create 
            
            Example: http://chat.localhost/api/150031/150014/get_room_or_create 

            Response:
            
            {'status': 0, 'room_id': 234, participans: {'25': {'username': .....}} }


        '''
        apiconf = read_conf()
        data = {'appname': apiconf['config']['app_name'],'caler_id': '150031', 'opponent_id': '150014'}
        url =  get_url_by_name('get_room_or_create',{'app_name': apiconf['config']['app_name'],'caler_id': '150031', 'opponent_id': '150014'})
        print bcolors.blue('REQUEST TO %s' % url)
        headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}
        responce = requests.get(url, data=json.dumps(data), headers=headers)
        self.assertEqual(responce.status_code, 200)
        outdata = json.loads(responce.content)
        print bcolors.blue(outdata)
        #import pdb; pdb.set_trace()
        self.assertEqual(outdata['status'], 0)



if __name__ == '__main__':
    unittest.main()

