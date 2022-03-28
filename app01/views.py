import json
import os

from django.shortcuts import render, redirect, HttpResponse
from app01 import models
from functools import wraps
import datetime
import re
from utils.paginater import Paginater
import time
import random
from aip import AipOcr
import qrcode
from django.utils.six import BytesIO
# Create your views here.

# 判断是否登录的装饰器
def login_required(func):
    @wraps(func)
    def inner(request, *args, **kwargs):
        is_login = request.session.get('is_login')
        if is_login != 1:
            # 没有登陆
            return redirect('/login/')
        ret = func(request, *args, **kwargs)
        return ret
    return inner
# 车牌识别
def Park_discern(image):
        APP_ID = '#######'
        API_KEY = '#############'
        SECRET_KEY = '########################'
        # 创建客户端对象
        client = AipOcr(APP_ID, API_KEY, SECRET_KEY)
        # 建立连接的超时时间，单位为毫秒
        client.setConnectionTimeoutInMillis(5000)
        # 通过打开的连接传输数据的超时时间，单位为毫秒
        client.setSocketTimeoutInMillis(5000)
        res = client.licensePlate(image)
        return res
# 时间计算
def chargecount(start_time, end_time):
    start_seconds = time.mktime(start_time.timetuple()) * 1000 + start_time.microsecond / 1000
    end_seconds = time.mktime(end_time.timetuple()) * 1000 + end_time.microsecond / 1000
    time_span = end_seconds - start_seconds
    day_span = int(time_span / 1000 / 3600 / 24)
    hour_span = int(time_span / 1000 / 3600 % 24)
    minute_span = int(time_span / 1000 / 60 % 60)
    # 判断是否为同一天
    if start_time.date() == end_time.date():
        money = 0
        # 同一天
        # 判断是否只停车半小时
        if hour_span == 0 and minute_span < 30:
            print(start_time, end_time, day_span,hour_span,minute_span,money)
            return money
        else:
            # 超过半小时
            # 判断是早晨还是晚上
            if 7 <= start_time.hour < 19:
                # 早晨停车
                if 7 <= end_time.hour < 19:
                    # 在晚间之前离开
                    if minute_span != 0:
                        money = 2 * (hour_span + 1)
                    else:
                        money = 2 * hour_span
                else:
                    # 在晚间离开
                    if minute_span != 0:
                        money = (18 - start_time.hour) * 2 + (hour_span - 17 + start_time.hour) * 3
                    else:
                        money = (18 - start_time.hour) * 2 + (hour_span - 18 + start_time.hour) * 3
            elif start_time.hour >= 19:
                #晚上停车
                if minute_span != 0:
                    money = 3 * (hour_span + 1)
                else:
                    money = 3 * hour_span
            else:
                if end_time.hour < 7:
                    if minute_span != 0:
                        money = 3 * (hour_span + 1)
                    else:
                        money = 3 * hour_span
                elif 7 <= end_time.hour <16:
                    if minute_span != 0:
                        money = (6 - start_time.hour) * 3 + 2 * (1 + start_time.hour)
                    else:
                        money = (6 - start_time.hour) * 3 + 2 * (1 + start_time.hour)
                    pass
                else:
                    money = 18
        if money > 18:
            money = 18
            print(start_time, end_time, day_span,hour_span,minute_span,money)
            return money
        else:
            print(start_time, end_time, day_span,hour_span,minute_span,money)
            return money
    else:
        #非同一天
        money = 0
        money_day = 0
        if day_span > 0:
            # 停留超过24h
            new_start_time = start_time + datetime.timedelta(days=day_span)
            print(new_start_time)
            money_day = 18 * day_span
            # 在判断离开时超过24h收费的部分
            if 7 <= new_start_time.hour < 19:
                if 7 <= end_time.hour < 19:
                    if minute_span != 0:
                        money = 2 * (hour_span + 1)
                        print(1)
                    else:
                        money = 2 * hour_span
                        print(2)
                elif 0 <= end_time.hour < 7 or 19 <= end_time.hour <= 23:
                    if minute_span != 0:
                        money = (18 - new_start_time.hour) * 2 + (hour_span - 17 + start_time.hour) * 3
                        print(3)
                    else:
                        money = (18 - new_start_time.hour) * 2 + (hour_span - 18 + start_time.hour) * 3
                        print(4)

            elif new_start_time.hour >= 19:
                if minute_span != 0:
                    money = 3 * (hour_span + 1)
                    print(5)
                else:
                    money = 3 * hour_span
                    print(6)
            else:
                if end_time.hour < 7:
                    if minute_span != 0:
                        money = 3 * (hour_span + 1)
                        print(7)
                    else:
                        money = 3 * hour_span
                        print(8)
                elif 7 <= end_time.hour < 16:
                    if minute_span != 0:
                        money = (6 - new_start_time.hour) * 3 + 2 * (1 + hour_span)
                        print(9)
                    else:
                        money = (6 - new_start_time.hour) * 3 + 2 * hour_span
                        print(10)
                    pass
                else:
                    money = 18
            if money > 18:
                money = 18 + money_day
                print(start_time, end_time, day_span, hour_span, minute_span, money)
                return money
            else:
                money += money_day
                print(start_time, end_time, day_span, hour_span, minute_span, money)
                return money
        else:
            # 未超过24h，但不是同一天
            if hour_span == 0 and minute_span < 30:
                print(start_time, end_time, day_span, hour_span, minute_span, money)
                return money
            else:
                if start_time.hour <= 18:
                    money = 18
                else:
                    if end_time.hour >= 5:
                        money = 18
                    else:
                        if minute_span != 0:
                            money = 3 * (hour_span + 1)
                        else:
                            money = 3 * hour_span
            if money > 18:
                money = 18
                print(start_time, end_time, day_span, hour_span, minute_span, money)
                return money
            else:
                print(start_time, end_time, day_span, hour_span, minute_span, money)
                return money
def login(request):
    if request.method == 'GET':
        return render(request, 'login.html')
    else:
        # 处理POST请求的逻辑
        # 获取到用户提交的用户名和密码
        account = request.POST.get('account')
        pwd = request.POST.get('pwd')
        if not account or not pwd:
            return render(request, 'login.html', {'error':'账号密码不能为空!'})
        else:
            try:
                check = models.Administrator.objects.get(account=account)
                if check.password == pwd:
                    request.session['is_login'] = 1
                    return redirect('/index/')
                else:
                    return render(request, 'login.html', {'error': '输入账号密码错误!'})
            except Exception as e:
                return render(request, 'login.html', {'error': '输入账号密码错误!'})
# 判断是否会员过期的装饰器
def vip_valid(func):
    @wraps(func)
    def inner(*args, **kwargs):
        user_obj = models.User.objects.all()
        now_time = datetime.datetime.now()
        for user in user_obj:
            if now_time > user.endtime:
                # 过期
                user.level = 0
                user.save()
                # 如果车辆在停车场，则出行需要补交一定费用
                try:
                    car_obj = models.Car_manage.objects.get(carnum=user.carnum)
                    car_obj.genre = 2
                    car_obj.save()
                    if not models.Extra_charge.objects.filter(carnum=user.carnum):
                        models.Extra_charge.objects.create(carnum=user.carnum, vip_begintime=user.endtime,
                                                           is_valid=True, money=0)
                    else:
                        models.Extra_charge.objects.filter(carnum=user.carnum).update(vip_begintime=user.endtime,
                                                                                      vip_deadline=None,
                                                                                      is_valid=True, money=0)
                except Exception as e:
                     pass
        ret = func(*args, **kwargs)
        return ret
    return inner
@login_required
@vip_valid
def index(request):
    # 判断是否有用户会员到期
    # user_obj = models.User.objects.all()
    # now_time = datetime.datetime.now()
    # for user in user_obj:
    #     if now_time > user.endtime:
    #         # 过期
    #         user.level = 0
    #         user.save()
    # 获取用户总数以及车位情况
    user_num = models.User.objects.count()
    all_carport = models.Car_manage.objects.count()
    remain_carport = 0
    for c in models.Car_manage.objects.all():
        # 如果停车位的车牌为空
        if not c.carnum:
            remain_carport += 1
    # 获取每日的收入
    money_day = 0
    charge_obj = models.Charge.objects.all()
    for c in charge_obj:
        if c.pay_time.date() == datetime.datetime.now().date():
            money_day += c.money
    # 记录数
    car_manage_count = models.Car_record.objects.all().count()
    # 环形图数据
    # A区总共车位
    A_cars = models.Car_manage.objects.filter(carport__range=[1, 25])
    A_cars_use = 0
    Asum = 0
    # A区使用中车位
    for c in A_cars:
        if c.carnum:
            A_cars_use += 1
        Asum += 1
    A_remain = Asum - A_cars_use
    B_cars = models.Car_manage.objects.filter(carport__range=[26, 50])
    B_cars_use = 0
    Bsum = 0
    for c in B_cars:
        if c.carnum:
            B_cars_use += 1
        Bsum += 1
    B_remain = Bsum - B_cars_use
    C_cars = models.Car_manage.objects.filter(carport__range=[51, 75])
    C_cars_use = 0
    Csum = 0
    for c in C_cars:
        if c.carnum:
            C_cars_use += 1
        Csum += 1
    C_remain = Csum - C_cars_use
    D_cars = models.Car_manage.objects.filter(carport__range=[76, 100])
    D_cars_use = 0
    Dsum = 0
    for c in D_cars:
        if c.carnum:
            D_cars_use += 1
        Dsum += 1
    D_remain = Dsum - D_cars_use
    # 柱状图数据
    today = datetime.datetime.now()
    day1 = today - datetime.timedelta(days=6)
    day2 = today - datetime.timedelta(days=5)
    day3 = today - datetime.timedelta(days=4)
    day4 = today - datetime.timedelta(days=3)
    day5 = today - datetime.timedelta(days=2)
    day6 = today - datetime.timedelta(days=1)
    car_record_obj = models.Car_record.objects.all()
    day1_in = 0
    day1_out = 0
    day2_in = 0
    day2_out = 0
    day3_in = 0
    day3_out = 0
    day4_in = 0
    day4_out = 0
    day5_in = 0
    day5_out = 0
    day6_in = 0
    day6_out = 0
    today_in = 0
    today_out = 0
    for c in car_record_obj:
        if c.begintime.month == day1.month and c.begintime.day == day1.day:
            day1_in += 1
        elif c.begintime.month == day2.month and c.begintime.day == day2.day:
            day2_in += 1
        elif c.begintime.month == day3.month and c.begintime.day == day3.day:
            day3_in += 1
        elif c.begintime.month == day4.month and c.begintime.day == day4.day:
            day4_in += 1
        elif c.begintime.month == day5.month and c.begintime.day == day5.day:
            day5_in += 1
        elif c.begintime.month == day6.month and c.begintime.day == day6.day:
            day6_in += 1
        elif c.begintime.month == today.month and c.begintime.day == today.day:
            today_in += 1
        else:
            pass
        if c.endtime.month == day1.month and c.endtime.day == day1.day:
            day1_out += 1
        elif c.endtime.month == day2.month and c.endtime.day == day2.day:
            day2_out += 1
        elif c.endtime.month == day3.month and c.endtime.day == day3.day:
            day3_out += 1
        elif c.endtime.month == day4.month and c.endtime.day == day4.day:
            day4_out += 1
        elif c.endtime.month == day5.month and c.endtime.day == day5.day:
            day5_out += 1
        elif c.endtime.month == day6.month and c.endtime.day == day6.day:
            day6_out += 1
        elif c.endtime.month == today.month and c.endtime.day == today.day:
            today_out += 1
        else:
            pass
    # 还有今日停入未离开，暂时未被记录
    car_manage_obj = models.Car_manage.objects.filter(carnum__isnull=False)
    for c in car_manage_obj:
        #判断同一个月
        if c.begintime.month == today.month and c.begintime.day == today.day:
            today_in += 1
        elif c.begintime.month == day1.month and c.begintime.day == day1.day:
            day1_in += 1
        elif c.begintime.month == day2.month and c.begintime.day == day2.day:
            day2_in += 1
        elif c.begintime.month == day3.month and c.begintime.day == day3.day:
            day3_in += 1
        elif c.begintime.month == day4.month and c.begintime.day == day4.day:
            day4_in += 1
        elif c.begintime.month == day5.month and c.begintime.day == day5.day:
            day5_in += 1
        elif c.begintime.month == day6.month and c.begintime.day == day6.day:
            day6_in += 1
        else:
            pass
    today = today.strftime('%m-%d')
    day1 = day1.strftime('%m-%d')
    day2 = day2.strftime('%m-%d')
    day3= day3.strftime('%m-%d')
    day4 = day4.strftime('%m-%d')
    day5 = day5.strftime('%m-%d')
    day6 = day6.strftime('%m-%d')
    return render(request, 'index.html', {'user_num': user_num, 'all_carport': all_carport,
                                          'remain_carport': remain_carport, 'money_day': money_day,
                                          'car_manage_count': car_manage_count, 'A_remian':A_remain,
                                          'B_remian':B_remain, 'C_remian':C_remain, 'D_remian':D_remain,
                                          'today':today, 'day1':day1, 'day2':day2, 'day3':day3, 'day4':day4,
                                          'day5':day5, 'day6':day6, 'day1_in':day1_in, 'day2_in':day2_in,
                                          'day3_in':day3_in, 'day4_in':day4_in, 'day5_in':day5_in, 'day6_in':day6_in,
                                          'today_in':today_in, 'day1_out':day1_out, 'day2_out':day2_out,
                                          'day3_out':day3_out, 'day4_out':day4_out, 'day5_out':day5_out,
                                          'day6_out':day6_out, 'today_out':today_out})
@login_required
@vip_valid
def user_info(request):
    return redirect('/user_paging/')
@login_required
@vip_valid
def user_add(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        phone = request.POST.get('phone')
        carnum = request.POST.get('carnum')
        level = request.POST.get('vip-radios')
        begintime = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        pattern = re.compile(r'^(13[0-9]|14[5|7]|15[0|1|2|3|4|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$')
        result = pattern.match(phone)
        if name and phone and carnum and level:
            # 判断手机号是否合法
            if not result:
                return render(request, 'user_add.html', {'error3': '请输入正确的手机号'})
            # 判断车牌号是否存在
            elif models.User.objects.filter(carnum=carnum):
                return render(request, 'user_add.html', {'error1': '该车牌号已存在'})
            else:
                level = int(level)
                if level == 1:
                    endtime = (datetime.datetime.now() + datetime.timedelta(days=31)).strftime("%Y-%m-%d %H:%M:%S")
                    models.Charge.objects.create(pay_time=datetime.datetime.now(),money=150)
                elif level == 2:
                    endtime = (datetime.datetime.now() + datetime.timedelta(days=93)).strftime("%Y-%m-%d %H:%M:%S")
                    models.Charge.objects.create(pay_time=datetime.datetime.now(), money=425)
                elif level == 3:
                    endtime = (datetime.datetime.now() + datetime.timedelta(days=186)).strftime("%Y-%m-%d %H:%M:%S")
                    models.Charge.objects.create(pay_time=datetime.datetime.now(), money=810)
                elif level == 4:
                    endtime = (datetime.datetime.now() + datetime.timedelta(days=365)).strftime("%Y-%m-%d %H:%M:%S")
                    models.Charge.objects.create(pay_time=datetime.datetime.now(), money=1530)
                else:
                    pass
                models.User.objects.create(name=name, carnum=carnum, phone=phone, level=level, begintime=begintime, endtime=endtime)
                # 如果车辆先停入，之后再办理会员
                try:
                    car_obj = models.Car_manage.objects.get(carnum=carnum)
                    car_obj.genre = 1
                    car_obj.save()
                    money = chargecount(car_obj.begintime, datetime.datetime.now())
                    # 办理会员前需要支付的费用
                    if not models.Extra_charge.objects.filter(carnum=carnum):
                        models.Extra_charge.objects.create(carnum=carnum,vip_begintime=car_obj.begintime.strftime("%Y-%m-%d %H:%M:%S"), vip_deadline=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),is_valid=True, money=money)
                    else:
                        models.Extra_charge.objects.filter(carnum=carnum).update(vip_begintime=car_obj.begintime.strftime("%Y-%m-%d %H:%M:%S"),vip_deadline=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), is_valid=True, money=money)

                except Exception as e:
                    pass
                time.sleep(2)
                return redirect('/user_paging/')
        else:
            print('error')
            return render(request, 'user_add.html', {'error2': '请填写完整！'})
    else:
        return render(request, 'user_add.html')
@login_required
@vip_valid
def user_del(request):
    id = request.GET.get('id')
    # 如果车辆在停车场内，需要将记录改为临时用户
    car_obj = models.User.objects.get(id=id)
    carnum = car_obj.carnum
    # 判断该车是否在停车场中
    try:
        # 存在
        car = models.Car_manage.objects.get(carnum=carnum)
        car.genre = 2
        car.save()
    except Exception as e:
        # 不存在
        pass
    finally:
        models.User.objects.filter(id=id).delete()


    return HttpResponse('删除成功！')
@login_required
@vip_valid
def user_edit(request):
    # 查询要编辑对象的id
    id = request.GET.get('id')
    # 根据id查到要编辑对象
    user_obj = models.User.objects.get(id=id)
    if request.method == 'POST':
        name = request.POST.get('name')
        phone = request.POST.get('phone')
        carnum = request.POST.get('carnum')
        pattern = re.compile(r'^(13[0-9]|14[5|7]|15[0|1|2|3|4|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$')
        result = pattern.match(phone)
        if name and phone and carnum:
            # 判断手机号是否合法
            if not result:
                return render(request, 'user_edit.html', {'error1': '请输入正确的手机号'})
            else:
                # 讨论修改车牌号带来的影响
                # 未更改车牌号
                if user_obj.carnum == carnum:
                    user_obj.name = name
                    user_obj.phone = phone
                    user_obj.carnum = carnum
                    user_obj.save()
                    time.sleep(2)
                    return redirect('/user_paging/')
                else:
                    # 更改了车牌号
                    # 判断车牌号是否已经存在
                    count = models.User.objects.filter(carnum=carnum).count()
                    if count == 1:
                        # 已有用户有该车牌
                        print(count)
                        return render(request, 'user_edit.html', {'error2':'该车牌号已存在'})
                    else:
                        # 可以更改
                        # 判断更换的车牌号是否已经在停车场
                        car = models.Car_manage.objects.filter(carnum=carnum)
                        if not car:
                            # 不在停车场
                            #判断原车牌号车是否在停车场
                            try:
                                car_obj = models.Car_manage.objects.get(carnum=user_obj.carnum)
                                car_obj.carnum = carnum
                                car_obj.save()
                                # 注意需要去admin手动添加车牌图片
                            except Exception as e:
                                # 不在停车场
                                pass
                            finally:
                                # 将该车牌从license_plate表中移除
                                models.License_plate.objects.filter(car_num=user_obj.carnum).delete()
                                user_obj.name = name
                                user_obj.phone = phone
                                user_obj.carnum = carnum
                                user_obj.save()
                                time.sleep(2)
                                return redirect('/user_paging/')
                        else:
                            # 需要更换的车牌号已经在停车场了(为临时车而非其他用户）
                            return render(request, 'user_edit.html', {'error2':'该车牌号已存在'})
    else:
        return render(request, 'user_edit.html', {'user_obj':user_obj})
@login_required
@vip_valid
def user_renewal(request):
    id = request.GET.get('id')
    user_obj = models.User.objects.get(id=id)
    carnum = user_obj.carnum
    formertime = user_obj.endtime
    if request.method == 'POST':
        level = request.POST.get('vip-radios')
        if not level:
            return render(request, 'user_renewal.html', {'error': '选择不能为空!'})
        else:
            if user_obj.level != 0:
                if level == "1":
                    newtime = (formertime + datetime.timedelta(days=31)).strftime("%Y-%m-%d %H:%M:%S")
                    models.Charge.objects.create(pay_time=datetime.datetime.now(), money=150)
                elif level == "2":
                    newtime = (formertime + datetime.timedelta(days=93)).strftime("%Y-%m-%d %H:%M:%S")
                    models.Charge.objects.create(pay_time=datetime.datetime.now(), money=425)
                elif level == "3":
                    newtime = (formertime + datetime.timedelta(days=186)).strftime("%Y-%m-%d %H:%M:%S")
                    models.Charge.objects.create(pay_time=datetime.datetime.now(), money=810)
                else:
                    newtime = (formertime + datetime.timedelta(days=365)).strftime("%Y-%m-%d %H:%M:%S")
                    models.Charge.objects.create(pay_time=datetime.datetime.now(), money=1530)
            else:
                if level == "1":
                    newtime = (datetime.datetime.now() + datetime.timedelta(days=31)).strftime("%Y-%m-%d %H:%M:%S")
                    models.Charge.objects.create(pay_time=datetime.datetime.now(), money=150)
                elif level == "2":
                    newtime = (datetime.datetime.now() + datetime.timedelta(days=93)).strftime("%Y-%m-%d %H:%M:%S")
                    models.Charge.objects.create(pay_time=datetime.datetime.now(), money=425)
                elif level == "3":
                    newtime = (datetime.datetime.now() + datetime.timedelta(days=186)).strftime("%Y-%m-%d %H:%M:%S")
                    models.Charge.objects.create(pay_time=datetime.datetime.now(), money=810)
                else:
                    newtime = (datetime.datetime.now() + datetime.timedelta(days=365)).strftime("%Y-%m-%d %H:%M:%S")
                    models.Charge.objects.create(pay_time=datetime.datetime.now(), money=1530)
            user_obj.level = level
            user_obj.begintime = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            user_obj.endtime = newtime
            user_obj.save()
            try:
                car_obj = models.Car_manage.objects.get(carnum=carnum)
                car_obj.genre = 1
                car_obj.save()
                now_time = datetime.datetime.now()
                if now_time > formertime:
                    # 过期
                    if car_obj.begintime > formertime:
                        # 在到期后停进来
                        money = chargecount(car_obj.begintime,datetime.datetime.now())
                        if not models.Extra_charge.objects.filter(carnum=carnum):
                            models.Extra_charge.objects.create(carnum=carnum, vip_begintime=car_obj.begintime.strftime("%Y-%m-%d %H:%M:%S"),
                                                               vip_deadline=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),is_valid=True,money=money)
                        else:
                            models.Extra_charge.objects.filter(carnum=carnum).update(vip_begintime=car_obj.begintime.strftime("%Y-%m-%d %H:%M:%S"), vip_deadline=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),is_valid=True,money=money)
                    else:
                        # 在到期前进来
                        money = chargecount(formertime,datetime.datetime.now())
                        if not models.Extra_charge.objects.filter(carnum=carnum):
                            models.Extra_charge.objects.create(carnum=carnum,vip_begintime=formertime.strftime("%Y-%m-%d %H:%M:%S"),vip_deadline=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), is_valid=True, money=money)
                        else:
                            models.Extra_charge.objects.filter(carnum=carnum).update(vip_begintime=formertime.strftime("%Y-%m-%d %H:%M:%S"),vip_deadline=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),is_valid=True, money=money)
                else:
                    # 没过期
                    pass
            except Exception as e:
                pass
            return redirect('/user_info/')
    else:
        return render(request, 'user_renewal.html', {'user_obj':user_obj})
@login_required
@vip_valid
def user_paging(request):
    # 从URL中取参数page，这个参数与pageinanter.py生成的HTML代码片段有关
    cur_page_num = request.GET.get('page')
    if not cur_page_num:
        cur_page_num = "1"
    # 取得总记录数
    total_count = models.User.objects.all().count()
    # 设定每一页显示多少条记录
    one_page_lines = 6
    # 页面上共展示多少页码标签
    page_maxtag = 9
    # 生成Paginater类的实例化对象
    page_obj = Paginater(url_address='/user_paging/', cur_page_num=cur_page_num, total_rows=total_count,
                         one_page_lines=one_page_lines, page_maxtag=page_maxtag)
    # 对表中的数据进行切片，取出属于本页的记录
    all_users = models.User.objects.all()[page_obj.data_start:page_obj.data_end]
    if request.method == 'POST':
        dropown = request.POST.get('search_field')
        if dropown == 'user_name':
            keyword = request.POST.get('keyword')
            all_users = models.User.objects.filter(name=keyword)
            if not all_users:
                # 空
                error = '未查询到相关内容！'
                return render(request, 'user_info.html', {'error': error})
            else:
                return render(request, 'user_info.html', {'all_users':all_users})
        if dropown == 'car_num':
            keyword = request.POST.get('keyword')
            all_users = models.User.objects.filter(carnum=keyword)
            if not all_users:
                # 空
                error = '未查询到相关内容！'
                return render(request, 'user_info.html', {'error': error})
            else:
                return render(request, 'user_info.html', {'all_users': all_users})
    else:
        return render(request, 'user_info.html', {'all_users':all_users, 'page_nav':page_obj.html_page()})
@login_required
@vip_valid
def car_import(request):

    # 显示车牌图片
    # 没有入库的车辆列表
    # car_list = []
    # outside_obj = models.License_plate.objects.filter(is_inside=False)
    # for o in outside_obj:
    #     car_list.append(o.car_img)
    # 获取刚刚进来的车辆
    id = request.session.get('id')
    new_car = models.License_plate.objects.get(id=id)
    # 存放空停车位的列表
    remain_list = []
    # 获取停车场空余车位
    remain_obj = models.Car_manage.objects.filter(carnum__isnull=True)
    for r in remain_obj:
        remain_list.append(r.carport)
    # 从在外车辆中随机选择一个
    # car = random.choice(car_list)
    # 读取图片
    def get_file_content(filePath):
        with open(filePath, 'rb') as fp:
            return fp.read()

    url = './media/' + str(new_car.car_img)
    image = get_file_content(url)
    if request.method == 'POST':
        carnum = request.POST.get('carnum')
        new_car.car_num = carnum
        new_car.save()
        # 从剩余车位中随机选择一个
        carport = random.choice(remain_list)
        begintime = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        try:
            is_user = models.User.objects.get(carnum=carnum)
            if is_user:
                # 还要判断是否过期
                if is_user.level != 0:
                    genre = 1
                else:
                    genre = 2
        except Exception as e:
            genre = 2
        finally:
            carport_obj = models.Car_manage.objects.get(carport=carport)
            carport_obj.carnum = carnum
            carport_obj.begintime = begintime
            carport_obj.genre = genre
            carport_obj.save()
        message = '{}刚刚停入{}号车位中'.format(carport_obj.carnum,carport_obj.carport)
        request.session['message'] = message
        # 将该车辆设为车场内车辆
        try:
            car_obj = models.License_plate.objects.get(car_img=new_car.car_img)
            car_obj.is_inside = True
            car_obj.save()
            models.Car_in_record.objects.create(carnum=carnum,begintime=begintime,carport=carport)
            # 将图片放入carport_imgs
            path = './media/carport_imgs/' + str(new_car.car_img).split('/')[1]
            with open(path, 'wb') as f:
                f.write(image)
                f.close()
        except Exception as e:
            pass
        return redirect('/car_port/')
    else:
        try:
            res = Park_discern(image)
            carnum = res['words_result']['number']
            return render(request, 'car_import.html', {'carport_url':new_car.car_img, 'carnum':carnum})
        except Exception as e:
            print(e)
            return HttpResponse('识别发生错误！')
@login_required
@vip_valid
def car_exit(request):
    # 找到已经停入停车场的车辆
    # try:
    #     inside_obj = models.License_plate.objects.filter(is_inside=True)
    #     car_list = []
    #     for i in inside_obj:
    #         car_list.append(i.car_img)
    #     # 从在内车辆中随机选择一个
    #     car = random.choice(car_list)
    # except Exception as e:
    #     return HttpResponse('停车场暂时没有车辆')
    # 获取出行的车辆
    id = request.session.get('id')
    new_car = models.License_plate.objects.get(id=id)
    if request.method == 'POST':
        carnum = request.POST.get('carnum')
        car_obj = models.Car_manage.objects.get(carnum=carnum)
        begintime = car_obj.begintime
        money = chargecount(begintime, datetime.datetime.now())
        global deadline
        deadline = None
        try:
            models.User.objects.get(carnum=carnum)
            money = 0
        except Exception as e:
            pass
        if not models.Extra_charge.objects.filter(carnum=carnum):
            pass
        else:
            charge_obj = models.Extra_charge.objects.get(carnum=carnum)
            # 停车中会员到期未重新办理
            if charge_obj.vip_deadline is None:
                money = chargecount(charge_obj.vip_begintime, datetime.datetime.now())
            else:
                money = chargecount(charge_obj.vip_begintime, charge_obj.vip_deadline)
        if not models.User.objects.filter(carnum=carnum):
            level = '临时用户'
            is_vip = 0
        else:
            if models.User.objects.get(carnum=carnum).level != 0:
                level = '会员用户'
                deadline = models.User.objects.get(carnum=carnum).endtime.strftime("%Y-%m-%d %H:%M:%S")
                is_vip = 1
            else:
                level = '临时用户'
                is_vip = 0
        start_seconds = time.mktime(begintime.timetuple()) * 1000 + begintime.microsecond / 1000
        end_seconds = time.mktime(datetime.datetime.now().timetuple()) * 1000 + datetime.datetime.now().microsecond / 1000
        time_span = end_seconds - start_seconds
        day_span = int(time_span / 1000 / 3600 / 24)
        hour_span = int(time_span / 1000 / 3600 % 24)
        minute_span = int(time_span / 1000 / 60 % 60)
        park_time = str(day_span)+'天'+str(hour_span)+'小时'+str(minute_span)+'分钟'
        request.session['payment'] = {'carnum':carnum,'money':money, 'level':level, 'park_time':park_time,
                                      'deadline':deadline, 'is_vip':is_vip}
        return redirect('/pay/')
    else:
        try:
            # 读取图片
            def get_file_content(filePath):
                with open(filePath, 'rb') as fp:
                    return fp.read()
            url = './media/' + str(new_car.car_img)
            image = get_file_content(url)
            res = Park_discern(image)
            carnum = res['words_result']['number']
            return render(request, 'car_exit.html', {'carport_url': new_car.car_img, 'carnum': carnum})
        except Exception as e:
            return HttpResponse('识别发生错误！')
@login_required
@vip_valid
def car_port(request):
    # A区总共车位
    A_cars = models.Car_manage.objects.filter(carport__range=[1, 25])
    A_cars_use = 0
    Asum = 0
    # A区使用中车位
    for c in A_cars:
        if c.carnum:
            A_cars_use += 1
        Asum += 1

    B_cars = models.Car_manage.objects.filter(carport__range=[26, 50])
    B_cars_use = 0
    Bsum = 0
    for c in B_cars:
        if c.carnum:
            B_cars_use += 1
        Bsum += 1

    C_cars = models.Car_manage.objects.filter(carport__range=[51, 75])
    C_cars_use = 0
    Csum = 0
    for c in C_cars:
        if c.carnum:
            C_cars_use += 1
        Csum += 1

    D_cars = models.Car_manage.objects.filter(carport__range=[76, 100])
    D_cars_use = 0
    Dsum = 0
    for c in D_cars:
        if c.carnum:
            D_cars_use += 1
        Dsum += 1
    message = request.session.get('message')
    car_in_record = models.Car_in_record.objects.all().order_by('-id')[:5]
    car_out_record = models.Car_out_record.objects.all().order_by('-id')[:5]

    # 如果message为空
    if not message:
        is_message = 0
        request.session['message'] = None
        return render(request, 'car_port.html',
                      {'Asum': Asum, 'A_cars_use': A_cars_use, 'Bsum': Bsum, 'B_cars_use': B_cars_use, 'Csum': Csum,
                       'C_cars_use': C_cars_use, 'Dsum': Dsum, 'D_cars_use': D_cars_use, 'is_message': is_message,
                       'car_in_record':car_in_record, 'car_out_record':car_out_record})
    else:
        is_message = 1
        request.session['message'] = None
        return render(request, 'car_port.html',
                      {'Asum': Asum, 'A_cars_use': A_cars_use, 'Bsum': Bsum, 'B_cars_use': B_cars_use, 'Csum': Csum,
                       'C_cars_use': C_cars_use, 'Dsum': Dsum, 'D_cars_use': D_cars_use, 'is_message':
                           is_message, 'message': message, 'car_in_record':car_in_record, 'car_out_record':car_out_record})
@login_required
@vip_valid
def car_record(request):
    return redirect('/car_record_paging/')
@login_required
@vip_valid
def car_port_pagingA(request):
    # 从URL中取参数page，这个参数与pageinanter.py生成的HTML代码片段有关
    cur_page_num = request.GET.get('page')
    if not cur_page_num:
        cur_page_num = "1"
    # 取得总记录数
    total_count = models.Car_manage.objects.filter(carport__range=[1, 25], carnum__isnull=False).count()
    # 设定每一页显示多少条记录
    one_page_lines = 5
    # 页面上共展示多少页码标签
    page_maxtag = 6
    # 生成Paginater类的实例化对象
    page_obj = Paginater(url_address='/car_port_pagingA/', cur_page_num=cur_page_num, total_rows=total_count,
                         one_page_lines=one_page_lines, page_maxtag=page_maxtag)
    # 对表中的数据进行切片，取出属于本页的记录
    all_cars = models.Car_manage.objects.filter(carport__range=[1, 25], carnum__isnull=False).order_by('carport')[
               page_obj.data_start:page_obj.data_end]
    return render(request, 'car_port_info.html', {'all_cars':all_cars, 'page_nav':page_obj.html_page()})
@login_required
@vip_valid
def car_port_pagingB(request):
    # 从URL中取参数page，这个参数与pageinanter.py生成的HTML代码片段有关
    cur_page_num = request.GET.get('page')
    if not cur_page_num:
        cur_page_num = "1"
    # 取得总记录数
    total_count = models.Car_manage.objects.filter(carport__range=[26, 50], carnum__isnull=False).count()
    # 设定每一页显示多少条记录
    one_page_lines = 5
    # 页面上共展示多少页码标签
    page_maxtag = 6
    # 生成Paginater类的实例化对象
    page_obj = Paginater(url_address='/car_port_pagingB/', cur_page_num=cur_page_num, total_rows=total_count,
                         one_page_lines=one_page_lines, page_maxtag=page_maxtag)
    # 对表中的数据进行切片，取出属于本页的记录
    all_cars = models.Car_manage.objects.filter(carport__range=[26, 50], carnum__isnull=False).order_by('carport')[page_obj.data_start:page_obj.data_end]
    return render(request, 'car_port_info.html', {'all_cars': all_cars, 'page_nav':page_obj.html_page()})
@login_required
@vip_valid
def car_port_pagingC(request):
    # 从URL中取参数page，这个参数与pageinanter.py生成的HTML代码片段有关
    cur_page_num = request.GET.get('page')
    if not cur_page_num:
        cur_page_num = "1"
    # 取得总记录数
    total_count = models.Car_manage.objects.filter(carport__range=[51, 75], carnum__isnull=False).count()
    # 设定每一页显示多少条记录
    one_page_lines = 5
    # 页面上共展示多少页码标签
    page_maxtag = 6
    # 生成Paginater类的实例化对象
    page_obj = Paginater(url_address='/car_port_pagingC/', cur_page_num=cur_page_num, total_rows=total_count,
                         one_page_lines=one_page_lines, page_maxtag=page_maxtag)
    # 对表中的数据进行切片，取出属于本页的记录
    all_cars = models.Car_manage.objects.filter(carport__range=[51, 75],carnum__isnull=False).order_by('carport')[page_obj.data_start:page_obj.data_end]
    return render(request, 'car_port_info.html', {'all_cars': all_cars, 'page_nav':page_obj.html_page()})
@login_required
@vip_valid
def car_port_pagingD(request):
    # 从URL中取参数page，这个参数与pageinanter.py生成的HTML代码片段有关
    cur_page_num = request.GET.get('page')
    if not cur_page_num:
        cur_page_num = "1"
    # 取得总记录数
    total_count = models.Car_manage.objects.filter(carport__range=[76, 100], carnum__isnull=False).count()
    # 设定每一页显示多少条记录
    one_page_lines = 5
    # 页面上共展示多少页码标签
    page_maxtag = 6
    # 生成Paginater类的实例化对象
    page_obj = Paginater(url_address='/car_port_pagingD/', cur_page_num=cur_page_num, total_rows=total_count,
                         one_page_lines=one_page_lines, page_maxtag=page_maxtag)
    # 对表中的数据进行切片，取出属于本页的记录
    all_cars = models.Car_manage.objects.filter(carport__range=[76, 100],carnum__isnull=False).order_by('carport')[page_obj.data_start:page_obj.data_end]
    return render(request, 'car_port_info.html', {'all_cars': all_cars, 'page_nav':page_obj.html_page()})
@login_required
@vip_valid
def car_port_info(request,id):
    if id == "1":
        return redirect('/car_port_pagingA/')
    elif id == "2":
        return redirect('/car_port_pagingB/')
    elif id == "3":
        return redirect('/car_port_pagingC/')
    else:
        return redirect('/car_port_pagingD/')
@login_required
@vip_valid
def car_record_paging(request):
    # 从URL中取参数page，这个参数与pageinanter.py生成的HTML代码片段有关
    cur_page_num = request.GET.get('page')
    if not cur_page_num:
        cur_page_num = "1"
    # 取得总记录数
    total_count = models.Car_record.objects.all().count()
    # 设定每一页显示多少条记录
    one_page_lines = 10
    # 页面上共展示多少页码标签
    page_maxtag = 6
    # 生成Paginater类的实例化对象
    page_obj = Paginater(url_address='/car_record_paging/', cur_page_num=cur_page_num, total_rows=total_count,
                         one_page_lines=one_page_lines, page_maxtag=page_maxtag)
    # 对表中的数据进行切片，取出属于本页的记录
    all_cars = models.Car_record.objects.all()[page_obj.data_start:page_obj.data_end]
    return render(request, 'car_record.html', {'all_cars': all_cars, 'page_nav': page_obj.html_page()})
@login_required
@vip_valid
def code(request):
    img = qrcode.make('https://www.jhun.edu.cn/')  # 传入网站计算出二维码图片字节数据
    buf = BytesIO()  # 创建一个BytesIO临时保存生成图片数据
    img.save(buf)  # 将图片字节数据放到BytesIO临时保存
    image_stream = buf.getvalue()  # 在BytesIO拿出临时保存数据
    response = HttpResponse(image_stream, content_type='image/jpg')  # 将二维码数据返回到页面
    return response
@login_required
@vip_valid
def pay(request):
    if request.method == 'GET':
        carnum = request.session.get('payment')['carnum']
        money = request.session.get('payment')['money']
        level = request.session.get('payment')['level']
        if request.session.get('payment')['is_vip'] == 1:
            deadline = request.session.get('payment')['deadline']
        else:
            deadline = None
        park_time = request.session.get('payment')['park_time']
        return render(request, 'pay.html', {'carnum':carnum, 'money':money, 'level':level, 'park_time':park_time,
                                            'deadline':deadline})
    else:
        # 添加车流纪录信息
        carnum = request.POST.get('carnum')
        car_obj = models.Car_manage.objects.get(carnum=carnum)
        begintime = car_obj.begintime
        endtime = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        genre = car_obj.genre
        money = request.session.get('payment')['money']
        try:
            models.User.objects.get(carnum=carnum)
            money = 0
        except Exception as e:
            pass
        models.Car_record.objects.create(carnum=carnum, begintime=begintime, endtime=endtime, genre=genre, money=money)
        # 将此车位清空
        carport_obj = models.Car_manage.objects.get(carnum=carnum)
        carport = carport_obj.carport
        carport_obj.carnum = None
        carport_obj.begintime = None
        carport_obj.endtime = None
        carport_obj.genre = None
        carport_obj.save()
        # 将收入写入表中
        models.Charge.objects.create(pay_time=datetime.datetime.now(), money=money)

        # 将该车辆设为车场外车辆
        try:
            car_obj = models.License_plate.objects.get(car_num=carnum)
            car_obj.is_inside = False
            car_obj.save()
            # 将carport_imgs对应图片删除
            path = './media/carport_imgs/' + str(car_obj.car_img).split('/')[1]
            if os.path.exists(path):
                os.remove(path)
            models.Car_out_record.objects.create(carnum=carnum,endtime=endtime,carport=carport)
        except Exception as e:
            return HttpResponse('发生未知错误！')
        finally:
            if not models.Extra_charge.objects.filter(carnum=carnum):
                pass
            else:
                models.Extra_charge.objects.filter(carnum=carnum).update(is_valid=False)
            time.sleep(2)
            return redirect('/index/')

# test
@login_required
@vip_valid
def test(request):
    if request.method == 'GET':
        return render(request, 'test.html')
    else:
        try:
            img = request.FILES.get('car_img')
            if img == None:
                # 没有选择图片，而直接点击检测
                error = '请选择一张图片！'
                return render(request, 'test.html', {'error': error})
            else:
                # 先需要判断该车牌是否已经存在
                is_exist = models.License_plate.objects.filter(car_img='car_imgs/' + str(img)).count()
                # 如果不存在
                if is_exist == 0:
                    new_car = models.License_plate.objects.create(car_img=img, is_inside=False)
                    request.session['id'] = new_car.id
                    time.sleep(2)
                    return redirect('/car_import/')
                else:
                    # 如果存在，要判断该车应该是在内还是在外
                    is_inside = models.License_plate.objects.get(car_img='car_imgs/' + str(img)).is_inside
                    # 内
                    if is_inside == True:
                        error = '该车已经在停车场中！'
                        return render(request, 'test.html', {'error': error})
                    # 外
                    else:
                        out_car = models.License_plate.objects.get(car_img='car_imgs/' + str(img))
                        request.session['id'] = out_car.id
                        return redirect('/car_import/')
        except Exception as e:
            error = '未知错误'
            return render(request, 'test.html', {'error': error})
@login_required
@vip_valid
def test2(request):
    if request.method == 'GET':
        return render(request, 'test2.html')
    else:
        try:
            img = request.FILES.get('car_img')
            # 先需要判断该车牌是否已经存在
            is_exist = models.License_plate.objects.filter(car_img='car_imgs/' + str(img)).count()
            # 如果不存在
            if is_exist == 0:
                error = '未检测到该车！'
                return render(request, 'test2.html', {'error': error})
            else:
                # 如果存在，要判断该车应该是在内还是在外
                is_inside = models.License_plate.objects.get(car_img='car_imgs/' + str(img)).is_inside
                # 内
                if is_inside == True:
                    in_car = models.License_plate.objects.get(car_img='car_imgs/' + str(img))
                    request.session['id'] = in_car.id
                    return redirect('/car_exit/')
                # 外
                else:
                    error = '未检测到该车！'
                    return render(request, 'test2.html', {'error': error})
        except Exception as e:
            # 没有选择图片，而直接点击检测
            error = '请选择一张图片！'
            return render(request, 'test2.html', {'error': error})