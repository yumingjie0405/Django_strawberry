import mysql.connector
import numpy as np
import pandas as pd
import torch
import torch.nn as nn
import matplotlib.pyplot as plt

# Parameters
DAYS_FOR_TRAIN = 30
HIDDEN_DIM = 64
NUM_LAYERS = 2
LEARNING_RATE = 0.01
NUM_EPOCHS = 100

# Connect to MySQL database
db = mysql.connector.connect(
  host="localhost",
  user="username",
  password="password",
  database="database_name"
)
cursor = db.cursor()

# Retrieve data on apple prices
cursor.execute("SELECT * FROM apple_prices")
rows = cursor.fetchall()
data = pd.DataFrame(rows, columns=["date", "price"])
data.set_index("date", inplace=True)

# Preprocess the data
avg_price = data.resample("D").mean()
avg_price = avg_price.dropna()
norm_avg_price = (avg_price - avg_price.min()) / (avg_price.max() - avg_price.min())

# Create a training set
def create_dataset(dataset, look_back):
    dataX, dataY = [], []
    for i in range(len(dataset) - look_back):
        a = dataset[i:(i + look_back), 0]
        dataX.append(a)
        dataY.append(dataset[i + look_back, 0])
    return np.array(dataX), np.array(dataY)

train_data = norm_avg_price.values[:int(len(norm_avg_price) * 0.7)]
test_data = norm_avg_price.values[int(len(norm_avg_price) * 0.7):]
train_X, train_Y = create_dataset(train_data, DAYS_FOR_TRAIN)
test_X, test_Y = create_dataset(test_data, DAYS_FOR_TRAIN)

# Define LSTM model
class LSTM_Regression(nn.Module):
    def __init__(self, input_dim, hidden_dim, num_layers, output_dim):
        super(LSTM_Regression, self).__init__()
        self.hidden_dim = hidden_dim
        self.num_layers = num_layers
        self.lstm = nn.LSTM(input_dim, hidden_dim, num_layers, batch_first=True)
        self.fc = nn.Linear(hidden_dim, output_dim)

    def forward(self, x):
        h0 = torch.zeros(self.num_layers, x.size(0), self.hidden_dim).requires_grad_()
        c0 = torch.zeros(self.num_layers, x.size(0), self.hidden_dim).requires_grad_()
        out, (hn, cn) = self.lstm(x, (h0.detach(), c0.detach()))
        out = self.fc(out[:, -1, :])
        return out

model = LSTM_Regression(1, HIDDEN_DIM, NUM_LAYERS, 1)

# Train the model
criterion = nn.MSELoss()
optimizer = torch.optim.Adam(model.parameters(), lr=LEARNING_RATE)

train_loss = []
test_loss = []

for epoch in range(NUM_EPOCHS):
    model.train()
    optimizer.zero_grad()
    train_inputs = torch.from_numpy(train_X).type(torch.Tensor)
    train_outputs = torch.from_numpy(train_Y).type(torch.Tensor)
    train_pred = model(train_inputs)
    loss = criterion(train_pred, train_outputs)
    loss.backward()
    optimizer.step()
    train_loss.append(loss.item())

    # Evaluate on test set
    with torch.no_grad():
        model.eval()
        test_inputs = torch.from_numpy(test_X).type(torch.Tensor)
        test_outputs = torch.from_numpy(test_Y).type(torch.Tensor)
        test_pred = model(test_inputs)
        loss = criterion(test_pred, test_outputs)
        test_loss.append(loss.item())

    # if epoch % 10 ==
