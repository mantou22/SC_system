#!/usr/bin/python
# -*- coding: UTF-8 -*-
"""
@author:MT
@file:task_view.py
@time:2021/8/22 17:57   
"""
from django.db.models import Q
from django.http import JsonResponse
from django.shortcuts import render

from srv.models import essay_style, writing_task
from srv.service.task_service import TaskService
from utilslibrary.base.base import BaseView
from utilslibrary.utils.date_utils import getDateStr


class WritingTask(BaseView):
    @staticmethod
    def get(request):
        essay_style_list = essay_style.objects.all()
        context = {
            "es_list": essay_style_list
        }
        return render(request, 'srv/task/task_form.html', context)


class TaskView(BaseView):
    def get(self, request):
        id = request.GET.get("id")
        print("essay model id:", id)
        if not id:
            return render(request, 'srv/task/task_form_edit.html', {"method": "edit"})
        else:
            _obj = writing_task.objects.get(id=id)
            es_id = _obj.es_id
            essay_style_list = essay_style.objects.exclude(id=es_id)
            es = essay_style.objects.filter(id=es_id)[0]
            context = {
                "es_list": essay_style_list,
                "obj": _obj,
                "method": "edit",
                "cur_es": es
            }
            return render(request, 'srv/task/task_form_edit.html', context)


# delete
class TaskDel(BaseView):
    def get(self, request):
        data = {}
        ids = request.GET.get("id")
        data["success"] = True
        data["msg"] = "Success"
        _o = writing_task()
        _o.id = ids
        _s = TaskService()
        return _s.del_essay(_o)

class TaskEdit(BaseView):
    def get(self, request):
        id = request.GET.get("id")
        print("essay model id:", id)
        if not id:
            return render(request, 'srv/task/task_form_edit.html', {"method": "edit"})
        else:
            _obj = writing_task.objects.get(id=id)
            es_id = _obj.es_id
            essay_style_list = essay_style.objects.exclude(id=es_id)
            es = essay_style.objects.filter(id=es_id)[0]
            context = {
                "es_list": essay_style_list,
                "obj": _obj,
                "method": "edit",
                "cur_es": es
            }
            return render(request, 'srv/task/task_form_edit.html', context)

    def post(self, request):
        data = {}

        id = request.POST.get('id')

        title = request.POST.get('title', '')
        es_id = request.POST.get('writing_theme', '')
        requirement = request.POST.get('requirement', '')
        deadline_time = request.POST.get('deadline_time', '')

        if id:
            # update data
            _obj = writing_task.objects.get(id=id)
            _obj.title = title
            _obj.es_id = es_id
            _obj.requirement = requirement
            _obj.deadline_time = deadline_time
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
class TaskList(BaseView):
    def get(self, request):
        return render(request, 'srv/task/task_list.html')

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
        _o_list = writing_task.objects.filter(q).order_by('-id')[self.startIndex:self.endIndex].values()

        for ms in _o_list:
            es_id = ms.get("es_id")
            es = essay_style.objects.filter(id=es_id)[0]
            ms["wt_name"] = es.type_name
        # 组装JSON数据
        data = {}
        # 设置总记录数
        data["total"] = writing_task.objects.filter(q).count()
        data["rows"] = list(_o_list)
        print(data)
        return JsonResponse(data, safe=False)


class TaskAdd(BaseView):
    def get(self, request):
        return render(request, 'srv/task/task_form.html')

    def post(self, request):
        data = {}

        title = request.POST.get('title', '')
        es_id = request.POST.get('writing_theme', '')
        requirement = request.POST.get('requirement', '')
        deadline_time = request.POST.get('deadline_time', '')

        _o = writing_task()
        _o.title = title
        _o.es_id = es_id
        _o.requirement = requirement
        _o.deadline_time = deadline_time
        _o.create_time = getDateStr()

        data = {}
        try:
            _o.save()
            data["success"] = True
            data["msg"] = "Success"
        except Exception as e:
            print(e)
            data["success"] = False
            data["msg"] = "Failed"
        essay_style_list = essay_style.objects.all()
        data['es_list'] = essay_style_list
        return render(request, 'srv/task/task_form.html', data)
