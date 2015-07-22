import redgreenunittest as unittest
from colorize import bcolors
import json
import requests
from base import TestBase

class TestStringMethods(TestBase):

        
    def test_is_auth(self):
        data = {'user_id': 2 }
        url =  self.server+'api/is_auth/tpa1com'
        print bcolors.blue('REQUEST TO %s' % url)
        headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}
        responce = requests.get(url, data=json.dumps(data), headers=headers)
        self.assertEqual(responce.status_code, 200)
        outdata = json.loads(responce.content)
        print bcolors.blue(outdata)
        #import pdb; pdb.set_trace()
        #self.assertEqual(outdata['status'], 0)



if __name__ == '__main__':
    unittest.main()

