import redgreenunittest as unittest
from colorize import bcolors

class TestBase(unittest.TestCase):
    server = ''

    def setUp(self):
        self.server = 'http://localhost:8008/'
        

