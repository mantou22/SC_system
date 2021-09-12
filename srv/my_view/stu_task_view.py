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

from srv.models import stu_writing, writing_task, essay_style
from srv.service.stu_task_service import StuTaskService
from system.models import user
from utilslibrary.base.base import BaseView
from utilslibrary.predict.main import get_score
from utilslibrary.utils.common_utils import getCurrentSessionID, UploadType, IsSubmit
from utilslibrary.utils.date_utils import getDateStr


class StuTaskView(BaseView):
    def get(self, request):
        wt_id = request.GET.get("id")
        print("writing task id:", wt_id)
        if not wt_id:
            return render(request, 'srv/stu_task/stu_task_form_edit.html', {"method": "edit"})
        else:
            _obj = writing_task.objects.get(id=wt_id)
            context = {
                "obj": _obj
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
        wt_id = request.GET.get("id")
        print("writing task id:", wt_id)
        if not wt_id:
            return render(request, 'srv/stu_task/stu_task_form_edit.html', {"method": "edit"})
        else:
            wt_obj = writing_task.objects.get(id=wt_id)
            es_id = wt_obj.es_id
            es = essay_style.objects.filter(id=es_id)[0]
            stu_id = getCurrentSessionID(request)
            # 判断是否已经提交过，已经提交则不需要重复提交。
            record = stu_writing.objects.filter(wt_id=wt_id, s_id=stu_id,
                                                is_upload=UploadType.NEED_UPLOAD)
            context = {}
            if not record:
                context["flag"] = IsSubmit.No
            else:
                context["flag"] = IsSubmit.Yes
                context["record"] = record[0]
            context.update({
                "wt_obj": wt_obj,
                "cur_es": es
            })
            print("context:", context)
            return render(request, 'srv/stu_task/stu_task_form_edit.html', context)


# list
class StuTaskList(BaseView):
    def get(self, request):
        return render(request, 'srv/stu_task/stu_task_list.html')

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
        _o_list = stu_writing.objects.filter(q).order_by('-id')[self.startIndex:self.endIndex].values()
        # 组装JSON数据
        data = {}
        # 设置总记录数
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


class StuTaskSave(BaseView):
    def get(self, request):
        print(111)
        return render(request, 'srv/stu_task/stu_task_form_edit.html')

    def post(self, request):
        wt_id = request.POST.get('wt_id')
        data = {}
        stu_id = getCurrentSessionID(request)
        content = request.POST.get('content')

        last_record_list = stu_writing.objects.filter(wt_id=wt_id, s_id=stu_id).order_by("create_time").values()
        if last_record_list:
            last_record = list(last_record_list)[-1]
            last_content = last_record["content"]
            if last_content == content:
                data["success"] = False
                data["msg"] = "提交内容相同，请认真修改再提交"
                return JsonResponse(data)

        _o = stu_writing()
        _o.wt_id = wt_id
        _o.s_id = stu_id
        _o.content = content
        # TODO 调用预测模块机器预测分数返回
        _o.machine_score = get_machine_score(content)
        _o.create_time = getDateStr()
        data = save_stu_task(_o)
        return JsonResponse(data)


class StuTaskFormalSave(BaseView):
    def get(self, request):
        print(111)
        return render(request, 'srv/stu_task/stu_task_form_edit.html')

    '''
    正式提交只能提交一次，通过 wt_id，s_id is_upload=1， 来判断唯一值。

    '''

    def post(self, request):
        wt_id = request.POST.get('wt_id')
        stu_id = getCurrentSessionID(request)
        content = request.POST.get('content')
        record = stu_writing.objects.filter(wt_id=wt_id, s_id=stu_id, is_upload=UploadType.NEED_UPLOAD)
        data = {}
        if record:
            data["success"] = False
            data["msg"] = "已提交，请勿重复提交，返回上一级查看详情"
            return JsonResponse(data)
        _o = stu_writing()
        _o.wt_id = wt_id
        _o.s_id = stu_id
        _o.content = content
        _o.is_upload = UploadType.NEED_UPLOAD
        # TODO 调用预测模块机器预测分数返回
        _o.machine_score = get_machine_score(content)
        _o.create_time = getDateStr()
        data = save_stu_task(_o)
        return JsonResponse(data)


# list
# 老师查询学生提交详细情况service
class StuTaskTeaViewList(BaseView):
    def post(self, request):
        super().post(request)
        # 组装JSON数据
        data = {}
        wt_id = request.POST.get('id')
        print("wt_id:", wt_id)
        if wt_id:
            # 先查询所有学生，已提交， 未提交，加一个字段，可以通过查询stu_writing里面是否有该学生正式提交的记录生成。
            # 非管理员和是学生且没有被删除
            all_stu = user.objects.filter(isadmin=0, is_delete=0, isstudent=0)[self.startIndex:self.endIndex].values()
            for stu in all_stu:
                stu_id = stu["id"]
                # 查询当前任务，学生是否提交,
                new_stu = stu_writing.objects.filter(wt_id=wt_id, s_id=stu_id,
                                                     is_upload=UploadType.NEED_UPLOAD).values()
                if new_stu:
                    stu["is_upload"] = UploadType.NEED_UPLOAD
                    stu["stu_writing"] = list(new_stu)[0]
                else:
                    stu["is_upload"] = UploadType.NO_NEED_UPLOAD
                    stu["stu_writing"] = ""
            data["total"] = user.objects.filter(isadmin=0, is_delete=0, isstudent=0).count()
            data["rows"] = list(all_stu)
            print("data", data)
        return JsonResponse(data, safe=False)


# list
class StuTaskViewList(BaseView):
    def post(self, request):
        super().post(request)
        """query by where1"""
        # 添加查询条件，设置为逻辑与查询
        wt_id = request.POST.get('id')
        s_id = getCurrentSessionID(request)
        print('startIndex{} endIndex{}'.format(self.startIndex, self.endIndex))
        # 执行查询
        _o_list = stu_writing.objects.filter(wt_id=wt_id, s_id=s_id).order_by('create_time')[
                  self.startIndex:self.endIndex].values()
        data = {"total": stu_writing.objects.filter(wt_id=wt_id, s_id=s_id).count(), "rows": list(_o_list)}
        print(data)
        return JsonResponse(data, safe=False)


class StuShowNotes(BaseView):
    def get(self, request):
        notes = request.GET.get("notes")
        context = {"notes": notes}
        return render(request, 'srv/stu_task/stu_show_notes.html', context)


class TeaEditTask(BaseView):
    def get(self, request):
        wt_id = request.GET.get("wt_id")
        s_id = request.GET.get("s_id")
        realname = request.GET.get("realname")
        print("writing task id:", wt_id)
        print("s_id:", s_id)
        print("s_id:", realname)
        if not wt_id:
            return render(request, 'srv/stu_task/tea_edit_task.html', {"method": "edit"})
        else:
            # 查询到对应学生已提交的写作任务
            stu_write = stu_writing.objects.filter(wt_id=wt_id, s_id=s_id, is_upload=UploadType.NEED_UPLOAD)[0]
            wt_obj = writing_task.objects.get(id=wt_id)
            es_id = wt_obj.es_id
            es = essay_style.objects.filter(id=es_id)[0]
            context = {}
            context.update({
                "wt_obj": wt_obj,
                "cur_es": es,
                "stu_writing": stu_write,
                "realname": realname
            })
            print("context:", context)
            return render(request, 'srv/stu_task/tea_edit_task.html', context)

    def post(self, request):
        # super().post(request)
        # 组装JSON数据
        data = {}
        id = request.POST.get('id')
        tea_score = request.POST.get('tea_score')
        notes = request.POST.get('notes')
        s_obj = stu_writing.objects.filter(id=id)[0]
        print("id:", id)
        if s_obj:
            # total_score   machine_score
            s_obj.tea_score = tea_score
            s_obj.notes = notes
            s_obj.total_score = (int(float(s_obj.machine_score)) + int(float(tea_score))) / 2
            data = save_stu_task(s_obj)
        else:
            data["success"] = False
            data["msg"] = "没有数据无法打分"
        return JsonResponse(data, safe=False)


def save_stu_task(obj):
    data = {}
    try:
        obj.save()
        data["success"] = True
        data["msg"] = "Success"
    except Exception as e:
        print(e)
        data["success"] = False
        data["msg"] = "Failed"
    return data


def get_machine_score(content):
    score = 80
    # TODO 调用预测模块机器预测分数返回。
    score = get_score(content)
    return score
