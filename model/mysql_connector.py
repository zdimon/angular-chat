import PySQLPool

connection = PySQLPool.getNewConnection(username='root', password='1q2w3e', host='localhost', db='angular-chat')
query = PySQLPool.getNewQuery(connection)
query.Query('select * from chat_chatuser')
for row in query.record:
    print row['name']
