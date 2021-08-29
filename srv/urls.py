#!/usr/bin/python
# -*- coding: UTF-8 -*-
"""
@author:MT
@file:urls.py
@time:2021/6/13 14:55   
"""
from django.conf.urls import url

from srv.views import Essay, WritingTask, TaskList, EssayAdd, TaskAdd, EssayList, EssayDel, EssayEdit
from . import views

urlpatterns = [
    url("^essay/read/$", Essay.as_view()),
    url("^essay/add/$", EssayAdd.as_view()),
    url("^essay/del/$", EssayDel.as_view()),
    url("^essay/list/$", EssayList.as_view()),
    url("^essay/edit/$", EssayEdit.as_view()),

    url("^essay/essay_style/$", views.get_essay_style),

    url("^essay/task/$", WritingTask.as_view()),
    url("^essay/task/add/$", TaskAdd.as_view()),

    url("^essay/task/list$", TaskList.as_view()),
    url("^essay/read/$", Essay.as_view()),


    url("^microCourse/list/$", views.c_list),
    url("^microCourse/update/$", views.update),

]
