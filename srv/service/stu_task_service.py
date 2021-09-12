#!/usr/bin/python
# -*- coding: UTF-8 -*-
"""
@author:MT
@file:video_service.py
@time:2021/8/31 1:16   
"""
from django.db import transaction
from django.http import JsonResponse

from srv.models import stu_writing
from utilslibrary.base.base import BaseService
from utilslibrary.proxy.log_db_proxy import InvocationHandler, ProxyFactory


@ProxyFactory(InvocationHandler)
class StuTaskService(BaseService):
    def add_task(self, stu_writing):
        # return msg object
        data = {}
        try:
            stu_writing.save()
            data["success"] = True
            data["msg"] = "Success"
        except Exception as e:
            print(e)
            data["success"] = False
            data["msg"] = "Failed"

        return JsonResponse(data, safe=False)

    def que_task(self, request, micro_course):
        print('{} que data:{}')

    def upd_task(self, stu_writing):
        data = {}
        try:
            stu_writing.save()
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
                    _o = stu_writing.objects.get(id=id)
                    _o.delete()

        data["success"] = True
        data["msg"] = "Success"
        return JsonResponse(data, safe=False)
