
import json
from django.db import transaction,connection
from .models import Basic, Detail
import requests
import pymysql
from django.conf import settings
import random,json
from datetime import datetime

image_url="/static/img/fail.jpg"

class Manager(object):
    def __init__(self):
        self.cursor=connection.cursor()

    def close_cursor(self):
        pass
        # self.cursor.close()

    def selectMessageByUid(self,uid):
        sql = "select * from basic a join detail using(uid) where a.uid='{0}' ".format(
                uid
            )
        try:
            self.cursor.execute(sql)
            row = self.cursor.fetchone()
            return None if row == [] else row
        except Exception as e:
            print("insertToBasic插入失败",e)
            return None
        finally:
            self.close_cursor()  


    def transMessageToJson(self,row):
        dict = {}
        dict["uid"] = row[0]
        dict["lng_lat"] = row[2]
        dict["name"] = row[3]
        dict["address"] = row[4]
        dict["telephone"] = row[5]
        dict["img_url"] = row[6]
        # dict["price"] = row[7]
        # dict["detail_url"] = row[9]
        # dict["level"] = row[10]
        # dict["overall_rating"] = row[11]
        # dict["service_rating"] = row[12]
        # dict["hygiene_rating"] = row[13]
        # dict["facility_rating"] = row[14]
        # dict["hotel_facility"] = row[15]
        # dict["hotel_service"] = row[16]
        # dict["inner_facility"] = row[17]

        dict["detail_info"]={"detail_url":row[9],"facility_rating":row[14],
        "hygiene_rating":row[13],"overall_rating":row[11],"price":row[7],
        "service_rating":row[12],"level":row[10],"hotel_facility":row[15],
        "hotel_service":row[16],"inner_facility":row[17]}
        json2 = json.dumps(dict, ensure_ascii=False)
        return json2

    def insertToBasic(self, basic):
        lng_lat = self.check(basic.get("lng_lat"))
        name = self.check(basic.get("name"))
        address = self.check(basic.get("address"))
        telephone = self.check(basic.get("telephone"))
        img_url = self.check(basic.get("img_url"))
        price = self.check(basic.get("price"))
        uid = self.check(basic.get("uid"))
        sql = "insert into basic(lng_lat,name,address,telephone,\
            imgurl,price,uid) values('{0}','{1}','{2}','{3}','{4}','{5}',\
            '{6}')".format(
                lng_lat, name, address, telephone, img_url, price, uid
            )
        try:
            self.cursor.execute(sql)
        except Exception as e:
            print("insertToBasic插入失败",e)
        finally:
            self.close_cursor()  

    def check(self,data):
        try:
            data = tuple(data)[0].strip("'")
            return data
        except Exception as e:
            print("获取的数据转换错误!",e)
            return ""

    def insertToDetail(self,detail):
        uid=self.check(detail.get("uid"))
        detail_url=self.check(detail.get("detail_url"))
        level=self.check(detail.get("level"))
        overall_rating=self.check(detail.get("overall_rating"))
        service_rating=self.check(detail.get("service_rating"))
        hygiene_rating=self.check(detail.get("hygiene_rating"))
        facility_rating=self.check(detail.get("facility_rating"))
        hotel_facility=self.check(detail.get("hotel_facility"))
        hotel_service=self.check(detail.get("hotel_service"))
        inner_facility=self.check(detail.get("inner_facility"))
        create_time=detail.get("create_time")
        sql="insert into detail(uid,detail_url,level,overall_rating,service_rating,hygiene_rating,\
        facility_rating,hotel_facility,hotel_service,inner_facility,create_time)values('{0}','{1}','{2}','{3}','{4}','{5}',\
            '{6}','{7}','{8}','{9}','{10}')".format(uid,detail_url,level,overall_rating,service_rating,hygiene_rating,
            facility_rating,hotel_facility,hotel_service,inner_facility,create_time)
        try:
            self.cursor.execute(sql)
        except Exception as e:
            print("insertToDetail插入失败",e)
        finally:
            self.close_cursor()

    def insert(self,r):
        r=json.loads(r)
        r=r["result"]
        uid="".join(r.get("uid")),
        # 返回的是元组:detail_url:('http://api.map.baidu.com/place/detail?uid=\
        # ef1e99ad00360c7431f71d80&output=html&source=placeapi_v2',) 
        detail_url=self.checkError(r.get("detail_info").get("detail_url")),
        level=self.checkError(r.get("detail_info").get("level")),
        overall_rating=self.checkError(r.get("detail_info").get("overall_rating")),
        service_rating=self.checkError(r.get("detail_info").get("service_rating")),
        hygiene_rating=self.checkError(r.get("detail_info").get("hygiene_rating")),
        facility_rating=self.checkError(r.get("detail_info").get("facility_rating")),
        hotel_facility=self.checkError(r.get("detail_info").get("hotel_facility")),
        hotel_service=self.checkError(r.get("detail_info").get("hotel_service")),
        inner_facility=self.checkError(r.get("detail_info").get("inner_facility")),
        create_time=datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        p=self.checkError(r.get("location"))
        lng_lat=self.checkError(str(p.get("lng"))+","+str(p.get("lat"))),
        name=self.checkError(r.get("name")),
        address=self.checkError(r.get("address")),
        telephone=self.checkError(r.get("telephone")),

        # image_url未获取到
        img_url=self.checkError(image_url),
        price=self.checkError(r.get("detail_info").get("price")),
        # print("返回信息: ",lng_lat,name,address,telephone,img_url,price)
        try:
            self.saveToDetail_info(uid,detail_url,level,
            overall_rating,service_rating,hygiene_rating,facility_rating,
            hotel_facility,hotel_service,inner_facility,create_time)
            
            self.saveToBasic_info(lng_lat, name, address, telephone, img_url, price, uid)
        except Exception as e:
            print("插入数据失败!!!",e)
        

    def checkError(self,data):
        try:
            # print("传到checkError: ",type(data),data)
            return data
        except Exception as e:
            print("get数据出错:",e)
            return ""
        # return data if data is not None else None


    def getData(self,uid):
        url=settings.INFOURL
        ak=settings.BAIDUAK
        params = {
            "uid": uid,
            "scope": "2",
            "output": "json",
            "ak": ak,
        }
        headers = {"User-Agent": random.choice(settings.USERAGENTS)}
        r = requests.get(url=url, headers=headers, params=params).content
        return r


    def saveToBasic_info(self,lng_lat, name, address, telephone, img_url, price, uid):
        obj = {
            "lng_lat":lng_lat,
            "name":name,
            "address":address,
            "telephone":telephone,
            "img_url":img_url,
            "price":price,
            "uid":uid,
            }
        try:
            self.insertToBasic(obj)
        except Exception as e:
            print(e)


    def selectByUid(self,uid):
        try:
            return self.selectMessageByUid(uid)
        except Exception as e:
            print("连接MySQL错误: ", e)
            return None


    # 必须在saveToBasic_info之前插入
    def saveToDetail_info(self,
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

        obj = {
            "uid":uid,
            "detail_url":detail_url,
            "level":level,
            "overall_rating":overall_rating,
            "service_rating":service_rating,
            "hygiene_rating":hygiene_rating,
            "facility_rating":facility_rating,
            "hotel_facility":hotel_facility,
            "hotel_service":hotel_service,
            "inner_facility":inner_facility,
            "create_time":create_time,
            
        }
        
        try:
            self.insertToDetail(obj)
        except Exception as e:
            print(e)
