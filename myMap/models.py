from django.db import models,connection

# Create your models here.

# class Manager(models.Manager):
#     def __init__(self):
#         self.cursor = connection.cursor()

#     def selectMessageByUid(self,uid):
#         sql="select distinct * from basic_info a ,detail_info b\
#         where a.uid=b.uid and a.uid = '{0}'".format(uid);
#         self.cursor.execute(sql);
        # data=[row for row in self.cursor.fetchone()]
        # return None if data==[] else data
def selectMessageByUid(uid):
        with connection.cursor() as  cursor:
            sql="select distinct * from basic a ,detail b\
            where a.uid=b.uid and a.uid = '{0}'".format(uid);
            cursor.execute(sql);
            row=cursor.fetchone()
        return None if row == [] else row

    # def insertToBasic(self,**basic):
    #     lng_lat=basic.get("lng_lat");
    #     name=basic.get("name")
    #     address=basic.get("address")
    #     telephone=basic.get("telephone")
    #     img_url=basic.get("img_url")
    #     price=basic.get("price")
    #     uid=basic.get("uid")
    #     sql = "insert into basic_info(lng_lat,name,address,telephone\
    #     img_url,price,uid) values('{0}','{1}','{2}','{3}','{4}',{5},\
    #     '{6}')".format(lng_lat,name,address,telephone,img_url,price,uid)
    #     try:
    #         self.cursor.execute(sql)
    #     except Exception as identifier:
    #         pass


    # def insertToDetail(self,**detail):
    #     pass





# 酒店的基础信息
class BasicInfo(models.Model):
    lng_lat = models.CharField(max_length=60)
    name = models.CharField(max_length=60)
    address = models.CharField(max_length=60,blank=True)
    telephone = models.CharField(max_length=20,blank=True)
    img_url = models.URLField(blank=True)
    price = models.IntegerField(blank=True)
    uid = models.CharField(db_index=True,max_length=200)
    # objects=Manager()

# 详细信息 外键lng_lat参考Basic_info(lng_lat)
class detailInfo(models.Model):
    uid=models.CharField(primary_key=True,db_index=True,max_length=200)
    detail_url = models.URLField(blank=True)
    level = models.CharField(max_length=20,blank=True)
   
    overall_rating = models.CharField(max_length=10,blank=True)
    service_rating = models.CharField(max_length=10,blank=True)
    hygiene_rating = models.CharField(max_length=10,blank=True)
    facility_rating = models.CharField(max_length=10,blank=True)
    hotel_facility = models.CharField(max_length=300,blank=True)
    hotel_service = models.CharField(max_length=300,blank=True)
    inner_facility = models.CharField(max_length=400,blank=True)
    create_time = models.DateTimeField(auto_now=True,blank=True)
    # objects=Manager()
