#!/usr/bin/python
# -*- coding: UTF-8 -*-
"""
@author:MT
@file:stu_task_view.py
@time:2021/8/31 1:16   
"""

from django.db.models import Q
from django.http import JsonResponse
from django.shortcuts import render

from srv.models import stu_writing
from srv.service.stu_task_service import StuTaskService
from srv.service.video_service import VideoService
from utilslibrary.base.base import BaseView


class StuTaskView(BaseView):
    def get(self, request):
        id = request.GET.get("id")
        print("stu writing id:", id)
        if not id:
            return render(request, 'srv/stu_task/stu_task_form_edit.html', {"method": "edit"})
        else:
            _obj = stu_writing.objects.get(id=id)
            context = {
                "_obj": _obj
            }
            return render(request, 'srv/stu_task/stu_task_form_edit.html', context)


# delete
class StuTaskDel(BaseView):
    def get(self, request):
        data = {}
        ids = request.GET.get("id")
        data["success"] = True
        data["msg"] = "Success"
        _o = stu_writing()
        _o.id = ids
        _s = StuTaskService()
        return _s.del_essay(_o)


class StuTaskEdit(BaseView):
    def get(self, request):
        id = request.GET.get("id")
        print("stu task id:", id)
        if not id:
            return render(request, 'srv/stu_task/stu_task_form_edit.html', {"method": "edit"})
        else:
            _obj = stu_writing.objects.get(id=id)
            context = {

            }
            return render(request, 'srv/stu_task/stu_task_form_edit.html', context)

    def post(self, request):
        data = {}
        id = request.POST.get('id')
        if id:
            # update data
            _obj = stu_writing.objects.get(id=id)
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
class StuTaskList(BaseView):
    def get(self, request):
        return render(request, 'srv/stu_task/stu_task_list.html')

    def post(self, request):
        # -----------------------------
        # ?????????????????????????????????
        # ???????????????self.startIndex???self.endIndex???????????????????????????
        # ------------------------------
        super().post(request)

        """query by where1"""
        # ?????????????????????????????????????????????
        q = Q()
        q.connector = 'and '

        print('startIndex{} endIndex{}'.format(self.startIndex, self.endIndex))
        # ????????????
        _o_list = stu_writing.objects.filter(q).order_by('-id')[self.startIndex:self.endIndex].values()
        # ??????JSON??????
        data = {}
        # ??????????????????
        data["total"] = stu_writing.objects.filter(q).count()
        data["rows"] = list(_o_list)
        print(data)
        return JsonResponse(data, safe=False)


class StuTaskAdd(BaseView):
    def get(self, request):
        return render(request, 'srv/stu_task/stu_task_form.html')

    def post(self, request):
        _o = stu_writing()
        data = {}
        try:
            _o.save()
            data["success"] = True
            data["msg"] = "Success"
        except Exception as e:
            print(e)
            data["success"] = False
            data["msg"] = "Failed"
        return render(request, 'srv/stu_task/stu_task_form.html', data)
