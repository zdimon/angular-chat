import redgreenunittest as unittest
from colorize import bcolors
import json
import requests
from base import TestBase
from utils.util import get_url_by_name

class TestStringMethods(TestBase):

        
    def test_login(self):
        url = get_url_by_name('login',{'user_id':'14'})
        print bcolors.blue('REQUEST TO %s' % url)
        responce = requests.get(url)
        outdata = json.loads(responce.content)
        print bcolors.blue(outdata)
        self.assertEqual(responce.status_code, 200)
        #import pdb; pdb.set_trace()
        #self.assertEqual(outdata['status'], 0)



if __name__ == '__main__':
    unittest.main()

