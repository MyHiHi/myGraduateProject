import requests
from pyquery import PyQuery as pq
 
path = "http://www.wendangku.net"
first = "/doc/dccf89254693daef5ff73d3e.html"
doc  = pq(requests.get(path+first).text)
f = doc(".next")
while f != None:
    try:
        s=""
        for i in doc("#contents p").items():
            s+=i.text()
        with open("E:\实习\模板日志.doc","w+") as f:
            f.write("\n"+s)
            print("ok")
        
        doc = pq(requests.get(path+f.attr("href")).text)
        f = doc(".next")
    except Exception as e:
        print("over")
    