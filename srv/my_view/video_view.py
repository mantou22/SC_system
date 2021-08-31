#!/usr/bin/python
# -*- coding: UTF-8 -*-
"""
@author:MT
@file:micro_course_view.py
@time:2021/8/22 17:57   
"""
import mimetypes
import os
import re
from wsgiref.util import FileWrapper

from django.db.models import Q
from django.http import HttpResponse, JsonResponse, StreamingHttpResponse
from django.shortcuts import render

from DjangoAdmin.settings import MEDIA_ROOT
from srv.models import micro_course
from srv.service.video_service import VideoService
from utilslibrary.base.base import BaseView
from utilslibrary.utils.date_utils import getDateStr


class VideoView(BaseView):
    def get(self, request):
        id = request.GET.get("id")
        print("video id:", id)
        if not id:
            return render(request, 'srv/video/video_form_edit.html', {"method": "edit"})
        else:
            obj = micro_course.objects.get(id=id)
            context = {
                "obj": obj
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
        video_file = request.FILES.get("c_path", None)  # 获取上传的文件，如果没有文件，则默认为None
        if not video_file:
            return HttpResponse("no files for upload!")
        c_path = os.path.join(MEDIA_ROOT, video_file.name)
        destination = open(c_path, 'wb+')  # 打开特定的文件进行二进制的写操作
        for chunk in video_file.chunks():  # 分块写入文件
            destination.write(chunk)
        destination.close()

        _o = micro_course()
        _o.c_name = c_name
        _o.c_desc = c_desc
        _o.c_path = c_path
        _o.create_time = getDateStr()
        _o.type = ""  # todo 微课类型后续添加

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


def videoStream_handler(request, id):
    """将视频文件以流媒体的方式响应"""
    try:
        obj = micro_course.objects.get(id=id)
        print({"obj": obj})
        path = obj.c_path
        # 读取视频的大小
        size = os.path.getsize(obj.c_path)
        # 请求头文件中的range
        range_header = request.META.get('HTTP_RANGE', '').strip()
        range_re = re.compile(r'bytes\s*=\s*(\d+)\s*-\s*(\d*)', re.I)
        range_match = range_re.match(range_header)

        content_type, encoding = mimetypes.guess_type(path)
        content_type = content_type or 'application/octet-stream'

        if range_match:
            first_byte, last_byte = range_match.groups()
            first_byte = int(first_byte) if first_byte else 0
            last_byte = first_byte + 1024 * 1024 * 10
            if last_byte >= size:
                last_byte = size - 1
            length = last_byte - first_byte + 1
            resp = StreamingHttpResponse(file_iterator(path, offset=first_byte, length=length), status=206,
                                         content_type=content_type)
            resp['Content-Length'] = str(length)
            resp['Content-Range'] = 'bytes %s-%s/%s' % (first_byte, last_byte, size)
        else:
            resp = StreamingHttpResponse(FileWrapper(open(path, 'rb')), content_type=content_type)
            resp['Content-Length'] = str(size)
        resp['Accept-Ranges'] = 'bytes'
        return resp
    except:
        print("video not found")
        return HttpResponse(status=404)


def file_iterator(file_name, chunk_size=8192, offset=0, length=None):
    with open(file_name, "rb") as f:
        f.seek(offset, os.SEEK_SET)
        remaining = length
        while True:
            bytes_length = chunk_size if remaining is None else min(remaining, chunk_size)
            data = f.read(bytes_length)
            if not data:
                break
            if remaining:
                remaining -= len(data)

            yield data
    return
