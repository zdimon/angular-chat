import redgreenunittest as unittest


class TestStringMethods(unittest.TestCase):




    def setUp(self):
        print 'test start!'
        
        
    def test_connect(self):
        self.assertEqual('foo'.upper(), 'FOO')


if __name__ == '__main__':
    unittest.main()

