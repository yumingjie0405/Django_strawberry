import mysql.connector

# 连接到数据库
conn = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="123456",

)

# 创建一个游标对象
cursor = conn.cursor()

# 创建数据库
# cursor.execute("CREATE DATABASE mydatabase")

# 切换到新创建的数据库
cursor.execute("USE crop")

# 创建表
cursor.execute("CREATE TABLE apple_prices (date DATE, price_min FLOAT, price_max FLOAT)")

# 关闭游标和连接
print('finish create')
cursor.close()
conn.close()
