#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Sep 28 11:27:13 2021

@author: wuzehui
"""

import pandas as pd
import re
from sklearn.feature_extraction.text import CountVectorizer

myfile=pd.read_csv("reviews_lists.csv")


data=myfile['customer_reviews']
li=list()
for i in range(len(data)):
    li.append(str(data.loc[i]))

vc=CountVectorizer(li,stop_words='english')
vector=vc.fit_transform(li)

value=vector.toarray()
dataframe=pd.DataFrame(columns=vc.get_feature_names(),data=value)
print(dataframe)
dataframe.to_csv('cleaned_cv.csv') 


