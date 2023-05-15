import cv2
import numpy as np
import pydot
import pymysql
from django.shortcuts import redirect
from django.views.generic import TemplateView
import matplotlib

matplotlib.use('Agg')
from pyecharts.charts import Bar, Boxplot, Map
from django.utils.safestring import mark_safe
from HelloWorld.models import DiseasesPests, Admin
from django.http import JsonResponse, HttpResponse
from ultralytics import YOLO
from datetime import datetime
from django.db import connection
import openai
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.tree import DecisionTreeClassifier
from pyecharts.charts import Bar, Line
from sklearn.tree import plot_tree
import matplotlib.pyplot as plt
import seaborn as sns
import io
import base64
from django_Crop.settings import BASE_DIR
from django.views.decorators.csrf import csrf_exempt


# 登陆
def login(request):
    if request.method == 'GET':
        return render(request, 'sign_in.html')
    username = request.POST.get("username")
    password = request.POST.get("password")
    try:
        admin = Admin.objects.filter(username=username).first()
        if admin.password == password:
            request.session["info"] = {'username': admin.username, 'password': admin.password}
            return redirect('/overview/')
    except Admin.DoesNotExist:
        pass
    return render(request, 'sign_in.html', {'error': '用户名或密码错误'})


# 注册
def register(request):
    if request.method == 'GET':
        return render(request, 'sign_up.html')

    # 获取输入的数据
    usn = request.POST.get("username")
    psw = request.POST.get("password")
    if Admin.objects.filter(username=usn).exists():
        return render(request, 'sign_up.html', {'error': '该用户名已存在，请重新注册。'})
    # 连接数据库
    Admin.objects.create(username=usn, password=psw)
    # 添加完成，返回给管理用户网页
    return redirect('/sign_in/')


# 退出登录
def logout_view(request):
    if 'info' in request.session:
        del request.session['info']
    # 返回到登陆页面
    return redirect('/sign_in/')


# 主界面
def overview(request):
    return render(request, 'overview.html')


def homepage(request):
    return render(request, 'homepage.html')


def about(request):
    return render(request, 'about.html')


def contact(request):
    return render(request, 'contact.html')


# 病虫害视觉识别
# 使用yolov8
def predict(request):
    if request.method == 'POST' and request.FILES['image']:
        # 获取上传的图像
        image_file = request.FILES['image']

        # 读取图像
        image = cv2.imdecode(np.frombuffer(image_file.read(), np.uint8), cv2.IMREAD_COLOR)

        # 进行推理
        results = your_yolov5_model(image)

        # 将结果保存为JSON格式
        response_data = {
            'confidence': results['confidence'].tolist(),
            'class': results['class'].tolist(),
            'bbox': results['bbox'].tolist(),
            'image_base64': cv2_to_base64(image),
            'result_image_base64': cv2_to_base64(results['img']),
        }
        # 返回结果
        return JsonResponse(response_data)
    # 显示上传表单
    return render(request, 'predict_show.html')


# def show_NLP_predict(request):
#     return render(request, 'NLP_predict.html')

# chatGPT主函数
class ChatView(TemplateView):
    template_name = "NLP_predict.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['websocket_url'] = "ws://" + self.request.get_host() + "/ws/chat/"
        return context


openai.api_key = "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"


@csrf_exempt
def chat(request):
    if request.method == "POST":
        # 获取用户提交的问题
        prompt = request.POST.get('prompt', None)
        print(prompt)
        # 调用 ChatGPT 接口
        model_engine = "text-davinci-003"
        completion = openai.Completion.create(
            engine=model_engine,
            prompt=prompt,
            max_tokens=1024,
            n=1,
            stop=None,
            temperature=0.5,
        )

        # 将返回结果包装在 <pre> 标签中，保留原本的排版格式
        response = '<pre>' + completion.choices[0].text + '</pre>'
        return JsonResponse({"response": response})
    else:
        return render(request, 'chat.html')


def show_price_predict(request):
    return render(request, 'price_predict.html')


def result(request):
    result = predict()
    print(result)
    return render(request, 'result_img.html', {"data": result})


'''
1、使用 Django 的数据库 API 从数据库中获取苹果价格数据。
2、将数据处理为 Pyecharts 绘制折线图所需要的格式，即将日期转换为 datetime 类型。
3、使用 Pyecharts 绘制折线图，其中包括两条折线，一条代表最低价，一条代表最高价。
4、设置图表的全局选项，包括标题、X 轴和 Y 轴标签、提示框等。
5、将图表渲染到 HTML 模板中
'''


# 经济预测
def show_data(request):
    DAYS_FOR_TRAIN = 10
    # 从数据库中获取数据
    cursor = connection.cursor()
    cursor.execute("SELECT date, price_min, price_max FROM apple_prices")
    data = cursor.fetchall()
    cursor.close()

    # 将数据处理为 Pyecharts 需要的格式
    x_data = [datetime.strptime(str(d[0]), '%Y-%m-%d') for d in data]
    y_data_min = [d[1] for d in data]
    y_data_max = [d[2] for d in data]

    # 绘制折线图
    line = (
        Line()
        .add_xaxis(xaxis_data=x_data)
        .add_yaxis(
            series_name="预测值",
            y_axis=y_data_min,
            linestyle_opts=opts.LineStyleOpts(width=2),
            itemstyle_opts=opts.ItemStyleOpts(color="#FF8C00"),
        )
        .add_yaxis(
            series_name="最高价",
            y_axis=y_data_max,
            linestyle_opts=opts.LineStyleOpts(width=2),
            itemstyle_opts=opts.ItemStyleOpts(color="#87CEEB"),
        )

        .set_global_opts(
            title_opts=opts.TitleOpts(title="价格走势图"),
            xaxis_opts=opts.AxisOpts(type_="time", name="日期"),
            yaxis_opts=opts.AxisOpts(name="价格"),
            tooltip_opts=opts.TooltipOpts(trigger="axis"),
            axispointer_opts=opts.AxisPointerOpts(type_="cross", label=opts.LabelOpts(formatter="{value}")),
        )

    )
    # 将图表渲染到 HTML 模板
    context = {"line": line.render_embed()}
    return render(request, "price_echarts.html", context)


# 数据库QA 已启用
def QA(request):
    if request.method == 'POST':
        disease_name = request.POST['disease']
        try:
            disease_info = DiseasesPests.objects.get(name=disease_name)
        except DiseasesPests.DoesNotExist:
            error_msg = f"No information found for '{disease_name}'"
            return render(request, 'qa.html', {'error_msg': error_msg})
        return render(request, 'qa.html', {'disease_info': disease_info})
    return render(request, 'qa.html')


# 第三模块总体预览
# def table(request):
#     return render(request, 'table.html')


# 天气预报
WEATHER_API_KEY = 'SPBVDFMMKeLXB2VYa'

# def get_weather_data(city):
#     url = f'https://api.seniverse.com/v3/weather/daily.json?key={WEATHER_API_KEY}&location={city}&language=zh-Hans&unit=c&start=0&days=14'
#     response = requests.get(url)
#     data = json.loads(response.content.decode())
#     if data.get('results'):
#         return data['results'][0]['daily']
#     return []


import requests
from django.shortcuts import render
import json


# 心知天气只能查看未来三天 淘汰
def XINZHI_weather(request):
    # 获取城市名称
    city = request.GET.get('city', '芜湖')
    # city = request.GET.get('city')

    # 根据城市名称调用心知天气API获取数据
    url = f'https://api.seniverse.com/v3/weather/daily.json?key={WEATHER_API_KEY}&location={city}&language=zh-Hans&unit=c&start=0&days=14'
    response = requests.get(url)
    data = json.loads(response.content.decode())

    # 从返回数据中提取最高和最低温度
    dates = []
    high_temps = []
    low_temps = []
    for item in data['results'][0]['daily'][:14]:
        dates.append(item['date'])
        high_temps.append(item['high'])
        low_temps.append(item['low'])

    # 将数据传递给模板
    context = {'city': city, 'dates': json.dumps(dates), 'high_temps': json.dumps(high_temps),
               'low_temps': json.dumps(low_temps)}

    return render(request, 'XINZHI_weather.html', context)


# 和风天气
def weather(request):
    # 获取城市名称

    # 调用和风天气API获取数据
    url = 'https://api.qweather.com/v7/weather/30d?location=101010100&key=f2d15caf06324b04b8d78388b0f5754f'
    response = requests.get(url)
    data = json.loads(response.content.decode())
    print(data)
    # 从返回数据中提取最高和最低温度
    dates = []
    high_temps = []
    low_temps = []
    for item in data['daily'][:12]:
        dates.append(item['fxDate'])
        high_temps.append(item['tempMax'])
        low_temps.append(item['tempMin'])

    # 将数据传递给模板
    context = {'dates': json.dumps(dates), 'high_temps': json.dumps(high_temps),
               'low_temps': json.dumps(low_temps)}
    return render(request, 'weather.html', context)


# 返回土壤信息,随机森林
# pass
def random_forest(request):
    # 读取数据
    data = pd.read_csv(r"C:\Users\smile\Desktop\django_-crop\media\data\Crop_recommendation.csv")

    # 将标签列单独提取出来作为y，并将y转换为整数类型
    y = data["label"].astype('category').cat.codes

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
    print("训练分数：", train_score)
    print("测试分数：", test_score)
    # 计算特征的重要性
    importances = rf.feature_importances_
    indices = np.argsort(importances)[::-1]

    # 特征重要性可视化
    feature_bar = (
        Bar()
        .add_xaxis(X.columns[indices])
        .add_yaxis("Feature Importance", importances[indices])
        .set_global_opts(title_opts=opts.TitleOpts(title="Feature Importances"))
        .dump_options_with_quotes()
    )

    # 随机森林决策边界可视化
    tree_data = []
    for i, tree in enumerate(rf.estimators_):
        if i > 10:  # 只显示前10棵树
            break
        tree_data.append(tree.tree_.children_left.tolist())
        tree_data.append(tree.tree_.children_right.tolist())
        tree_data.append(tree.tree_.feature.tolist())
        tree_data.append(tree.tree_.threshold.tolist())
        tree_data.append(tree.tree_.value.tolist())
    # print(tree_data)
    tree = (
        Tree()
        .add("", tree_data)
        .set_global_opts(title_opts=opts.TitleOpts(title="Random Forest Decision Boundary"))
        .dump_options_with_quotes()
    )

    return render(request, 'soil_info.html', {
        'train_score': train_score,
        'test_score': test_score,
        'feature_bar': feature_bar,
        'tree': tree,
    })


from pyecharts import options as opts
from pyecharts.charts import Tree
import os

# 读取 DOT 文件
with open(os.path.join(BASE_DIR, 'tools/tree.dot'), 'r') as f:
    dot_data = f.read()

# 将 DOT 文件转换为 Pyecharts 中的 Tree 对象
tree = Tree()
tree.add("", [], label_opts=opts.LabelOpts(font_size=14))
tree = tree.load_javascript()

# 将 DOT 数据转换为 JSON 格式
graph = pydot.graph_from_dot_data(dot_data)[0].to_string()


# 放弃，决策树太庞大
def show_decision_tree(request):
    # 读取 DOT 文件并转换为 PyDot 对象
    with open(os.path.join(BASE_DIR, 'tools/tree.dot'), 'r') as f:
        dot_data = f.read()
    graph = pydot.graph_from_dot_data(dot_data)[0]

    # 创建 Pyecharts 中的 Tree 对象
    tree = Tree()
    tree.add("", [], label_opts=opts.LabelOpts(font_size=14))

    # 遍历 DOT 对象并添加节点和边
    for node in graph.get_node_list():
        name = node.get_name()
        if 'parent' in node.obj_dict:
            parent = node.obj_dict['parent']
        else:
            parent = None
        if 'label' in node.obj_dict['attributes']:
            label = node.obj_dict['attributes']['label']
        else:
            label = None
        if parent:
            parent_name = parent[0].obj_dict['name']
            tree.add(name, [parent_name],
                     symbol='rect', symbol_size=[100, 30],
                     label_opts=opts.LabelOpts(font_size=14))
        else:
            tree.add(name, [],
                     symbol='rect', symbol_size=[100, 30],
                     label_opts=opts.LabelOpts(font_size=14))

    # 将图形数据转换为 JSON 格式
    json_data = tree.dump_options_with_quotes()
    # print(json_data)
    # 将图形数据和决策树字符串传递给前端页面
    return render(request, 'decision_tree.html', {
        'tree_data': json_data,
        'dot_data': dot_data,
    })


# data = pd.read_csv(os.path.join(BASE_DIR, 'media/data/Crop_recommendation.csv'))
def show_charts(request):
    # 读取csv文件并打乱数据
    data = pd.read_csv(os.path.join(BASE_DIR, 'media/data/Crop_recommendation.csv'))
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
    test_accuracy = '测试集上的正确率: {:.2f}%'.format(accuracy * 100)

    # 绘制决策树
    fig, ax = plt.subplots(figsize=(20, 10))
    plot_tree(clf, filled=True, feature_names=data.columns[:-1], ax=ax)
    # 将绘制好的图形转换为base64编码，以便在模板中显示
    buffer = io.BytesIO()
    plt.savefig(buffer, format='png')
    buffer.seek(0)
    image_base64 = base64.b64encode(buffer.getvalue()).decode()
    plt.close()

    # 按照不同种类的作物进行分组，并统计每组中pH值的平均值
    grouped_data = data.groupby('label')['ph'].mean()

    # 绘制柱状图
    bar_chart = (
        Bar()
        .add_xaxis(list(grouped_data.index))
        .add_yaxis("pH (mean)", list(grouped_data.values))
        .set_global_opts(
            xaxis_opts=opts.AxisOpts(axislabel_opts=opts.LabelOpts(rotate=30, font_size=12)),
            title_opts=opts.TitleOpts(title="各作物类型的平均 pH 值", subtitle="", pos_left='center', pos_top='top',
                                      padding=20)
        )
        .set_series_opts(
            label_opts=opts.LabelOpts(position="top", font_size=12)
        )
        .render()
    )
    # 将绘制好的图形转换为 base64 编码，以便在模板中显示
    bar_base64 = base64.b64encode(bytes(bar_chart, 'utf-8')).decode()

    # 可视化每个特征的分布
    fig, ax = plt.subplots()
    sns.histplot(data=data, x="N", hue="label", element="step", kde=True, ax=ax)
    ax.set(title="Distribution of N")
    buffer1 = io.BytesIO()
    fig.savefig(buffer1, format='png')
    buffer1.seek(0)
    image1_base64 = base64.b64encode(buffer1.getvalue()).decode()
    plt.close()

    fig, ax = plt.subplots()
    sns.histplot(data=data, x="P", hue="label", element="step", kde=True, ax=ax)
    ax.set(title="Distribution of P")
    buffer2 = io.BytesIO()
    fig.savefig(buffer2, format='png')
    buffer2.seek(0)
    image2_base64 = base64.b64encode(buffer2.getvalue()).decode()
    plt.close()

    fig, ax = plt.subplots()
    sns.histplot(data=data, x="K", hue="label", element="step", kde=True, ax=ax)
    ax.set(title="Distribution of K")
    buffer3 = io.BytesIO()
    fig.savefig(buffer3, format='png')
    buffer3.seek(0)
    image3_base64 = base64.b64encode(buffer3.getvalue()).decode()
    plt.close()  # 绘制箱线图
    box_data = [data[data['label'] == i]['rainfall'] for i in sorted(data['label'].unique())]
    box_labels = sorted(data['label'].unique())
    boxplot = (
        Boxplot()
        .add_xaxis(box_labels)
        .add_yaxis("Rainfall", box_data)
        .set_global_opts(
            xaxis_opts=opts.AxisOpts(axislabel_opts=opts.LabelOpts(rotate=30, font_size=12)),
            title_opts=opts.TitleOpts(title="Rainfall Distribution by Crop Type", subtitle="", pos_left='center',
                                      pos_top='top', padding=20)
        )
        .set_series_opts(
            label_opts=opts.LabelOpts(position="top", font_size=12),
            box_gap=20
        )
        .render_embed()
    )

    return render(request, 'charts.html', {'image_base64': image_base64,
                                           'bar_chart': mark_safe(bar_base64),
                                           'image1_base64': image1_base64,
                                           'image2_base64': image2_base64,
                                           'image3_base64': image3_base64,
                                           'boxplot': boxplot,
                                           'test_accuracy': test_accuracy})


import pymysql
from pyecharts.charts import Map
from pyecharts import options as opts
from django.http import JsonResponse
import pymysql
from django.http import JsonResponse
from pyecharts import options as opts
from pyecharts.charts import Map

# 引入 pyecharts 组件
from pyecharts.charts import Map
from pyecharts import options as opts


def country_map(request):
    # 连接 MySQL 数据库
    conn = pymysql.connect(
        host="localhost",
        user="root",
        password="123456",
        db="crop",
        port=3306,
        charset="utf8"
    )
    cursor = conn.cursor()

    # 从数据库中获取农作物数据
    cursor.execute("SELECT province, crop, price FROM strawberry_data")
    data = cursor.fetchall()

    # 将数据处理成 pyecharts 中需要的格式
    provinces = [x[0] for x in data]
    values = [x[2] for x in data]
    map_data = list(zip(provinces, values))

    # 使用 pyecharts 渲染中国地图
    map_chart = (
        Map()
        .add("草莓价格", map_data, "china")
        .set_global_opts(
            title_opts=opts.TitleOpts(title="中国草莓价格"),
            visualmap_opts=opts.VisualMapOpts(max_=20),
        )
    )
    map_html = map_chart.render_embed()
    # 将生成的 HTML 文件返回给用户
    return render(request, 'chinamap.html', {'map_html': map_html})


'''
tool
功能函数
'''


# 加载视觉识别模型
def your_yolov5_model(image):
    # 加载模型
    # model = YOLO('../media/model/best.pt')
    # rtain16 中文显示预测结果
    model = YOLO('../media/model/train16/weights/best.pt')
    results = model(image)
    boxes = results[0].boxes
    bbox = boxes.xywh
    confidence = boxes.conf  # confidence score, (N, 1)
    class_id = boxes.cls  # cls, (N, 1)
    res_plotted = results[0].plot()
    print(type(res_plotted))
    # cv2.imshow("result", res_plotted)
    # cv2.waitKey(0)
    # print('预测的类别：', class_id)
    # print('预测的置信度{}'.format(confidence))
    # print('预测的bbox',bbox)
    # 构建返回结果
    return {
        'confidence': confidence,
        'class': class_id,
        'bbox': bbox,
        'img': res_plotted
    }


# numpy 转 base64
def numpy_to_base64(arr):
    # 将numpy数组转换为字节流
    bytes_stream = arr.tobytes()

    # 将字节流编码为base64格式
    base64_str = base64.b64encode(bytes_stream).decode('utf-8')

    return base64_str


def cv2_to_base64(image):
    _, buffer = cv2.imencode('.jpg', image)
    image_bytes = buffer.tobytes()
    base64_bytes = base64.b64encode(image_bytes)
    base64_string = base64_bytes.decode('utf-8')
    return base64_string


# 生成LSTM数据
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
