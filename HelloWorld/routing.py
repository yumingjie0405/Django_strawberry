from django.urls import re_path

from . import consumer

websocket_urlpatterns = [
    re_path(r'ws/video/(?P<v_name>\w+)/$', consumer.VideoConsumer.as_asgi())
]
