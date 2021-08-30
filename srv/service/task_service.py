#!/usr/bin/python
# -*- coding: UTF-8 -*-
"""
@author:MT
@file:task_service.py
@time:2021/8/30 21:14   
"""
"""src/essay/task/ process method

"""
from utilslibrary.proxy.log_db_proxy import ProxyFactory, InvocationHandler
from django.http.response import JsonResponse
from django.db import transaction
from utilslibrary.base.base import BaseService
from srv.models import writing_task


@ProxyFactory(InvocationHandler)
class TaskService(BaseService):
    def add_essay(self, write_task):
        # return msg object
        data = {}
        try:
            write_task.save()
            data["success"] = True
            data["msg"] = "Success"
        except Exception as e:
            print(e)
            data["success"] = False
            data["msg"] = "Failed"

        return JsonResponse(data, safe=False)

    def que_essay(self, request, write_task):
        print('{} que data:{}')

    def upd_essay(self, write_task):
        data = {}
        try:
            write_task.save()
            data["success"] = True
            data["msg"] = "Success"
        except Exception as e:
            print(e)
            data["success"] = False
            data["msg"] = "Failed"

        return JsonResponse(data, safe=False)
        # del_

    # delete user by ids
    @transaction.atomic
    def del_essay(self, obj):
        # return msg object
        data = {}
        data["success"] = False
        data["msg"] = "Failed"
        ids = obj.id
        if not ids:
            data["success"] = False
            data["msg"] = "Failed"
            return JsonResponse(data, safe=False)

        with transaction.atomic():
            id_list = ids.split(",")
            for id in id_list:
                if id:
                    _o = writing_task.objects.get(id=id)
                    _o.delete()

        data["success"] = True
        data["msg"] = "Success"
        return JsonResponse(data, safe=False)
