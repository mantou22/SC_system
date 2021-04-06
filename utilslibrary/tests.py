from django.test import TestCase
import re
import xlrd
from itertools import groupby
from collections import Counter
from tooling.service.create_folder_service import create_folder
# from tooling.models import Product_Info
# Create your tests here.

def f1(a,b,c=0,*d,**e):
    print('a=', a, 'b=', b, 'c=', c, 'd=', d, 'e=', e)

if __name__ == "__main__":
    s = '001'
    l = re.findall(r'^(?!000)\d{3}$', s)
    print(l)
#     layers = '(([DB2]L51;0+[DB3]L51;2)+L51;3)'
#     l = re.findall(r'\[\w+\]?L\d+;\d+', layers)
#     print(l)
#     ll = re.findall(r'\d+;\d+', layers)
#     print(ll)
#     lll = re.findall(r'\[(\w+)?\]\w51;0',layers)
#     print(lll)
#     x = re.findall(r'\[\w+\]', layers)
#     print(x)
#     llll = re.findall(r'\[\w+\]\w(\d+;\d+)', layers)
#     print(llll)
#     s = ''
#     s += 'tets|'
#     print(s)
#     list = [1,1,1,2,2,2,2,3,3]
#     result = Counter(list)
#     print(result)
#     f1(1,2)
#     f1(1,2,3)
#     list = [4]
#     f1(1,2,3,*list)
#     f1(1,2,3,4,x=5)
#     f1(1,2,3,4,x=5,y=6,z=7)
#     create_folder('B001')