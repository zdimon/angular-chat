import redgreenunittest as unittest
from colorize import bcolors
import json
import requests
from base import TestBase
from utils.util import get_url_by_name

class TestStringMethods(TestBase):

        
    def test_url_by_name(self):
        #import pdb; pdb.set_trace()
        dict_u = {'app_name':'tpa1com', 'user_id':'150031'}
        result = get_url_by_name('get_profile_from_tpa',dict_u)
        self.assertEqual('http://chat.localhost/api/tpa1com/get_profile_from_tpa/150031', result)



if __name__ == '__main__':
    unittest.main()

