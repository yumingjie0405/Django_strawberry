# 安徽信息工程学院大三下实践项目

欢迎:star:🥰

---

安装环境：


| 姓名   | 班级           | 分工         |
| ------ | -------------- | ------------ |
| 余铭杰 | 人工智能2002班 | 深度学习     |
| 刘樾昕 | 人工智能2002班 | 前后端，MVC  |
| 常欣   | 人工智能2002班 | 文档、数据库 |

## 功能描述

* **病虫害识别**
  * 使用模型：yolov8
  * 识别种类：

    * 'Beans_Angular_LeafSpot',
    * 'Beans_Rust',
    * 'Strawberry_Angular_LeafSpot',
    * 'Strawberry_Anthracnose_Fruit_Rot',
    * 'Strawberry_Blossom_Blight',
    * 'Strawberry_Gray_Mold',
    * 'Strawberry_Leaf_Spot',
    * 'Strawberry_Powdery_Mildew_Fruit',
    * 'Strawberry_Powdery_Mildew_Leaf',
    * 'Tomato_Blight', 
    * 'Tomato_Leaf_Mold',
    * 'Tomato_Spider_Mites'
  * 数据集展示
    ![doc](./doc/doc.png)
  * 工作流程：
    * 输入图像被转换为 float32 类型的 NumPy 数组并传递给 YOLOv8 对象检测模型。
该模型对图像执行对象检测，并生成一个 JSON 对象，其中包含所有对象的名称及其在图像中各自的置信度。
* **农户问答**
* **农作物价格预测**
  * 功能：空气湿度、土壤湿度、土壤酸度和降雨量预测符符合合适的作物及其价格。
