import base64
import cv2
import torch
import requests
from django.shortcuts import render, redirect
from django.views.generic import TemplateView
from sklearn.preprocessing import MinMaxScaler
from torch import nn
import json
from HelloWorld.LSTM import LSTM_Regression
from HelloWorld.models import Userinfo, DiseasesPests
from django.http import JsonResponse
from ultralytics import YOLO
from pyecharts import options as opts
from pyecharts.charts import Line
from datetime import datetime
from django.db import connection
import openai


# 登陆
def login(request):
    if request.method == 'GET':
        return render(request, 'sign_in.html')
    userinfo = Userinfo.objects.all()
    for data_list in userinfo:
        username = request.POST.get("username")
        password = request.POST.get("password")
        if username == data_list.name and password == data_list.password:
            return redirect('/overview/')
        return render(request, 'sign_in.html', {'error': '用户名或密码错误'})


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
# TODO 使用yolov8 + tensorrt 推理
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

from django.views.decorators.csrf import csrf_exempt


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


'''
'''


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
    #
    # # 构建LSTM数据
    # df = pd.DataFrame(data, columns=['date', 'price_min', 'price_max'])
    # df['date'] = pd.to_datetime(df['date'], format='%Y-%m-%d')
    # print(df.head())
    # df['price_avg'] = (df['price_min'] + df['price_max']) / 2
    # df = df[['price_avg']]
    #
    # # 归一化处理
    # scaler = MinMaxScaler(feature_range=(0, 1))
    # df_scaled = scaler.fit_transform(df)
    #
    # dataset_x, dataset_y = create_dataset(df_scaled, DAYS_FOR_TRAIN)
    # print(len(dataset_x))
    # print(len(dataset_y))
    # # 划分训练集和测试集，70%作为训练集
    # train_size = int(len(dataset_x) * 0.7)
    #
    # train_x = dataset_x[:train_size]
    # train_y = dataset_y[:train_size]
    # # 将数据改变形状，RNN 读入的数据维度是 (seq_size, batch_size, feature_size)
    # train_x = train_x.reshape(-1, 1, DAYS_FOR_TRAIN)
    # train_y = train_y.reshape(-1, 1, 1)
    #
    # # 转为pytorch的tensor对象
    # train_x = torch.from_numpy(train_x)
    # train_y = torch.from_numpy(train_y)
    # print(train_x.dtype)
    # model = LSTM_Regression(DAYS_FOR_TRAIN, 8, output_size=1, num_layers=2)  # 导入模型并设置模型的参数输入输出层、隐藏层等
    # model = model.double()
    # model_total = sum([param.nelement() for param in model.parameters()])  # 计算模型参数
    # print("Number of model_total parameter: %.8fM" % (model_total / 1e6))
    #
    # train_loss = []
    # loss_function = nn.MSELoss()
    # optimizer = torch.optim.Adam(model.parameters(), lr=1e-2, betas=(0.9, 0.999), eps=1e-08, weight_decay=0)
    # for i in range(200):
    #     out = model(train_x)
    #     loss = loss_function(out, train_y)
    #     loss.backward()
    #     optimizer.step()
    #     optimizer.zero_grad()
    #     train_loss.append(loss.item())
    #
    #     # 将训练过程的损失值写入文档保存，并在终端打印出来
    #     with open('log.txt', 'a+') as f:
    #         f.write('{} - {}\n'.format(i + 1, loss.item()))
    #     if (i + 1) % 10 == 0:
    #         print('Epoch: {}, Loss:{:.5f}'.format(i + 1, loss.item()))
    #
    # # for test
    # model = model.eval()  # 转换成测试模式
    #
    # # 注意这里用的是全集 模型的输出长度会比原数据少DAYS_FOR_TRAIN 填充使长度相等再作图
    # dataset_x = dataset_x.reshape(-1, 1, DAYS_FOR_TRAIN)  # (seq_size, batch_size, feature_size)
    # dataset_x = torch.from_numpy(dataset_x)
    #
    # pred_test = model(dataset_x)  # 全量训练集
    # # 的模型输出 (seq_size, batch_size, output_size)
    # pred_test = pred_test.view(-1).data.numpy()
    # pred_test = np.concatenate((np.zeros(DAYS_FOR_TRAIN), pred_test))  # 填充0 使长度相同
    # assert len(pred_test) == len(df_scaled)
    # pred_test_scaled = pred_test.reshape(-1, 1)  # 转换为列向量
    # pred_test_unscaled = scaler.inverse_transform(pred_test_scaled).flatten()  # 反归一化
    # df_unscaled = scaler.inverse_transform(df_scaled).flatten()
    # y_data_pred = [f"{y:.1f}" for y in pred_test_unscaled.tolist()]

    # 绘制折线图
    line = (
        Line()
        .add_xaxis(xaxis_data=x_data)
        .add_yaxis(
            series_name="最低价",
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
        # .add_yaxis(
        #     series_name="预测结果",
        #     y_axis=y_data_pred,
        #     linestyle_opts=opts.LineStyleOpts(width=2),
        #     itemstyle_opts=opts.ItemStyleOpts(color="#FF0000"),
        # )
        .set_global_opts(
            title_opts=opts.TitleOpts(title="价格走势图"),
            xaxis_opts=opts.AxisOpts(type_="time", name="日期"),
            yaxis_opts=opts.AxisOpts(name="价格"),
            tooltip_opts=opts.TooltipOpts(trigger="axis"),
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
def table(request):
    return render(request, 'table.html')


# 天气预报
WEATHER_API_KEY = 'SPBVDFMMKeLXB2VYa'


def get_weather_data(city):
    url = f'https://api.seniverse.com/v3/weather/daily.json?key={WEATHER_API_KEY}&location={city}&language=zh-Hans&unit=c&start=0&days=14'
    response = requests.get(url)
    data = json.loads(response.content.decode())
    if data.get('results'):
        return data['results'][0]['daily']
    return []


def weather(request, city):
    data = get_weather_data(city)
    if not data:
        return JsonResponse({'error': 'No data available'})

    dates = [d['date'] for d in data]
    high_temps = [d['high'] for d in data]
    low_temps = [d['low'] for d in data]

    # 创建折线图
    line = Line()
    line.add_xaxis(dates)
    line.add_yaxis('最高气温', high_temps, is_smooth=True)
    line.add_yaxis('最低气温', low_temps, is_smooth=True)
    line.set_global_opts(title_opts={'text': f'{city}未来14天天气预报'})

    # 返回图表数据
    return JsonResponse(json.loads(line.dump_options()), safe=False)


# 返回土壤信息
def soil_info(requeset):
    return render(requeset, 'soil_info.html')


def country_map(request):
    return render(request, 'country_map.html')


'''
tool
功能函数
'''
import numpy as np


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
