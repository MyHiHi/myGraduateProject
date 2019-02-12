# coding:utf-8
from django.shortcuts import render
from django.http import HttpResponse,JsonResponse
import json

def index(request):
    return render(request,'index.html')

def test(request):
    return render(request,"test/test.html")

def text(request):
    real = "http://" + str(request.GET.get("url"))
    return JsonResponse({"real":real})

