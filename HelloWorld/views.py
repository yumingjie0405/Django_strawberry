import base64
import os
import cv2
import numpy as np
from django.shortcuts import render, redirect
from HelloWorld.models import Userinfo, IMG
from django.http import JsonResponse
from django_Crop import settings
from ultralytics import YOLO


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


# # @csrf_exempt
# def show_vision_predict(request):
#     media_path = os.path.join(settings.MEDIA_ROOT, 'img')
#     print(media_path)
#     for file in os.listdir(media_path):
#         targetFile = os.path.join(media_path, file)
#         if os.path.isfile(targetFile):
#             os.remove(targetFile)
#     if request.method == 'POST':
#         new_img = IMG(
#             img=request.FILES.get('img'),
#             name=request.FILES.get('img').name
#         )
#         new_img.save()
#     return render(request, 'Vision_predict.html')

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


def show_NLP_predict(request):
    return render(request, 'NLP_predict.html')


def show_price_predict(request):
    return render(request, 'price_predict.html')


def result(request):
    result = predict()
    print(result)
    return render(request, 'result_img.html', {"data": result})


'''
tool
'''

import torch
import numpy as np


def your_yolov5_model(image):
    # 加载模型
    model = YOLO('../media/model/best.pt')
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
