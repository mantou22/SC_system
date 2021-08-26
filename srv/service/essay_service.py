#!/usr/bin/python
# -*- coding: UTF-8 -*-
"""
@author:MT
@file:essay_service.py
@time:2021/8/21 23:03   
"""

# coding:utf-8
"""src/essay/ process method

"""
from utilslibrary.proxy.log_db_proxy import ProxyFactory, InvocationHandler
from django.http.response import JsonResponse
from django.db import transaction
from utilslibrary.base.base import BaseService
from srv.models import model_essay


@ProxyFactory(InvocationHandler)
class EssayService(BaseService):
    def add_essay(self, model_essay):
        # return msg object
        data = {}
        try:
            model_essay.save()
            data["success"] = True
            data["msg"] = "Success"
        except Exception as e:
            print(e)
            data["success"] = False
            data["msg"] = "Failed"

        return JsonResponse(data, safe=False)

    def que_essay(self, request, model_essay):
        print('{} que data:{}')

    def upd_essay(self, model_essay):
        data = {}
        try:
            model_essay.save()
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
                    _o = model_essay.objects.get(id=id)
                    _o.delete()

        data["success"] = True
        data["msg"] = "Success"
        return JsonResponse(data, safe=False)
