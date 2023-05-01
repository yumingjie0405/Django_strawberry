import base64
import cv2
from django.shortcuts import render, redirect
from django.views.generic import TemplateView

from HelloWorld.models import Userinfo, DiseasesPests
from django.http import JsonResponse
from ultralytics import YOLO
from pyecharts import options as opts
from pyecharts.charts import Line
from datetime import datetime
from django.db import connection


# Create your views here.
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


def overview(request):
    return render(request, 'overview.html')


def homepage(request):
    return render(request, 'homepage.html')


def about(request):
    return render(request, 'about.html')


def contact(request):
    return render(request, 'contact.html')


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


class ChatView(TemplateView):
    template_name = "NLP_predict.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['websocket_url'] = "ws://" + self.request.get_host() + "/ws/chat/"
        return context


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


def show_data(request):
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


'''
tool
'''
import numpy as np


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
