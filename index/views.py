#--coding:utf-8 --
"""显示首页的操作

"""
from django.http import request
from django.shortcuts import render

# Create your views here.

def index(request):
  
    return render(request, "index.html");
    