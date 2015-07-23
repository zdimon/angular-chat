from djapp.settings import DATABASES
import PySQLPool

class MyDB(object):

    def __init__(self):
        self.con = PySQLPool.getNewConnection(username=DATABASES['default']['USER'],
                     password=DATABASES['default']['PASSWORD'], host=DATABASES['default']['HOST'],
                     db=DATABASES['default']['NAME'])
        self.query = PySQLPool.getNewQuery(self.con)

    def select(self,sql):
        query = PySQLPool.getNewQuery(self.con)
        query.Query(sql)
        return query



