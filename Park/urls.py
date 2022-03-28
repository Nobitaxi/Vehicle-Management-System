"""Park URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, re_path
from app01 import views
from django.views.static import serve
from Park.settings import MEDIA_ROOT,MEDIA_URL
from django.conf.urls.static import static
urlpatterns = [
    path('admin/', admin.site.urls),
    path('login/', views.login),
    path('index/', views.index),
    path('user_info/', views.user_info),
    path('user_add/', views.user_add),
    path('user_del/', views.user_del),
    path('user_edit/', views.user_edit),
    path('user_renewal/', views.user_renewal),
    path('user_paging/', views.user_paging),
    path('car_port_pagingA/', views.car_port_pagingA),
    path('car_port_pagingB/', views.car_port_pagingB),
    path('car_port_pagingC/', views.car_port_pagingC),
    path('car_port_pagingD/', views.car_port_pagingD),
    path('car_record_paging/', views.car_record_paging),
    path('car_import/', views.car_import),
    path('test/', views.test),
    path('test2/', views.test2),
    path('pay/', views.pay),
    path('code/', views.code),
    path('car_exit/', views.car_exit),
    path('car_port/', views.car_port),
    path('car_record/', views.car_record),
    path('car_port_info/<str:id>/', views.car_port_info),
    path(r'media/(?P<path>.*)/', serve, {'document_root': MEDIA_ROOT}),
]+static(MEDIA_URL, document_root=MEDIA_ROOT)
