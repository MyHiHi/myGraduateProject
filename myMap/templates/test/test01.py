import pandas as pd
import jieba
from imageio import imread
from wordcloud import WordCloud
import matplotlib.pyplot as plt
# from mat
f = pd.read_csv("D:\\lagou_jobs.csv", encoding="utf-8")["职位名"]
# print(f.describe())
# print(f)
def get_word(f):             
        import re
        text=""
        p=re.findall("'(.*?)'",f)
        for i in p:
                text+=i
        # return text
        return f

def paint_wordcloud():
        label_str=""
        for line in f:
                label_str+=get_word(line)
        print(label_str)
        cut_text="".join(jieba.cut(label_str))
        word_cloud=WordCloud(
                font_path='simhei.ttf',
                background_color='white',
                mask=imread("D:\\Documents\\Pictures\\cloud.png"),
                max_words=1000,
                max_font_size=100
        ).generate(cut_text)
        word_cloud.to_file('D:\\Documents\\Pictures\\word_cloud.jpg')
        plt.imshow(word_cloud)
        plt.axis('off')
        plt.show()

# class TestMe(object):
#         __instance=None
#         def __init__(self,name,age,names={}):
#                 names[name]=age;
#                 print("names: ",names)
#         def __str__(self):
#                 return "MMMMM "
#         def __new__(cls,name,age,names={}):
#                 if not cls.__instance:
#                         cls.__instance=object.__new__(cls)
#                 return cls.__instance
# name=[11]
# def test(s):
#         name[:].append(s)

if __name__=="__main__":                
        # paint_wordcloud()
        # p1=TestMe("信息",11)
        # p2=TestMe("密码",22)
        # print(id(p1),id(p2))
        # print(p1,p2)
        # test(112);
        # print(name)

        
        

        
