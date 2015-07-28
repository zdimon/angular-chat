import redgreenunittest as unittest
from colorize import bcolors
import json
import requests
from base import TestBase
from utils.util import get_url_by_name

class TestStringMethods(TestBase):

        
    def test_profile_user(self):
        #import pdb; pdb.set_trace()
        url = get_url_by_name('get_profile_from_tpa',{'user_id':'150031'})
        print bcolors.blue('REQUEST TO %s' % url)
        responce = requests.get(url)
        outdata = json.loads(responce.content)
        print bcolors.blue(outdata)
        #import pdb; pdb.set_trace()
        #self.assertEqual(outdata['status'], 0)



if __name__ == '__main__':
    unittest.main()

