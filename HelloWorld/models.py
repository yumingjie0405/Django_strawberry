from django.db import models


# Create your models here.
class Userinfo(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=32)
    password = models.CharField(max_length=32)


class IMG(models.Model):
    img = models.ImageField(upload_to='img')
    name = models.CharField(max_length=20)