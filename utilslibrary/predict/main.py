#!/usr/bin/python
# -*- coding: UTF-8 -*-

import pandas as pd

# def readFile(path):
#     with open(path, 'r', encoding="utf8") as f:
#         # 去掉换行
#         # 每一行去掉空格、换行
#         lines = []
#         for line in f.readlines():
#             if line != '\n':
#                 lines.append(line.strip())
#         return ''.join(lines)

# path = "word.txt"
# word = readFile(path)


feature = {}


def totalWords(word):
    return sum([len(w) for w in word.split()])


def totalNumOfWords(word):
    return len(list(set(word)))


import os

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
print(BASE_DIR)
cibiao_path = os.path.join(BASE_DIR, "cibiao.xlsx")
writing_path = os.path.join(BASE_DIR, "writtenCorpus.xlsx")

primaryCorpus = [word[0] for word in pd.read_excel(cibiao_path, sheet_name="一二级").values.reshape(-1, 1)]
midCorpus = [word[0] for word in pd.read_excel(cibiao_path, sheet_name="三四级").values.reshape(-1, 1)]
highCorpus = [word[0] for word in pd.read_excel(cibiao_path, sheet_name="五六级").values.reshape(-1, 1)]
overCorpus = [word[0] for word in pd.read_excel(cibiao_path, sheet_name = "七至九级").values.reshape(-1,1)]


def totalWord(corpus, word):
    totalWordNums = 0
    totalWords = 0
    for key in corpus:
        cnt = word.count(key)
        totalWords += cnt
        if cnt > 0:
            totalWordNums += 1
    return totalWords, totalWordNums


def titlePhrase(word):
    word1 = word.count('。')
    word2 = word.count('？')
    word3 = word.count('：')
    word4 = word.count('，')
    word5 = word.count('；')
    word6 = word.count('！')
    return word1 + word2 + word3 + word4 + word5 + word6


def totalKeyWord(word):
    primaryWords = totalWord(primaryCorpus, word)[1]
    midWords = totalWord(midCorpus, word)[1]
    highWords = totalWord(highCorpus, word)[1]
    overWords = totalWord(overCorpus, word)[1]
    return primaryWords + midWords + highWords + overWords


def getConnWord():
    connCorpus = r'和、跟、与、同、及、而、况、况且、何况、乃至、 则、乃、就、而且、于是、至于、说到、此外、终于、果然、言归正传、这就是说、相比之下、总的看来、由此可见、综上所述、总之、仁者见仁、智者见智、像、如、一般、比方、却、但、但是、可、可是、然而、偏偏、只是、不过、至于、致、不料、岂知、原来、因为、由于、以便、因此、所以、是故、以致、或、抑、非…即、不是…就是、 若、如果、若是、假如、假使、倘若、要是、譬如、好比、如同、似乎、于是、不如、不及、因为…所以…、之所以…是因为…、与其…不如…、若…则…、虽然…但是…、不但…而且…、虽然、固然、尽管、纵然、即使、除此以外、并、并且、可惜、要是、而后、反而、从而、因而、不然、不管、不顾、甭管、既然、仍然、依然、第一、第二、第三、第四、第五、第六、第七、第八、第九、第十、首先、其次、再次、最后、不久、随后、接着、在那之后、后来、即便、反正、反之、否则、不论、无论、就算、其实、同时、一旦、另外、万一、其实不然、既然如此、无论如何、除此之外、既…又…、不但不…反而…、和…一样、不是…就是…、一…就…、不管…仍然'
    connCorpus = connCorpus.replace('、', ' ')
    connCorpus = connCorpus.replace('…', ' ')
    connCorpus = connCorpus.split()
    return connCorpus


def getConnNums(connCorpus, word):
    cnt = 0
    for key in connCorpus:
        if key in word:
            cnt += 1
    return cnt


# 书面语总次数
def getWrittenNums(writtenCorpus, word):
    cnt = 0
    for key in writtenCorpus:
        cnt += word.count(key)
    return cnt


def getFeatures(word):
    feature = {}
    connCorpus = getConnWord()
    feature["文章分句数"] = titlePhrase(word)
    feature["词的总个数"] = totalKeyWord(word)
    feature["连接词语个数"] = getConnNums(connCorpus, word)
    feature["最常用词总次数"] = totalWord(primaryCorpus, word)[0]
    feature["最常用词总个数"] = totalWord(primaryCorpus, word)[1]
    feature["较常用词总次数"] = totalWord(midCorpus, word)[0]
    feature["较常用词总个数"] = totalWord(midCorpus, word)[1]
    feature["次常用词总次数"] = totalWord(highCorpus, word)[0]
    feature["次常用词总个数"] = totalWord(highCorpus, word)[1]
    feature["非常用词总次数"] = totalWord(overCorpus, word)[0]
    feature["非常用词总个数"] = totalWord(overCorpus, word)[1]
    writtenCorpus = [word[0] for word in pd.read_excel(writing_path).values]
    feature["书面语总数"] = getWrittenNums(writtenCorpus, word)
    feature["总字数"] = totalWords(word)
    feature["字的总个数"] = totalNumOfWords(word)
    return feature


word = '''
在九十年代的今天，物質上的丰富、文化上的改变和电腦世界的今天，每一層次都一直的在變化。
现在的社会里温情和親情何处尋？随著社会的进步和思想上的不合，覌念不同，两代人（指的是父母与子女）之間相处不好也溝成了一个“社会”的通病
要如何的来彌補和解决呢？在这里我有我本身自己的一些看法。
人是合群的動物从小就受到父母親的疼爱，所以要从“爱”着手凡事体量，处处为对方着想猶其是年老的父母親，对兒女的養育之恩。爱的做法要从那一个方面来实行呢？应该从小的时候就开始，做父母的要给兒女们留下一个好的印象様式，从起居方面到留意周围的事故，来促进兒女们从小就該学习習的一个好榜样課程。
時间也是一个主流？为什么呢？为了要去了解对方，必须花上你的精神时间来餋育的。今天社会的通病就是把年老的父母親隔在一边可曾知道他們内心里的痛苦吗？交流要時间去了解更要花上代价，成年人的看法，价值观念，生活态度以及更多的方式不同了？为了能多奌在代沟上花事间来知道如何的能有一个共同的奌出發点，代溝的问题也已经解决一半了。人生在世几时年何必为了一奌小事而不樂呢，有生一年就应該尽己所能来给父母亲親也个快樂的晚年
'''


def get_score(word):
    feature = getFeatures(word)
  #  rule1 = 40.648 + feature.get("字的总个数") * 0.108 + feature.get("总字数") * 0.051 - feature.get(
   #     "初等词总个数") * 0.108 + feature.get("文章短句数") * 0.160 + feature.get("高等词总个数") * 0.234
    rule1 = 42.417 + feature.get("字的总个数")*0.097 + feature.get("总字数")*0.075 - feature.get("最常用词总次数")*0.076  - feature.get("文章分句数")*0.143  + feature.get("次常用词总个数")*0.211 - feature.get("较常用级词总个数")*0.114
    rule2 = 39.417 + feature.get("字的总个数")*0.092 + feature.get("总字数")*0.051 - feature.get("最常用词总个数")*0.108  + feature.get("文章分句数")*0.153  + feature.get("次常用词总个数")*0.224
    rule3 = 40.604 + feature.get("字的总个数")*0.083 + feature.get("次常用词总个数")*0.159 - feature.get("总字数")*0.016  - feature.get("最常用词总个数")*0.124  + feature.get("词的总个数")*0.101 + feature.get("连接词语个数")*0.017 + feature.get("文章分句数")*0.052
    rule4 = 42.733 + feature.get("字的总个数")*0.099 + feature.get("总字数")*0.099 - feature.get("文章分句数")*0.206  - feature.get("最常用词总次数")*0.104  - feature.get("较常用词的次数")*0.144  + feature.get("次常用词总个数")*0.221
    rule5 = 39.641 + feature.get("字的总个数")*0.093 + feature.get("总字数")*0.077 + feature.get("次常用词总次数")*0.091  - feature.get("最常用词总次数")*0.074  - feature.get("文章分句数")*0.123  - feature.get("较常用级词总次数")*0.100  + feature.get("书面词语总数")*0.114
    rule6 = 42.234 + feature.get("字的总个数")*0.048 + feature.get("较常用词总个数")*0.132 + feature.get("次常用词总个数")*0.468  + feature.get("总字数")*0.017  + feature.get("连接词语个数")*0.146  + feature.get("非常用词总次数")*0.124  + feature.get("文章分句数")*0.052
    rule7 = 39.261 + feature.get("字的总个数")*0.092 + feature.get("总字数")*0.095 - feature.get("最常用词总个数")*0.101 - feature.get("文章分句数")*0.181 - feature.get("较常用词总个数")*0.107 + feature.get("连接词语个数")*0.189
    rule = (rule1 + rule2 + rule3 + rule4 + rule5 + rule6 + rule7) / 7
    if rule >= 98:
        rule = 98
    return rule


if __name__ == "__main__":
    BASE_DIR = os.path.dirname(os.path.abspath(__file__))
    print(BASE_DIR)
    cibiao_path = os.path.join(BASE_DIR, "cibiao.xlsx")
    writing_path = os.path.join(BASE_DIR, "writtenCorpus.xlsx")
    print(cibiao_path)
    print(writing_path)
