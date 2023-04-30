import csv
from datetime import datetime

import mysql.connector

# 连接到数据库
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="123456",
    database="crop"
)

# 创建一个游标对象
cursor = conn.cursor()

# 读取 csv 文件
with open('../media/data/apple_conv.csv') as csvfile:
    reader = csv.reader(csvfile)
    next(reader)  # 跳过表头
    for row in reader:
        date = datetime.strptime(row[0], '%d-%m-%Y').strftime('%Y-%m-%d')

        # 插入数据到表中
        cursor.execute("INSERT INTO apple_prices (date, price_min, price_max) VALUES (%s, %s, %s)",
                       (date, row[1], row[2]))

# 提交更改
conn.commit()
print('finish insert')
# 关闭游标和连接
cursor.close()
conn.close()
