from datetime import datetime
import matplotlib.pyplot as plt
import mysql.connector
import numpy as np
import pandas as pd
import torch
from sklearn.preprocessing import MinMaxScaler
from torch import nn

DAYS_FOR_TRAIN = 10

'''
生成未来时间段内的输入序列
'''


def create_future_input_sequence(dataset, days_for_train, days_for_predict):
    input_sequence = []
    start_index = len(dataset) - days_for_train
    end_index = len(dataset) - 1
    for i in range(start_index, end_index):
        input_sequence.append(dataset[i])
    for i in range(days_for_predict):
        predicted_price = input_sequence[-1]
        input_sequence.append(predicted_price)
    return np.array(input_sequence)


class LSTM_Regression(nn.Module):

    def __init__(self, input_size, hidden_size, output_size=1, num_layers=2):
        super().__init__()

        self.lstm = nn.LSTM(input_size, hidden_size, num_layers)
        self.fc = nn.Linear(hidden_size, output_size)

    def forward(self, _x):
        x, _ = self.lstm(_x)  # _x is input, size (seq_len, batch, input_size)

        s, b, h = x.shape  # x is output, size (seq_len, batch, hidden_size)
        x = x.view(s * b, h)
        x = self.fc(x)
        x = x.view(s, b, -1)  # 把形状改回来
        return x


def create_dataset(data, days_for_train=5) -> (np.array, np.array):
    """
        根据给定的序列data，生成数据集

        数据集分为输入和输出，每一个输入的长度为days_for_train，每一个输出的长度为1。
        也就是说用days_for_train天的数据，对应下一天的数据。

        若给定序列的长度为d，将输出长度为(d-days_for_train+1)个输入/输出对
    """
    dataset_x, dataset_y = [], []
    for i in range(len(data) - days_for_train):
        _x = data[i:(i + days_for_train)]
        dataset_x.append(_x)
        dataset_y.append(data[i + days_for_train])
    return (np.array(dataset_x), np.array(dataset_y))


# 创建连接
cnx = mysql.connector.connect(user='root',
                              password='123456',
                              host='127.0.0.1',
                              database='crop')

# 执行查询
cursor = cnx.cursor()
cursor.execute("SELECT date, price_min, price_max FROM apple_prices")
data = cursor.fetchall()

# 关闭连接
cursor.close()
cnx.close()
# 将数据处理为 Pyecharts 需要的格式
x_data = [datetime.strptime(str(d[0]), '%Y-%m-%d') for d in data]
y_data_min = [d[1] for d in data]
y_data_max = [d[2] for d in data]

# 构建LSTM数据
df = pd.DataFrame(data, columns=['date', 'price_min', 'price_max'])
df['date'] = pd.to_datetime(df['date'], format='%Y-%m-%d')
print(df.head())
df['price_avg'] = (df['price_min'] + df['price_max']) / 2
df = df[['price_avg']]

# 归一化处理
scaler = MinMaxScaler(feature_range=(0, 1))
df_scaled = scaler.fit_transform(df)

dataset_x, dataset_y = create_dataset(df_scaled, DAYS_FOR_TRAIN)
print(len(dataset_x))
print(len(dataset_y))
# 划分训练集和测试集，70%作为训练集
train_size = int(len(dataset_x) * 0.7)

train_x = dataset_x[:train_size]
train_y = dataset_y[:train_size]
# 将数据改变形状，RNN 读入的数据维度是 (seq_size, batch_size, feature_size)
train_x = train_x.reshape(-1, 1, DAYS_FOR_TRAIN)
train_y = train_y.reshape(-1, 1, 1)

# 转为pytorch的tensor对象
train_x = torch.from_numpy(train_x)
train_y = torch.from_numpy(train_y)
print(train_x.dtype)
model = LSTM_Regression(DAYS_FOR_TRAIN, 8, output_size=1, num_layers=2)  # 导入模型并设置模型的参数输入输出层、隐藏层等
model = model.double()
model_total = sum([param.nelement() for param in model.parameters()])  # 计算模型参数
print("Number of model_total parameter: %.8fM" % (model_total / 1e6))

train_loss = []
loss_function = nn.MSELoss()
optimizer = torch.optim.Adam(model.parameters(), lr=1e-2, betas=(0.9, 0.999), eps=1e-08, weight_decay=0)
for i in range(200):
    out = model(train_x)
    loss = loss_function(out, train_y)
    loss.backward()
    optimizer.step()
    optimizer.zero_grad()
    train_loss.append(loss.item())

    # 将训练过程的损失值写入文档保存，并在终端打印出来
    with open('log.txt', 'a+') as f:
        f.write('{} - {}\n'.format(i + 1, loss.item()))
    if (i + 1) % 10 == 0:
        print('Epoch: {}, Loss:{:.5f}'.format(i + 1, loss.item()))

# 画loss曲线
fig_loss = plt.figure()

plt.plot(train_loss, 'b', label='loss')
plt.title("Train_Loss_Curve")
plt.ylabel('train_loss')
plt.xlabel('epoch_num')
plt.show(block=False)

# for test
model = model.eval()  # 转换成测试模式
# model.load_state_dict(torch.load('model_params.pkl'))  # 读取参数

# 注意这里用的是全集 模型的输出长度会比原数据少DAYS_FOR_TRAIN 填充使长度相等再作图
dataset_x = dataset_x.reshape(-1, 1, DAYS_FOR_TRAIN)  # (seq_size, batch_size, feature_size)
dataset_x = torch.from_numpy(dataset_x)

pred_test = model(dataset_x)  # 全量训练集
# 的模型输出 (seq_size, batch_size, output_size)
pred_test = pred_test.view(-1).data.numpy()
pred_test = np.concatenate((np.zeros(DAYS_FOR_TRAIN), pred_test))  # 填充0 使长度相同
assert len(pred_test) == len(df_scaled)
pred_test_scaled = pred_test.reshape(-1, 1)  # 转换为列向量
pred_test_unscaled = scaler.inverse_transform(pred_test_scaled).flatten()  # 反归一化
df_unscaled =  scaler.inverse_transform(df_scaled).flatten()
print(pred_test_unscaled)
plt.plot(pred_test_unscaled, 'r', label='prediction')
# plt.plot(df_unscaled, 'b', label='real')
plt.plot((train_size, train_size), (0, 1), 'g--')  # 分割线 左边是训练数据 右边是测试数据的输出
plt.legend(loc='best')

plt.show()
'''
分割
'''
# future_x = dataset_x.reshape(-1, 1, DAYS_FOR_TRAIN)
# future_x = torch.from_numpy(future_x)
# pred_test = model(future_x)
# pred_test = pred_test.view(-1).data.numpy()
# # scaler.fit(dataset_x[:, :, 0].reshape(-1, 1))
# for i in range(9):
#     pred_last_day = pred_test[-1]
#     new_data_point = np.concatenate((future_x[-1, :, 1:].flatten()[1:], [pred_last_day]))
#     new_data_point = scaler.transform(new_data_point.reshape(1, -1))
#     new_data_point = new_data_point.reshape(1, 1, -1)
#     future_x = np.concatenate((future_x, new_data_point), axis=0)
#     future_x = future_x[1:, :, :]
#     pred_test = model(torch.from_numpy(future_x))
#     pred_test = pred_test.view(-1).data.numpy()
#
#     scaler.n_features_in_ = new_data_point.shape[1]
#
# plt.plot(np.concatenate((df_scaled, pred_test)), 'r', label='prediction')
# plt.plot(df_scaled, 'b', label='real')
# plt.legend(loc='best')
# plt.show()
