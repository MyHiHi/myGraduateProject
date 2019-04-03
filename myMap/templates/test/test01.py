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

if __name__=="__main__":
        paint_wordcloud()
        

        
