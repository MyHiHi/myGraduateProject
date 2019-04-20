# coding:utf-8
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
import json
from .utils import Manager
# 创建操作对象
manager=Manager()

def index(request):
    return render(request, "index.html")


def getDetailsByuid(request):
    uid = request.GET.get("uid")
    data = manager.selectMessageByUid(uid)
    if data is not None:
        data=manager.transMessageToJson(data)
        
        return HttpResponse(json.dumps({
        "data":data
        }))
    else:
        r = manager.getData(uid)        
        try:
            manager.insert(r)
        except Exception as e:
            print("插入出错: ",e)
        finally:
            return HttpResponse(r)
