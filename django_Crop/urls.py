"""django_Crop URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from HelloWorld import views, consumers
from HelloWorld.routing import websocket_urlpatterns

urlpatterns = [
    path('', views.login),
    path('sign_up/', views.register),
    path('overview/', views.overview),
    path('homepage/', views.homepage),
    path('about/', views.about),
    path('contact/', views.contact),
    # 视觉识别板块
    # path('Vision/', views.show_vision_predict),
    path('predict/', views.predict, name='predict'),

    # 价格预测板块
    path('Price/', views.show_data, name='Price'),
    # path('predict_price/',views.predict_price),
    # 问答板块 ChatGPT
    path('NLP/', views.ChatView.as_view(), name='nlp'),
    path('chat/', views.chat),
    # 问答板块暂时由数据库查询凑合
    # path('QA/', views.QA),
    # 添加 WebSocket URL 模式
    # path('ws/chat/', consumers.ChatConsumer.as_asgi())
    # path('table/', views.table, name='table'),
    path('weather/', views.weather, name='weather'),
    path('soil/', views.random_forest, name='soil'),
    path('china_map/', views.country_map, name='china_map'),

]

# 添加 WebSocket URL 模式
urlpatterns += websocket_urlpatterns
