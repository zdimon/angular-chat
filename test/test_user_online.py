import redgreenunittest as unittest
from colorize import bcolors
import json
import requests
from base import TestBase
from utils.util import get_url_by_name

class TestStringMethods(TestBase):

        
    def test_user_online(self):
        #import pdb; pdb.set_trace()
        url = get_url_by_name('get_online',{})
        print bcolors.blue('REQUEST TO %s' % url)
        responce = requests.post(url)
        try:
            outdata = json.loads(responce.content)
        except Exception:
            self.assertRaises(Exception)

        self.assertEqual(responce.status_code, 200)
        #print bcolors.blue(outdata)
        #import pdb; pdb.set_trace()
        #self.assertEqual(outdata['status'], 0)



if __name__ == '__main__':
    unittest.main()

