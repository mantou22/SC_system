#!/usr/bin/python
# -*- coding: UTF-8 -*-
"""
@author:MT
@file:urls.py
@time:2021/6/13 14:55   
"""
from django.conf.urls import url
from django.urls import path

from srv.my_view import video_view
from srv.my_view.stu_task_view import (StuTaskAdd, StuTaskDel, StuTaskEdit,
                                       StuTaskList, StuTaskView, StuTaskSave, StuTaskFormalSave, StuTaskFormalList,
                                       StuTaskFreeList)
from srv.my_view.task_view import (TaskAdd, TaskDel, TaskEdit, TaskList,
                                   TaskView, WritingTask)
from srv.my_view.video_view import (VideoAdd, VideoDel, VideoEdit, VideoList,
                                    VideoView)
from srv.views import (Essay, EssayAdd, EssayDel, EssayEdit, EssayList,
                       EssayView)

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

    # 微课
    url("^video/add/$", VideoAdd.as_view()),
    url("^video/del/$", VideoDel.as_view()),
    url("^video/edit/$", VideoEdit.as_view()),
    url("^video/list/$", VideoList.as_view()),
    url("^video/view/$", VideoView.as_view()),
    path("video/play/<int:id>/", video_view.videoStream_handler, name="video_play"),

    # 学生写作
    url("^stu/task/add/$", StuTaskAdd.as_view()),
    url("^stu/task/del/$", StuTaskDel.as_view()),
    url("^stu/task/edit/$", StuTaskEdit.as_view()),
    url("^stu/task/list/$", StuTaskList.as_view()),
    url("^stu/task/view/$", StuTaskView.as_view()),
    url("^stu/task/save/$", StuTaskSave.as_view()),
    url("^stu/task/formal_save/$", StuTaskFormalSave.as_view()),
    url("^stu/task/free/list/$", StuTaskFreeList.as_view()),
    url("^stu/task/formal/list/$", StuTaskFormalList.as_view()),



]
