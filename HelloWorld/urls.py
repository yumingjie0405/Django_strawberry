from django.urls import path
from . import views
#
urlpatterns = [
      path('', views.index, name='index'),
      path('<str:v_name>/', views.v_name, name='v_name'),
]