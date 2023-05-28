from django.shortcuts import redirect, HttpResponse
from django.utils.deprecation import MiddlewareMixin


class AuthMiddleware(MiddlewareMixin):
    def process_request(self, request):
        # 排除不需要登录就能访问的用户
        exclude_urls = ['/sign_in/', '/sign_up/']
        if request.path_info in exclude_urls:
            return
        # 读取访问用户的信息，如果已经登陆，就继续往下走
        info_dict = request.session.get("info")
        if info_dict:
            return
        # 没有登陆过就返回登陆页面
        return redirect('/sign_in/')
