import redgreenunittest as unittest
from colorize import bcolors
import json
import requests
from base import TestBase
from utils.util import get_url_by_name
import re


class TestStringMethods(TestBase):

        
    def test_profile_user_from_tpa(self):
        url = get_url_by_name('get_profile_from_tpa',{'user_id': '14'})
        print bcolors.blue('REQUEST TO %s' % url)
        responce = requests.get(url)
        #print responce.content
        try:
            outdata = json.loads(responce.content)
        except Exception, err:
            
            
            for par in re.findall('<pre class="exception_value">(.*?)<\/pre>',responce.content):
                print bcolors.red('#######%s######' % par)
            #print responce.content
            self.fail(err)
        print bcolors.blue(outdata)
       
        #self.assertEqual(outdata['status'], 0)



if __name__ == '__main__':
    unittest.main()

