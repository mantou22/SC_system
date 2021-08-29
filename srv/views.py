# Create your views here.
from django.db.models import Q
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render

from srv.models import model_essay, essay_style
from srv.service.essay_service import EssayService
from utilslibrary.base.base import BaseView
from utilslibrary.utils.date_utils import getDateStr


def get_essay_style(request):
    essay_style_list = essay_style.objects.all()
    context = {
        "es_list": essay_style_list
    }
    return render(request, 'srv/essay.html', context)


class EssayStyle(BaseView):
    @staticmethod
    def get(request):
        return render(request, 'srv/essay.html')


class Essay(BaseView):
    @staticmethod
    def get(request):
        essay_style_list = essay_style.objects.all()
        context = {
            "es_list": essay_style_list
        }
        return render(request, 'srv/essay.html', context)


class EssayAdd(BaseView):
    def get(self, request):
        return render(request, 'srv/essay.html')

    def post(self, request):
        data = {}

        title = request.POST.get('title', '')
        writing_theme = request.POST.get('writing_theme', '')
        content = request.POST.get('content', '')

        _me = model_essay()
        _me.title = title
        _me.writing_theme = writing_theme
        _me.content = content
        # 获取时间
        _me.create_time = getDateStr()

        data = {}
        try:
            _me.save()
            data["success"] = True
            data["msg"] = "Success"
        except Exception as e:
            print(e)
            data["success"] = False
            data["msg"] = "Failed"

        return render(request, 'srv/essay.html', data)


class EssayList(BaseView):
    def get(self, request):
        return render(request, 'srv/essay_list.html')

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
        _model_essay_list = model_essay.objects.filter(q).order_by('-id')[self.startIndex:self.endIndex].values()

        for ms in _model_essay_list:
            wt_id = ms.get("writing_theme")
            es = essay_style.objects.filter(id=wt_id)[0]
            ms["wt_name"] = es.type_name
        # 组装JSON数据
        data = {}
        # 设置总记录数
        data["total"] = model_essay.objects.filter(q).count()
        data["rows"] = list(_model_essay_list)
        print(data)

        return JsonResponse(data, safe=False)


class EssayView(BaseView):
    def get(self, request):
        id = request.GET.get("id")
        print("essay model id:", id)
        if not id:
            return render(request, 'srv/essay_form.html', {"method": "edit"})
        else:
            _ms = model_essay.objects.get(id=id)
            wt_id = _ms.writing_theme
            essay_style_list = essay_style.objects.exclude(id=wt_id)
            es = essay_style.objects.filter(id=wt_id)[0]
            context = {
                "es_list": essay_style_list,
                "model_essay": _ms,
                "method": "edit",
                "cur_es": es
            }

            return render(request, 'srv/essay_form.html', context)


# user delete
class EssayDel(BaseView):
    def get(self, request):
        data = {}
        ids = request.GET.get("id")
        data["success"] = True
        data["msg"] = "Success"
        _me = model_essay()
        _me.id = ids
        _s = EssayService()
        return _s.del_essay(_me)


class EssayEdit(BaseView):
    def get(self, request):
        id = request.GET.get("id")
        print("essay model id:", id)
        if not id:
            return render(request, 'srv/essay_form.html', {"method": "edit"})
        else:
            _ms = model_essay.objects.get(id=id)
            wt_id = _ms.writing_theme
            essay_style_list = essay_style.objects.exclude(id=wt_id)
            es = essay_style.objects.filter(id=wt_id)[0]
            context = {
                "es_list": essay_style_list,
                "model_essay": _ms,
                "method": "edit",
                "cur_es": es
            }
            return render(request, 'srv/essay_form.html', context)

    def post(self, request):
        data = {}

        id = request.POST.get('id')

        title = request.POST.get('title', '')
        writing_theme = request.POST.get('writing_theme', '')
        content = request.POST.get('content', '')

        if id:
            # update data
            _me = model_essay.objects.get(id=id)
            _me.title = title
            _me.writing_theme = writing_theme
            _me.content = content
            _s = EssayService()
            data = {}
            try:
                _me.save()
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


class WritingTask(BaseView):
    @staticmethod
    def get(request):
        return render(request, 'srv/task_form.html')


# 写作任务
class TaskAdd(BaseView):
    @staticmethod
    def get(request):
        return render(request, 'srv/task_form.html')


class TaskList(BaseView):
    @staticmethod
    def get(request):
        return render(request, 'srv/task_list.html')


def index(request):
    return HttpResponse("MT")


def read(request):
    return HttpResponse("read")


class essay_list(BaseView):
    @staticmethod
    def get(request):
        return render(request, 'srv/essay_list.html')


def update(request):
    return render(request, 'srv/course/course_list.html')


def c_list(request):
    return render(request, 'srv/course/course.html')
