import os
from channels.routing import ProtocolTypeRouter, URLRouter
from django.core.asgi import get_asgi_application
from channels.auth import AuthMiddlewareStack

import HelloWorld.routing

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'django_Crop.settings')

application = ProtocolTypeRouter({
    "http": get_asgi_application(),
    "websocket": AuthMiddlewareStack(
        URLRouter(
            HelloWorld.routing.websocket_urlpatterns
        )
    ),
})
