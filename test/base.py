import redgreenunittest as unittest
from colorize import bcolors
import sys,os

sys.path.append(os.path.join(os.path.dirname(__file__), '../djapp'))

class TestBase(unittest.TestCase):
    server = ''

    def setUp(self):
        self.server = 'http://localhost:8008/'
        

