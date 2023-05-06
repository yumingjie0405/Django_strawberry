import pandas as pd
import numpy as np
import torch
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.tree import DecisionTreeClassifier

# 读取csv文件并打乱数据
data = pd.read_csv("../media/data/Crop_recommendation.csv")
data = data.sample(frac=1, random_state=42).reset_index(drop=True)

# 划分数据集为训练集和测试集
X = data.iloc[:, :-1].values
y = data.iloc[:, -1].values
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# 对数据进行标准化处理
sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)

# 使用sklearn的决策树模型进行训练
clf = DecisionTreeClassifier()
clf.fit(X_train, y_train)

# 在测试集上进行预测并计算准确率
y_pred = clf.predict(X_test)
accuracy = np.mean(y_pred == y_test)
print('Test Accuracy: {:.2f}%'.format(accuracy * 100))
from sklearn.tree import plot_tree
import matplotlib.pyplot as plt

plt.figure(figsize=(20, 10))
plot_tree(clf, filled=True, feature_names=data.columns[:-1])
plt.show()

# 按照不同种类的作物进行分组，并统计每组中pH值的平均值
grouped_data = data.groupby('label')['ph'].mean()

# 将结果绘制成柱状图
fig, ax = plt.subplots(figsize=(10, 6), dpi=100)
grouped_data.plot(kind='bar', ax=ax)

# 设置坐标轴标签和标题
ax.set_xlabel('Crop', fontsize=14)
ax.set_ylabel('pH (mean)', fontsize=14)
ax.set_title('Mean pH Value by Crop Type', fontsize=16)

# 调整坐标轴标签的字体大小
ax.tick_params(axis='x', labelsize=12)
ax.tick_params(axis='y', labelsize=12)

# 显示图像
plt.show()
import seaborn as sns
# 可视化每个特征的分布
fig, axs = plt.subplots(nrows=2, ncols=3, figsize=(15, 10))
sns.histplot(data=data, x="N", hue="label", element="step", kde=True, ax=axs[0, 0])
sns.histplot(data=data, x="P", hue="label", element="step", kde=True, ax=axs[0, 1])
sns.histplot(data=data, x="K", hue="label", element="step", kde=True, ax=axs[0, 2])
sns.histplot(data=data, x="temperature", hue="label", element="step", kde=True, ax=axs[1, 0])
sns.histplot(data=data, x="humidity", hue="label", element="step", kde=True, ax=axs[1, 1])
sns.histplot(data=data, x="ph", hue="label", element="step", kde=True, ax=axs[1, 2])
plt.suptitle("Distribution of Features")

# 可视化每个特征与目标变量之间的关系
fig, axs = plt.subplots(nrows=2, ncols=3, figsize=(15, 10))
sns.boxplot(x="label", y="N", data=data, ax=axs[0, 0])
sns.boxplot(x="label", y="P", data=data, ax=axs[0, 1])
sns.boxplot(x="label", y="K", data=data, ax=axs[0, 2])
sns.scatterplot(x="temperature", y="humidity", hue="label", data=data, ax=axs[1, 0])
sns.scatterplot(x="ph", y="humidity", hue="label", data=data, ax=axs[1, 1])
sns.scatterplot(x="temperature", y="ph", hue="label", data=data, ax=axs[1, 2])
plt.suptitle("Relationship between Features and Target")
plt.show()