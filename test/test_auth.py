import redgreenunittest as unittest
from colorize import bcolors
import json
import requests

class TestStringMethods(unittest.TestCase):




    def setUp(self):
        print bcolors.green('AUTH TEST')
        
        
    def test_is_auth(self):
        data = {'user_id': 2 }
        url = 'http://localhost:8008/api/is_auth'
        print bcolors.blue('REQUEST TO %s' % url)
        headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}
        responce = requests.post(url, data=json.dumps(data), headers=headers)
        self.assertEqual(responce.status_code, 200)
        outdata = json.loads(responce.content)
        #import pdb; pdb.set_trace()
        self.assertEqual(outdata.status, 0)


if __name__ == '__main__':
    unittest.main()

