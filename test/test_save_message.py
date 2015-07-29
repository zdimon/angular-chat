import redgreenunittest as unittest
from colorize import bcolors
import json
import requests
from base import TestBase
from utils.util import get_url_by_name, read_conf

class TestStringMethods(TestBase):

        
    def test_save_message(self):
        '''
        Function save message owner in DB 

        parameters by POST: app_name,owner_id,room_id,message

        [server]/api/save_message

        Example: http://chat.localhost/api/save_message
        '''
        apiconf = read_conf()
        data = {'app_name': apiconf['config']['app_name'],'owner_id': '150031', 'room_id': '51', 'message': 'Hello peoples'}
        #import pdb; pdb.set_trace()
        url = get_url_by_name('save_message',{'app_name': apiconf['config']['app_name'],})
        print bcolors.blue('REQUEST TO %s' % url)
        headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}
        responce = requests.post(url, data=data)
        print responce.content
        self.assertEqual(responce.status_code, 200)
        outdata = json.loads(responce.content)
        print bcolors.blue(outdata)
        #import pdb; pdb.set_trace()
        self.assertEqual(outdata['status'], 0)


if __name__ == '__main__':
    unittest.main()

