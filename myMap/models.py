from django.db import models, connection



# Create your models here.




# 酒店的基础信息
class Basic(models.Model):
    lng_lat = models.CharField(max_length=60)
    name = models.CharField(max_length=60)
    address = models.CharField(max_length=60, blank=True)
    telephone = models.CharField(max_length=20, blank=True)
    img_url = models.CharField(max_length=30,blank=True)
    price = models.CharField(max_length=10, blank=True)
    uid = models.CharField(db_index=True, max_length=200)
    # objects=Manager()
    # objects = models.Manager()
    class Meta:
        db_table="basic"



# 详细信息 外键lng_lat参考Basic_info(lng_lat)
class Detail(models.Model):
    uid = models.CharField(primary_key=True, db_index=True, max_length=200)
    detail_url = models.URLField(blank=True)
    level = models.CharField(max_length=20, blank=True)
    overall_rating = models.CharField(max_length=10, blank=True)
    service_rating = models.CharField(max_length=10, blank=True)
    hygiene_rating = models.CharField(max_length=10, blank=True)
    facility_rating = models.CharField(max_length=10, blank=True)
    hotel_facility = models.CharField(max_length=300, blank=True)
    hotel_service = models.CharField(max_length=300, blank=True)
    inner_facility = models.CharField(max_length=400, blank=True)
    create_time = models.DateTimeField(auto_now=True, blank=True)
    # objects=Manager()
    class Meta:
        db_table="detail"
