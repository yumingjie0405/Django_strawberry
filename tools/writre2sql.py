import csv
from datetime import datetime

import mysql.connector
import pandas as pd

# 连接到数据库
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="123456",
    database="crop"
)

# 创建一个游标对象
cursor = conn.cursor()

# # 读取 csv 文件
# with open('../media/data/env.csv') as csvfile:
#     reader = csv.reader(csvfile)
#     next(reader)  # 跳过表头
#     for row in reader:
#         # date = datetime.strptime(row[0], '%d-%m-%Y').strftime('%Y-%m-%d')
#
#         # 插入数据到表中
#         cursor.execute(
#             "INSERT INTO apple_prices (N, P, K,temperature,hunidity,ph,rainfall,label) VALUES (%s, %s, %s,%s, %s, %s,%s)",
#             (row[0], row[1], row[2], row[3], row[4], row[5], row[6]))
#
# # 提交更改
# conn.commit()
df = pd.read_csv('../media/data/env.csv')
for index, row in df.iterrows():
    n = row['N']
    p = row['P']
    k = row['K']
    temperature = row['temperature']
    humidity = row['humidity']
    ph = row['ph']
    rainfall = row['rainfall']
    label = row['label']
    cursor.execute(f"INSERT INTO crop_env (N, P, K, temperature, humidity, ph, rainfall, label) VALUES ({n}, {p}, {k}, {temperature}, {humidity}, {ph}, {rainfall}, '{label}')")
conn.commit()
print('finish insert')
# 关闭游标和连接
cursor.close()
conn.close()
