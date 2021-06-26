#!/usr/bin/python
# -*- coding: UTF-8 -*-
"""
@author:MT
@file:urls.py
@time:2021/6/13 14:55   
"""
from django.conf.urls import url

from . import views

urlpatterns = [
    url("", views.index, name='index'),
]