from djapp.settings import DATABASES
import PySQLPool

class MyDB(object):

    def __init__(self):
        self.con = PySQLPool.getNewConnection(username=DATABASES['default']['USER'],
                     password=DATABASES['default']['PASSWORD'], host=DATABASES['default']['HOST'],
                     db=DATABASES['default']['NAME'])
        self.query = PySQLPool.getNewQuery(self.con)
        self.query.Query('SET SQL_SAFE_UPDATES=0')

    def select(self,sql):
        query = PySQLPool.getNewQuery(self.con)
        query.Query(sql)
        return query

    def count(self,sql):
        query = PySQLPool.getNewQuery(self.con)
        query.Query(sql)
        return query.rowcount

    def update(self,sql):
        query = PySQLPool.getNewQuery(self.con)
        query.Query(sql)
        return query

    def get(self,sql):
        query = PySQLPool.getNewQuery(self.con)
        query.Query(sql)
        for r in query.record:
            return r




