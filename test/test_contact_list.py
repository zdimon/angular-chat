import redgreenunittest as unittest
from colorize import bcolors
import json
import requests
from base import TestBase

class TestStringMethods(TestBase):

        
    def test_contact_list(self):
        import pdb; pdb.set_trace()
        data = {'tpa_name': 'tpa1com'}
        url = self.server+'api/get_contact_list/tpa1com'
        print bcolors.blue('REQUEST TO %s' % url)
        responce = requests.post(url, data=data)
        self.assertEqual(responce.status_code, 200)
        outdata = json.loads(responce.content)
        print bcolors.blue(outdata)
        #import pdb; pdb.set_trace()
        #self.assertEqual(outdata['status'], 0)



if __name__ == '__main__':
    unittest.main()

