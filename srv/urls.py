#!/usr/bin/python
# -*- coding: UTF-8 -*-
"""
@author:MT
@file:urls.py
@time:2021/6/13 14:55   
"""
from django.conf.urls import url

from srv.views import Essay
from . import views

urlpatterns = [
    url("^essay/read/$", Essay.as_view()),
    url("^essay/list/$", views.essay_list),
    url("^microCourse/list/$", views.c_list),
    url("^microCourse/update/$", views.update),

]