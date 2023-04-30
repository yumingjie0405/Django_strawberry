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

from HelloWorld import views

urlpatterns = [
    path('sign_in/', views.login),
    path('overview/', views.overview),
    path('homepage/', views.homepage),
    path('about/', views.about),
    path('contact/', views.contact),
    # 视觉识别板块
    # path('Vision/', views.show_vision_predict),
    path('predict/', views.predict, name='predict'),
    # 问答板块
    path('NLP/', views.show_NLP_predict),
    # 价格预测板块
    path('Price/', views.show_price_predict),
    # 展示视觉预测结果
    path('result/', views.result),
]
