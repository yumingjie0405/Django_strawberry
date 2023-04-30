from django.db import models


# Create your models here.
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