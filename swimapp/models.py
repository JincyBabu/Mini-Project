from django.db import models

'''# Create your models here.
class pmodel(models.Model):
    bid = models.IntegerField(max_length=10)
    itemname = models.CharField(max_length=60)
    category = models.CharField(max_length=50)
    img = models.FileField(upload_to='uploads')
    description = models.CharField(max_length=50)
    startamount = models.CharField(max_length=20)
    date = models.CharField(max_length=10)
    rqid = models.CharField(max_length=10)
    status = models.CharField(max_length=50)
    state = models.CharField(max_length=10)
    class Meta:
        db_table = "trainer" '''
# Create your models here.
class pmodel(models.Model):
    sid = models.IntegerField(max_length=10)
    img = models.FileField(upload_to='uploads')
    class Meta:
        db_table = "images"
class pmodel1(models.Model):
    tid = models.IntegerField(max_length=10)
    img = models.FileField(upload_to='uploads')
    class Meta:
        db_table = "images"
