from django.db import models

from django.db import models


# Create your models here.

class Admin(models.Model):
    username = models.CharField(verbose_name="姓名", max_length=16)
    password = models.CharField(verbose_name="密码", max_length=64)

    def __str__(self):
        return self.text


class Userinfo(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=32)
    password = models.CharField(max_length=32)


class Question(models.Model):
    text = models.CharField(max_length=255)
    pub_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.text


class Answer(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    text = models.TextField()
    pub_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.text


class DiseasesPests(models.Model):
    did = models.CharField(max_length=20, primary_key=True)
    name = models.CharField(max_length=20, null=True)
    comname = models.CharField(max_length=20, null=True)
    symptoms = models.CharField(max_length=100, null=True)
    nature = models.CharField(max_length=20, null=True)
    basicdesc = models.CharField(max_length=100, null=True)
    detailsdesc = models.CharField(max_length=500, null=True)
    score = models.CharField(max_length=20, null=True)
    dmethods = models.CharField(max_length=500, null=True)

    def __str__(self):
        return self.did

    class Meta:
        db_table = "diseasespests"
