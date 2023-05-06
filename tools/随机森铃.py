import numpy as np
import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
import matplotlib.pyplot as plt
import seaborn as sns

# 读取数据
data = pd.read_csv("../media/data/Crop_recommendation.csv")

# 将标签列单独提取出来作为y
y = data["label"]

# 将特征列提取出来作为X
X = data.drop("label", axis=1)

# 将数据集分为训练集和测试集
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

# 建立随机森林模型，n_estimators表示树的数量，可以根据需要进行调整
rf = RandomForestClassifier(n_estimators=100)

# 训练模型
rf.fit(X_train, y_train)

# 在训练集和测试集上分别计算准确率
train_score = accuracy_score(y_train, rf.predict(X_train))
test_score = accuracy_score(y_test, rf.predict(X_test))

# 打印准确率
print("Training set score: {:.2f}".format(train_score))
print("Test set score: {:.2f}".format(test_score))

# 可视化特征的重要性
importances = rf.feature_importances_
indices = np.argsort(importances)[::-1]

plt.figure(figsize=(12,6))
plt.title("Feature importances")
sns.barplot(x=importances[indices], y=X.columns[indices])
plt.show()

# 可视化单棵决策树
from sklearn.tree import export_graphviz
import pydot

tree = rf.estimators_[0]

export_graphviz(tree, out_file='tree.dot', feature_names=X.columns, rounded=True, precision=1)

(graph, ) = pydot.graph_from_dot_file('tree.dot')

graph.write_png('tree.png')

# 可视化随机森林的决策边界
from mlxtend.plotting import plot_decision_regions

plot_decision_regions(X_test.values, y_test.values, clf=rf, legend=2)
plt.title("Random Forest Decision Boundary")
plt.show()
