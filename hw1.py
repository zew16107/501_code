#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Sep 13 12:02:34 2021

@author: wuzehui
"""
##Api key: 1f57d1259be64da082615c984571e087

import requests
import json
import re
import pandas as pd
import csv
from sklearn.feature_extraction.text import CountVectorizer


#test amazon's porpularity:
#url=enter
url='https://newsapi.org/v2/everything?q=amazon&from=2021&apiKey=1f57d1259be64da082615c984571e087'
news_api = '1f57d1259be64da082615c984571e087'
amazondata=requests.get(url).text
                      
print(type(amazondata))
amazondata2=json.loads(amazondata)
print (json.dumps(amazondata2,indent=5)) 
print(type(amazondata2))

output=open('amazon.csv','w',newline='')
writer=csv.writer(output) 
header=['publishedAt','author']
writer.writerow(header)


for series in amazondata2['articles']:
    print (series['publishedAt'],series['author'])   
    publishedAt=series['publishedAt']
    author=series['author']   
    row=[publishedAt,author]
    writer.writerow(row)
output.close() 


##test eBay:   
url='https://newsapi.org/v2/everything?q=eBay&from=2021&apiKey=1f57d1259be64da082615c984571e087'
news_api = '1f57d1259be64da082615c984571e087'
eBaydata=requests.get(url).text
                      
print(type(eBaydata))
eBaydata2=json.loads(eBaydata)
print (json.dumps(eBaydata2,indent=5))
print(type(eBaydata2))

output=open('eBay.csv','w',newline='')
writer=csv.writer(output) 
header=['publishedAt','author']
writer.writerow(header)

for series in eBaydata2['articles']:
    print (series['publishedAt'],series['author'])
    
    publishedAt=series['publishedAt']
    author=series['author']   
    row=[publishedAt,author]
    writer.writerow(row)
output.close() 

#test BestBuy:

url='https://newsapi.org/v2/everything?q=BestBuy&from=2021&apiKey=1f57d1259be64da082615c984571e087'
news_api = '1f57d1259be64da082615c984571e087'
BestBuydata=requests.get(url).text                  
BestBuydata2=json.loads(BestBuydata)

output=open('BestBuy.csv','w',newline='')
writer=csv.writer(output) 
header=['publishedAt','author']
writer.writerow(header)

for series in BestBuydata2['articles']:
    publishedAt=series['publishedAt']
    author=series['author']   
    row=[publishedAt,author]
    writer.writerow(row)
output.close() 




    
    



    






