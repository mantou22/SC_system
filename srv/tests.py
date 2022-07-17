from django.test import TestCase

# Create your tests here.

# 方法一
s = "i love mt i love python i love java"
a_list = s.split(" ") # 已空格作为分隔符，将其转换为列表,eg:['i', 'love', 'mt', 'i', 'love', 'python', 'i', 'love', 'java']
result = []
for a in a_list:
    result.append((a, a_list.count(a))) # s.split(" ").count(a)： 计算a_list中对应key的个数   eg： a_list 中i的个数为 3
print(result)
print(dict(result))

# 方法二， 你暂时没学，知识点：列表生成式
res = dict( [(i, s.split().count(i)) for i in s.split()] )
print(res)