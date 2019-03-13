import requests,re,json
url="http://map.baidu.com/detail?qt=ninf&uid=96bbc0fbf8b4c9eba1d23023"
# "(?<=<img src=\").*(?=\" class=\"head-img\"/>)" 
 
# c= requests.get(url).content.decode('unicode_escape')  
# # x = re.search("'(.*?)?ex_track=bd_ditu",c)
# x=json.loads(c)
# print(x.get("content")["ext"]["detail_info"]["image"])
# url="http://map.baidu.com/detail?qt=ninf&uid="
def getImageByUid(uid):
        c=json.loads(requests.get(url+uid).text)
        print(c)

        # ["ext"]["detail_info"]
        # return c["image"]
        # x=c["hotel_ori_info"]
        # return x[0].get("hotel_id").split("_")[1]
    

print(getImageByUid("7dc42c4a62e4a1649fec2b22"))
# print(type(type(1)))