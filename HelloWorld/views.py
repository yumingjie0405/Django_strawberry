import os

from django.shortcuts import render, redirect
from HelloWorld.models import Userinfo, IMG
from HelloWorld.predict_img import predict
from django_Crop import settings
from django.views.decorators.csrf import csrf_exempt

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

@csrf_exempt
def show_vision_predict(request):
    media_path = os.path.join(settings.MEDIA_ROOT, 'img')
    print(media_path)
    for file in os.listdir(media_path):
        targetFile = os.path.join(media_path, file)
        if os.path.isfile(targetFile):
            os.remove(targetFile)
    if request.method == 'POST':
        new_img = IMG(
            img=request.FILES.get('img'),
            name=request.FILES.get('img').name
        )
        new_img.save()
        #print("  here " + new_img)
    return render(request, 'Vision_predict.html')


def show_NLP_predict(request):
    return render(request, 'NLP_predict.html')


def show_price_predict(request):
    return render(request, 'price_predict.html')


def result(request):
    result = predict()
    print(result)
    return render(request, 'result_img.html', {"data": result})
