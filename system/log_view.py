import json

from django.db.models import Q
from django.http.response import HttpResponse, JsonResponse
from django.shortcuts import render
from django.template.context_processors import request

from system.models import log
from utilslibrary.base.base import BaseView


class LogList(BaseView):
    def get(self, request):
        return render(request, 'system_log_list.html')

    def post(self, request):
        # 获取翻页
        super().post(request)

        # 接收查询参数---与页面上要查询的条件匹配
        loginname = request.POST.get('loginname', '')
        realname = request.POST.get('realname', '')
        isadmin = request.POST.get('isadmin', '')
        user_name = request.POST.get('user_name', '')
        action = request.POST.get('action', '')
        obj = request.POST.get('obj', '')

        # 多条件查询
        q = Q()
        q.connector = 'and'
        q.children.append(('is_delete', 0))

        if user_name:
            q.children.append(('user_name', user_name))
        if action:
            q.children.append(('action', action))
        if obj:
            q.children.appemd(('obj__contains', obj))
        print('startIndex{} endIndex{}'.format(self.startIndex, self.endIndex))

        # 查询
        log_list = log.objects.filter(q).order_by('-id')[self.startIndex:self.endIndex].values()
        print(log_list)
        # 组装JSON数据
        data = {}
        # 设置总记录数
        data["total"] = log.objects.filter(q).count()
        data["rows"] = list(log_list)
        print(data['rows'])

        return JsonResponse(data, safe=False)


class LogForm(BaseView):
    def get(self, request):
        id = request.GET.get("id")
        global false, null, true
        false = null = true = ''
        print(id)
        if not id:
            return render(request, 'log_form.html')
        else:
            _o = log.objects.get(id=id)
            print("0", type(_o.json), _o.json)
            json_list = _o.json
            print("1", type(json_list), json_list)
            json_list = json_list.replace('\n', '').replace('\r', '').replace('\t', '')
            print("2", type(json_list), json_list)
            dict_list = []
            if json_list:
                # lis = list(_o.json)
                # print("3",type(lis),lis)
                dict_list = json.loads(s=json_list)
                print("3", type(dict_list), dict_list)
                for (k, v) in dict_list.items():
                    print("%s=" % k, v)
                    # lis = list(dict_list)
                    # print("2",type(lis),lis)
                    # dict_list = eval(dict_list)
                    # print("2"+str(dict_list))
            return render(request, 'log_form.html', {"log": _o, "dict_list": dict_list.items()})

    def post(self, request):

        # id = request.POST.get('id')
        # obj = request.POST.get('obj')
        # data_id = request.POST.get('data_id')
        # user = request.POST.get('user')
        # action = request.POST.get('action')
        # json = request.POST.get('JSON')
        # ip = request.POST.get('ip')
        return render(request, 'log_form.html')
