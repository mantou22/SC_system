# Create your views here.
from django.http import HttpResponse
from django.shortcuts import render

from utilslibrary.base.base import BaseView


class Essay(BaseView):
    @staticmethod
    def get(request):
        return render(request, 'srv/essay.html')


def index(request):
    return HttpResponse("MT")


def read(request):
    return HttpResponse("read")


def essay_list(request):
    return HttpResponse("essay_list")


def update(request):
    return HttpResponse("update")


def c_list(request):
    return HttpResponse("course_list")
