from django.db import models

# Create your models here.
class Administrator(models.Model):
    account = models.CharField(max_length=32, primary_key=True)
    password = models.CharField(max_length=32)


class User(models.Model):
    name = models.CharField(max_length=32, verbose_name='姓名')
    carnum = models.CharField(max_length=32, unique=True, verbose_name='车牌号')
    phone = models.CharField(max_length=32, verbose_name='手机号')
    level = models.IntegerField(verbose_name='会员套餐')
    begintime = models.DateTimeField(auto_now=False, auto_now_add=False)
    endtime = models.DateTimeField(auto_now=False, auto_now_add=False)


class Car_manage(models.Model):
    carnum = models.CharField(max_length=32, unique=True, null=True, verbose_name='车牌号')
    carport = models.IntegerField(verbose_name='车位')
    begintime = models.DateTimeField(auto_now=False, auto_now_add=False, null=True)
    endtime = models.DateTimeField(auto_now=False, auto_now_add=False, null=True)
    genre = models.IntegerField(verbose_name='种类', null=True)


class Car_record(models.Model):
    carnum = models.CharField(max_length=32, verbose_name='车牌号')
    begintime = models.DateTimeField(auto_now=False, auto_now_add=False)
    endtime = models.DateTimeField(auto_now=False, auto_now_add=False)
    genre = models.IntegerField(verbose_name='种类')
    money = models.IntegerField(verbose_name='收费')


class License_plate(models.Model):
    car_img = models.ImageField(upload_to='car_imgs',unique=True, blank=True, null=True)
    car_num = models.CharField(max_length=32, unique=True, verbose_name='车牌号', null=True)
    is_inside = models.BooleanField(default=False)

class Charge(models.Model):
    pay_time = models.DateTimeField(auto_now=False, auto_now_add=False, null=True)
    money = models.IntegerField(verbose_name='收费')

class Car_in_record(models.Model):
    carnum = models.CharField(max_length=32, verbose_name='车牌号')
    begintime = models.DateTimeField(auto_now=False, auto_now_add=False)
    carport = models.IntegerField(verbose_name='车位')

class Car_out_record(models.Model):
    carnum = models.CharField(max_length=32, verbose_name='车牌号')
    endtime = models.DateTimeField(auto_now=False, auto_now_add=False)
    carport = models.IntegerField(verbose_name='车位')

class Extra_charge(models.Model):
    carnum = models.CharField(max_length=32, verbose_name='车牌号')
    is_valid = models.BooleanField(default=False)
    vip_begintime = models.DateTimeField(auto_now=False, auto_now_add=False, null=True)
    vip_deadline = models.DateTimeField(auto_now=False, auto_now_add=False, null=True)
    money = models.IntegerField(verbose_name='收费')