import redgreenunittest as unittest
from colorize import bcolors
import json
import requests
from base import TestBase

class TestStringMethods(TestBase):

        
    def test_login(self):
        data = {'username': 'admin', 'password': 'admin' }
        url = self.server+'api/login'
        print bcolors.blue('REQUEST TO %s' % url)
        headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}
        responce = requests.post(url, data={'ssss':'aaaaaa'})
        self.assertEqual(responce.status_code, 200)
        outdata = json.loads(responce.content)
        print bcolors.blue(outdata)
        #import pdb; pdb.set_trace()
        #self.assertEqual(outdata['status'], 0)



if __name__ == '__main__':
    unittest.main()

