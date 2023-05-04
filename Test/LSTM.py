from datetime import datetime

import matplotlib.pyplot as plt
import mysql.connector
import numpy as np
import pandas as pd
import torch
from sklearn.preprocessing import MinMaxScaler
from torch import nn

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
# df['price_avg'] = (df['price_min'] + df['price_max']) / 2
# df = df[['price_avg']]

# 归一化处理
scaler = MinMaxScaler(feature_range=(0, 1))
df_scaled = scaler.fit_transform(df)

# 序列化处理
n_steps = 10  # 每组输入数据包含几个时间步长的数据
X = []
y = []
for i in range(n_steps, len(df_scaled)):
    X.append(df_scaled[i - n_steps:i, 0])
    y.append(df_scaled[i, 0])
X, y = np.array(X), np.array(y)
X = np.reshape(X, (X.shape[0], X.shape[1], 1))

# 划分训练集和测试集
train_size = int(len(X) * 0.7)
print('train_len', train_size)
X_train, X_test = X[:train_size], X[train_size:]
y_train, y_test = y[:train_size], y[train_size:]


# 构建 LSTM 模型
class LSTMPredictor(nn.Module):
    def __init__(self, input_size, hidden_size, num_layers, output_size):
        super().__init__()
        self.hidden_size = hidden_size
        self.num_layers = num_layers
        self.lstm = nn.LSTM(input_size, hidden_size, num_layers, batch_first=True)
        self.fc = nn.Linear(hidden_size, output_size)

    def forward(self, x):
        h0 = torch.zeros(self.num_layers, x.size(0), self.hidden_size).to(x.device)
        c0 = torch.zeros(self.num_layers, x.size(0), self.hidden_size).to(x.device)
        out, _ = self.lstm(x, (h0, c0))
        out = self.fc(out[:, -1, :])
        return out


model = LSTMPredictor(input_size=1, hidden_size=50, num_layers=2, output_size=1)

# 定义优化器和损失函数
criterion = nn.MSELoss()
optimizer = torch.optim.Adam(model.parameters(), lr=0.001)

# 训练模型
train_losses = []
num_epochs = 100
for epoch in range(num_epochs):
    inputs = torch.from_numpy(X_train).float()
    targets = torch.from_numpy(y_train).float()
    # 前向传播
    outputs = model(inputs)
    loss = criterion(outputs, targets)
    # 反向传播和优化
    optimizer.zero_grad()
    loss.backward()
    optimizer.step()
    train_losses.append(loss.item())
    if (epoch + 1) % 10 == 0:
        print(f'Epoch [{epoch + 1}/{num_epochs}], Loss: {loss.item():.4f}')

# 在测试集上预测
with torch.no_grad():
    inputs = torch.from_numpy(X_test).float()
    targets = torch.from_numpy(y_test).float()
    outputs = model(inputs)
    loss = criterion(outputs, targets)
    print(f'Test Loss: {loss.item():.4f}')
    outputs = outputs.detach().numpy()

# 反归一化处理
y_pred = scaler.inverse_transform(outputs)
y_test = scaler.inverse_transform([y_test])
print(y_pred)
rmse = np.sqrt(np.mean((y_pred - y_test) ** 2))
print(f'RMSE: {rmse}')

plt.plot(range(1, num_epochs + 1), train_losses, label='Training Loss')
plt.title('Training Loss')
plt.xlabel('Epoch')
plt.ylabel('Loss')
plt.legend()
plt.show()
