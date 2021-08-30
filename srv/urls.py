#!/usr/bin/python
# -*- coding: UTF-8 -*-
"""
@author:MT
@file:urls.py
@time:2021/6/13 14:55   
"""
from django.conf.urls import url

from srv.my_view.task_view import WritingTask, TaskAdd, TaskList, TaskDel, TaskEdit, TaskView
from srv.views import Essay, EssayAdd, EssayList, EssayDel, EssayEdit, EssayView
from . import views

urlpatterns = [
    #范文
    url("^essay/read/$", Essay.as_view()),
    url("^essay/add/$", EssayAdd.as_view()),
    url("^essay/del/$", EssayDel.as_view()),
    url("^essay/list/$", EssayList.as_view()),
    url("^essay/edit/$", EssayEdit.as_view()),
    url("^essay/view/$", EssayView.as_view()),

    #老师发布写作任务
    url("^essay/task/$", WritingTask.as_view()),
    url("^essay/task/add/$", TaskAdd.as_view()),
    url("^essay/task/del/$", TaskDel.as_view()),
    url("^essay/task/edit/$", TaskEdit.as_view()),
    url("^essay/task/list/$", TaskList.as_view()),
    url("^essay/task/view/$", TaskView.as_view()),

    # 学生写作
    # url("^essay/task/$", WritingTask.as_view()),
    # url("^essay/task/add/$", TaskAdd.as_view()),
    # url("^essay/task/del/$", TaskDel.as_view()),
    # url("^essay/task/edit/$", TaskEdit.as_view()),
    # url("^essay/task/list/$", TaskList.as_view()),
    # url("^essay/task/view/$", TaskView.as_view()),

    # 微课
    # url("^essay/task/$", WritingTask.as_view()),
    # url("^essay/task/add/$", TaskAdd.as_view()),
    # url("^essay/task/del/$", TaskDel.as_view()),
    # url("^essay/task/edit/$", TaskEdit.as_view()),
    # url("^essay/task/list/$", TaskList.as_view()),
    # url("^essay/task/view/$", TaskView.as_view()),

]
