#!/usr/bin/env python
# -*- coding: utf-8 -*-
# 真实、迅雷、QQ旋风下载地址之间的转换
import base64
import urllib
import re

__Author__ = "kingking"

''' 
原理: 
迅雷下载地址："thunder://"+Base64编码("AA"+"真实地址"+"ZZ") 
QQ旋风下载地址:"qqdl://"+Base64编码("真实地址") 
 '''
#############
# 常量定义区 #
#############
THUNDER_HEADER = "thunder://"
THUNDER_PREFIX = "AA"
THUNDER_SUFFIX = "ZZ"
QQ_HEADER = "qqdl://"
ERROR = "传入的URL有误，请检查！"


# 判断url是否有效
def checkUrl(func):
    def wrapper(url):
        if re.match(r"(http|https|ftp|ed2k|thunder|qqdl)://", url):
            return func(url)
        else:
            return ERROR

    return wrapper


def real2QQ(url):
    url = base64.b64encode(url.encode("utf-8"))
    url = QQ_HEADER + url.decode("utf-8")
    return url


def qq2Real(url):
    url = url[len(QQ_HEADER):]
    url = base64.b64decode(url.encode("utf-8"))
    url = url.decode("utf-8")
    return url


def real2Thunder(url):
    url = THUNDER_PREFIX + url + THUNDER_SUFFIX
    url = base64.b64encode(url.encode("utf-8"))
    url = THUNDER_HEADER + url.decode("utf-8")
    return url


def thunder2Real(url):
    realUrl = base64.b64decode(url[10:])
    return realUrl[2:-2].decode("gb2312")


async def qq2Thunder(url):
    return real2Thunder(qq2Real(url))


def thunder2QQ(url:str):
    return real2QQ(thunder2Real(url))

def getDaZheJson(keyword):
    import requests
    from pyquery import PyQuery as pq
    from selenium import webdriver
    brow = webdriver.Edge()

    url = "https://search.zhe800.com/search?keyword="

    headers = {
        "User-Agent": "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; QQBrowser/7.0.3698.400)",

    }

    brow.get(url+keyword)
    brow.execute_script("window.scrollTo(0, 1000)")
    print(type(brow.page_source))
    doc = pq(brow.page_source)
    names = doc(".con h3 a").items()
    prices = doc(".con h4 em").items()
    dict={i.attr('title'):j.text() for i,j in zip(names,prices)}
    print(dict)
    return dict




if __name__ == "__main__":
    # 测试用，SuperGirl第一季第2集下载地址：
    # url_1 = r'ed2k://|file|Supergirl.S01E02.720p.HDTV.X264-DIMENSION.mkv|947617048|5D430BBD720C13598D867C3424B50B8D|h=2AG3ZXRLCWNGC4K5WFNC4QOMVDSXWBBM|/'
    # url_2 = r'd2k://|file|Supergirl.S01E02.720p.HDTV.X264-DIMENSION.mkv|947617048|5D430BBD720C13598D867C3424B50B8D|h=2AG3ZXRLCWNGC4K5WFNC4QOMVDSXWBBM|/'
    # print(real2QQ(url_1))
    # print(thunder2QQ(real2Thunder(url_1)))
    # print(real2QQ(url_2))
    # url = "thunder://QUFlZDJrOi8vfGZpbGV8ob53d3cua2FuODQubmV0ob+2vtK6o7rWwsP8yti7pNXfLs3q1fuw5i4xMDgwcC5CRNbQ06LLq9fWLm1wNHwyOTM3NDMwNTQwfDVCNjFGNjQwMzczQ0Q1MjEzMjM0NDI4QzhCMEEyODg1fGg9U1VTNFdLNTVUS1RDWE5KWkc1U01VREs2QTVPSFRaRlF8L1pa"
    # print(thunder2Real(url))
    getDaZheJson("杯子")

