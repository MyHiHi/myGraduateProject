# coding:utf-8
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
import json
import requests
from django.conf import settings
import random,json
from datetime import datetime
from django.db import transaction
from .models import BasicInfo, detailInfo,selectMessageByUid

# from . import models

image_url="http://webmap3.map.bdimg.com/maps/services/thumbnails?&height=253&quality=70&\
src=http%3A%2F%2Fdimg04.c-ctrip.com%2Fimages%2Fhotel%2F915000%2F914406%2F0f9a278b34\
1b46268578b82ec8b212ed_R_1080_540.jpg"
def index(request):
    return render(request, "index.html")


def getDetailsByuid(request):
    uid = request.GET.get("uid")
    data = selectByUid(uid)
    if data is not None:
        print(data)
    else:
        r = getData(uid)
        try:
            insert(r)
        except Exception as e:
            pass
        

    r = getData(uid)
    return HttpResponse(r)

def insert(r):
    r=json.loads(r)
    r=r["result"]
    uid=r.get("uid"),
    detail_url=r.get("detail_info").get("detail_url"),
    level=r.get("detail_info").get("detail_info.level"),
    overall_rating=r.get("detail_info").get("overall_rating"),
    service_rating=r.get("detail_info").get("service_rating"),
    hygiene_rating=r.get("detail_info").get("hygiene_rating"),
    facility_rating=r.get("detail_info").get("facility_rating"),
    hotel_facility=r.get("detail_info").get("hotel_facility"),
    hotel_service=r.get("detail_info").get("hotel_service"),
    inner_facility=r.get("detail_info").get("inner_facility"),
    
    # print(r["uid"])
    # print(.get("uid"))

    p=r.get("location")
    lng_lat=str(p.get("lng"))+","+str(p.get("lat")),
    name=r.get("name"),
    address=r.get("address"),
    telephone=r.get("telephone"),
    img_url=image_url,
    price=int(r.get("detail_info").get("price")),
    try:
        saveToDetail_info(uid,detail_url,level,
        overall_rating,service_rating,hygiene_rating,facility_rating,
        hotel_facility,hotel_service,inner_facility)
        saveToBasic_info(lng_lat, name, address, telephone, img_url, price, uid)
    except Exception as e:
        print("插入数据失败!!!",e)
    




def getData(uid):
    url = "http://api.map.baidu.com/place/v2/detail"
    params = {
        "uid": uid,
        "scope": "2",
        "output": "json",
        "ak": "DfPUKIDaRFpXtvAv1QqZBpS6D6SQwyMB",
    }
    headers = {"User-Agent": random.choice(settings.USERAGENTS)}
    r = requests.get(url=url, headers=headers, params=params).content
    return r


def saveToBasic_info(lng_lat, name, address, telephone, img_url, price, uid):
    obj = BasicInfo(
        lng_lat=lng_lat,
        name=name,
        address=address,
        telephone=telephone,
        img_url=img_url,
        price=price,
        uid=uid,
    )
    try:
        with transaction.atomic():
            obj.save()
    except Exception as e:
        print(e)


def selectByUid(uid):
    try:
        return selectMessageByUid(uid)
    except Exception as e:
        print("连接MySQL错误: ", e)
        return None


# 必须在saveToBasic_info之前插入
def saveToDetail_info(
    uid,
    detail_url,
    level,
    overall_rating,
    service_rating,
    hygiene_rating,
    facility_rating,
    hotel_facility,
    hotel_service,
    inner_facility,
    create_time=datetime.now(),
):

    obj = detailInfo(
        uid=uid,
        detail_url=detail_url,
        level=level,
        overall_rating=overall_rating,
        service_rating=service_rating,
        hygiene_rating=hygiene_rating,
        facility_rating=facility_rating,
        hotel_facility=hotel_facility,
        hotel_service=hotel_service,
        inner_facility=inner_facility,
        create_time=create_time,
    )
    try:
        with transaction.atomic():
            obj.save()
    except Exception as e:
        print(e)


def checkNull(data):
    return data if data is not None else ""

