
import requests
# url = "http://map.baidu.com/detail?qt=ninf&uid=d5d2b3792d200e366cc02ce5&detail=hotel"


headers={
   "Accept": "*/*",
   "Accept-Encoding": "gzip, deflate",
   "Accept-Language": "zh-CN",
  "Cache-Control": "no-cache",
   "Connection": "Keep-Alive",
   "DNT": "1",
   "Host": "map.baidu.com",
   "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134"
}
from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from selenium.webdriver.common.action_chains import ActionChains

url = 'http://map.baidu.com/detail?qt=ninf&uid=b787fc4be7a98c899fec2bd2&detail=hotel'
#设置浏览器的请求头及一些参数
dcap = dict(DesiredCapabilities.PHANTOMJS)
dcap["phantomjs.page.settings.userAgent"] = "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.221 Safari/537.36 SE 2.X MetaSr 1.0"
#不加载图片
# dcap["phantomjs.page.settings.loadImages"] = False
path="D:\software\python3.7\phantomjs-2.1.1-windows\\bin\phantomjs"
from time import sleep

driver = webdriver.PhantomJS(desired_capabilities = dcap)
driver.get(url)
js = "var q=document.documentElement.scrollTop=10000"
driver.execute_script(js)
# sleep(9)
driver.switch_to.frame("qunarIframe")
# driver.implicitly_wait(2)
print(driver.page_source)
# with open("1.txt","wb") as f:
#     f.write(driver.page_source.encode("gbk","ignore"))
#     print("ok")
# print(driver.get_cookie)

# c = requests.get(url,headers = headers).content
# print(c.decode('utf-8'))
# from selenium import webdriver
# bro = webdriver.Firefox()
# bro.get(url)
# from time import sleep
# # sleep(10)
# print(bro.page_source)
# with open("1.txt","w+") as f:
#     f.write(bro.page_source)

# import requests
# s = requests.Session()
# headers  = {}

# headers['Accept'] = 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8'
# headers['Accept-Encoding'] = 'gzip, deflate, sdch'
# headers['Accept-Language'] = 'zh-CN,zh;q=0.8'
# headers['Cache-Control'] = 'max-age=0'
# headers['Connection'] = 'keep-alive'
# headers['Upgrade-Insecure-Requests'] = '1'
# headers['User-Agent'] = 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36'
# headers['Host'] = 'hr.tencent.com'
# s .headers = headers
# scont = s.get('http://hr.tencent.com/position.php?&start=0#a')
# cont = scont.content.decode('utf-8')
# print(cont)
# print(scont.url)
# print(scont.status_code)

