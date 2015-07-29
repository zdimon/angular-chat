import redgreenunittest as unittest
from colorize import bcolors
import json
import re
import requests
from base import TestBase
from utils.util import get_url_by_name

class TestStringMethods(TestBase):

        
    def test_add_contact_list(self):
        #import pdb; pdb.set_trace()
        url = get_url_by_name('add_contact',{'app_name':'tpa1com','owner_id':'150031','contact_id':'150014'})
        print bcolors.blue('REQUEST TO %s' % url)
        responce = requests.get(url)

        if responce.status_code <> 200:
            for par in re.findall('<pre class="exception_value">(.*?)<\/pre>',responce.content):
                print bcolors.red('#######%s######' % par)

        outdata = json.loads(responce.content)
        print bcolors.blue(outdata)
        #import pdb; pdb.set_trace()
        #self.assertEqual(outdata['status'], 0)



if __name__ == '__main__':
    unittest.main()

