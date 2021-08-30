#!/usr/bin/python
# -*- coding: UTF-8 -*-
"""
@author:MT
@file:micro_course_view.py
@time:2021/8/22 17:57   
"""

from django.db.models import Q
from django.http import JsonResponse
from django.shortcuts import render

from srv.models import micro_course
from srv.service.video_service import VideoService
from utilslibrary.base.base import BaseView
from utilslibrary.utils.date_utils import getDateStr


class VideoView(BaseView):
    def get(self, request):
        id = request.GET.get("id")
        print("essay model id:", id)
        if not id:
            return render(request, 'srv/video/video_form_edit.html', {"method": "edit"})
        else:
            _obj = micro_course.objects.get(id=id)
            context = {
                "_obj": _obj
            }
            return render(request, 'srv/video/video_form_edit.html', context)


# delete
class VideoDel(BaseView):
    def get(self, request):
        data = {}
        ids = request.GET.get("id")
        data["success"] = True
        data["msg"] = "Success"
        _o = micro_course()
        _o.id = ids
        _s = VideoService()
        return _s.del_essay(_o)


class VideoEdit(BaseView):
    def get(self, request):
        id = request.GET.get("id")
        print("essay model id:", id)
        if not id:
            return render(request, 'srv/video/video_form_edit.html', {"method": "edit"})
        else:
            _obj = micro_course.objects.get(id=id)
            context = {
                "_obj": _obj
            }
            return render(request, 'srv/video/video_form_edit.html', context)

    def post(self, request):
        data = {}
        id = request.POST.get('id')
        if id:
            # update data
            _obj = micro_course.objects.get(id=id)
            data = {}
            try:
                _obj.save()
                data["success"] = True
                data["msg"] = "Success"
            except Exception as e:
                print(e)
                data["success"] = False
                data["msg"] = "Failed"
            return JsonResponse(data, safe=False)
        else:

            data["success"] = False
            data["msg"] = "ID Error!"
            return JsonResponse(data, safe=False)


# list
class VideoList(BaseView):
    def get(self, request):
        return render(request, 'srv/video/video_list.html')

    def post(self, request):
        # -----------------------------
        # 需要获得翻页参数时添加
        # 代码中使用self.startIndex和self.endIndex获取相应范围的记录
        # ------------------------------
        super().post(request)
        """query by where1"""
        # 添加查询条件，设置为逻辑与查询
        q = Q()
        q.connector = 'and '

        print('startIndex{} endIndex{}'.format(self.startIndex, self.endIndex))
        # 执行查询
        _o_list = micro_course.objects.filter(q).order_by('-id')[self.startIndex:self.endIndex].values()
        # 组装JSON数据
        data = {}
        # 设置总记录数
        data["total"] = micro_course.objects.filter(q).count()
        data["rows"] = list(_o_list)
        print(data)
        return JsonResponse(data, safe=False)


class VideoAdd(BaseView):
    def get(self, request):
        return render(request, 'srv/video/video_form.html')

    def post(self, request):

        c_name = request.POST.get('c_name', '')
        c_desc = request.POST.get('c_desc', '')
        c_path = request.POST.get('c_path', '')

        _o = micro_course()
        _o.c_name = c_name
        _o.c_desc = c_desc
        _o.c_path = c_path
        _o.create_time = getDateStr()
        _o.type = "" # todo 微课类型后续添加

        data = {}
        try:
            _o.save()
            data["success"] = True
            data["msg"] = "Success"
        except Exception as e:
            print(e)
            data["success"] = False
            data["msg"] = "Failed"
        return render(request, 'srv/video/video_form.html', data)
