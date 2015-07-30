import redgreenunittest as unittest
from colorize import bcolors
import json
import requests
from base import TestBase
from utils.util import get_url_by_name, read_conf

class TestStringMethods(TestBase):

        
    def test_get_messages(self):
        '''
        Function get message in DB for room and app_name

        [server]/api/[room_id]/get_messages

        Example: http://chat.localhost/api/56/get_messages
        '''
        #import pdb; pdb.set_trace()
        data = { 'room_id': '56' }
        url = get_url_by_name('get_messages',{'room_id': '56'})
        print bcolors.blue('REQUEST TO %s' % url)
        headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}
        responce = requests.get(url, data=data)
        print responce.content
        self.assertEqual(responce.status_code, 200)
        outdata = json.loads(responce.content)
        print bcolors.blue(outdata)
        #import pdb; pdb.set_trace()
        self.assertEqual(outdata['status'], 0)


if __name__ == '__main__':
    unittest.main()

