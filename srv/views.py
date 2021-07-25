# Create your views here.
from django.http import HttpResponse


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
