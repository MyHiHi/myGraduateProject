from django.test import TestCase

# Create your tests here.

import pdb

# p = [12,2]噼噼啪啪铺铺铺铺
# for i in map(p,[1,3]):
#     print(i)
# from pyquery import PyQuery as pq
# doc = pq(url="https://blog.csdn.net/u012195214/article/details/78889602",header={"User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0"})
#
# listr = []
# i=21
# while i<56:
#     p = doc("#content_views > p:nth-child({0})".format(i))
#     i+=1
#     c = p.text().split('\n')
#     if (len(c)>1):
#         a = c[-1].split(":")
#         if len(a)>1 and  a is not '\n':
#             # print(a)
#             listr.append({a[0]:a[1].strip()})
#             # print(listr)
#     # print()
#     # f = p.text().split('\n')[-1].split(":")
#     # dict[f[0]]= f[-1]
# print(listr)


# 3.0617892742156982
# def f(n):
#     a,b=1,1
#     for i in range(n):
#         yield a
#         a,b = b,a+b
# import time
# time1 = time.time()
# n=10000
# for i in f(n):
#     print(str(i)+"\n")

# a,b=1,1
# for i in range(n):
#     print(str(a)+"\n")
#     a,b=b,a+b

# print(time.time()-time1)

# from functools import wraps, reduce


# class login(object):
#     def __init__(self):
#         pass

#     def __call__(self, func):
#         @wraps(func)
#         def wrapp(*args, **kwargs):
#             print(func.__name__ + "was called")
#             num = args[0]
#             # print(num)
#             a, b = 1, 1
#             for i in range(num):
#                 print(a)
#                 a, b = b, a + b
#             func(*args, **kwargs)
#             self.notify(*args, **kwargs)

#         return wrapp

#     def notify(self, *args, **kwargs):
#         print("{0[0]}号 执行 {0[1]}".format(args))


# def login(func):
#     @wraps(func)
#     def wrap(*args,**kwargs):
#         print(func.__name__+" was called")
#         func(*args,**kwargs)
#         print("over !")
#     return wrap
# @login()
# def first(n,operate):
#     print(reduce(lambda x,y:x*y,range(1,n)))

# first(20,"计算")

# p=[-12,23,-33,45]
# for i in filter(lambda x:x<0,p):
#     print(str(i)+"sdsd")

p = list(map(lambda x: "http://www.pp?c={0}&p=12".format(x), range(10, 40)))
# for i in
# print(p)

# ppppp

# def ep():
#     name="Mike"
#     age = 12;
#     return name,age
# # print(ep())

# def exm(num,target=[]):
#     target+=[num]
#     return target

# print(exm(243))

# print(exm(2))

# class exm(object):
#     __slots__ = ["num1","num2"];
#     def __init__(self,a,b):
#         self.num1 = a;
#         self.num2 = b;

# p = exm(12,23)
# print(p.num1)

# c = p;
# c.num1 = 11;
# print(p.num1)

from collections import defaultdict, Counter

my_dict = defaultdict(list)
other_dict = {}
# other_dict["name"]="huaer"
# # my_dict
# print(other_dict)
my_dict["am"] = "huaty"
# print(my_dict["pp"])
# print(other_dict["age"])

# some_dict = {}
# some_dict['colours']['favourite'] = "yellow"

# print(my_dict)

# with open("./admin.py","rb") as f:
#     print(Counter(f))

import os

# print(os.path.isfile("./tests.py"))


# def grep(pattern):
#     while True:
#         line = (yield)
#         if pattern in line:
#             print("{0} in {1}".format(pattern, line))


# p = grep("ok")
# next(p)
# i = 1
# while True:
#     p.send(input("input{}:\n".format(i)))
#     i += 1

# from functools import lru_cache
# import time

# r = time.time()
# @lru_cache(maxsize=22)
# # 缓存频繁返回值
# def fid(n):
#     if n < 2:
#         return n;
#     else:
#         return fid(n - 1) + fid(n - 2)
# print([fid(n) for n in range(100)],"\n",time.time()-r)
# fid.cache_clear()

# from functools import wraps
# def memorize(func):
#     mem={}
#     @wraps(func)
#     def wrapper(*args):
#         if args in mem:
#             return mem[args]
#         else:
#             mem[args]=func(*args)
#             return mem[args]
#     return wrapper

# @memorize
# def fib(n):
#     return n if n<2 else fib(n-1)+fib(n-2)

# print([fib(n) for n in range(100)])

# class File(object):
#     def __init__(self,file_name,method):
#         self.file_obj=open(file_name,method);
#     def __enter__(self):
#         print("entered!")
#         return self.file_obj
#     def __exit__(self,type,value,traceback):
#         print("error occurs")
#         self.file_obj.close()
#         return True

# with File("rr.txt","r") as opened_file:
#     c = opened_file.reads()

cookies = """
_fid:a9425451-db56-4ba5-8b88-713fb95042f9
anti_token:BA9C5EB2-0BFA-4F81-8E56-112A82122800
com.eLong.CommonService.OrderFromCookieInfo:Orderfromtype=1&Parentid=50000&Status=1&Cookiesdays=0&Coefficient=0.0&Pkid=50&Priority=8000&Isusefparam=0&Makecomefrom=0&Savecookies=0
CookieGuid:	a9425451-db56-4ba5-8b88-713fb95042f9
Esid:85eb852b-1892-4add-bbd5-dfa83cecc92c
ext_param:bns=4&ct=3
fv:pcweb
s_cc:true
s_sq:[[B]]
s_visit:1
SessionGuid:024b0cc0-4a9a-48fa-9c06-e40bd5562ec2
SHBrowseHotel:cn=40101009,,,,,,;40101131,,,,,,;90050071,,,,,,;&
ShHotel:InDate=2019-02-16&OutDate=2019-02-17
"""

# v = cookies.split("\n")
# my_cookie = {}
# for i in v:
#     c = i.split(":")
#     if len(c) > 1:
#         my_cookie[c[0]] = c[1]
# print(my_cookie)

# import requests

# url = "http://hotel.elong.com/"
# r = requests.get(url=url,cookies=my_cookie)
# print(r.text)

# print(list((("aaa",))))

# from models import Basic
# BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
# print(BASE_DIR)
# print(Basic.objects)

import requests
# url="http://api.map.baidu.com/telematics/v3/weather?location=保定&output=json&ak=dGa3ZcGGEdYLqdwuj4In9PNDtdC3BQ8W"
# url="http://api.map.baidu.com/telematics/v3/weather?location=北京&output=json&ak=E4805d16520de693a3fe707cdc962045"
# c=requests.get(url)
# print(c.content.decode("utf-8"))

# url="https://www.tubeninja.net/zh-hans/?url=https%3A%2F%2Fwww.pornhub.com%2Fview_video.php%3Fviewkey%3Dph599cbc4665dc7"
from selenium import webdriver

url="http://www.baidu.com"
c = webdriver.Chrome()
c.get(url)
from time import sleep  
# sleep(5)
print(c.page_source)