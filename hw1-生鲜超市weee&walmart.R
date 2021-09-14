library(httr)
library(jsonlite)
#populority for weee:
response<-GET('https://newsapi.org/v2/everything?q=weee&apiKey=1f57d1259be64da082615c984571e087')
json_data<-rawToChar(response$content)
list_data<-fromJSON(json_data)
date<-list_data$articles$publishedAt
publisher<-list_data$articles$author
title<-list_data$articles$title

str(date)
weee<-data.frame(date,publisher,title,stringsAsFactors=FALSE)
str(weee)
head(weee)

write.csv(weee,'weee.csv')

#popularity for walmart root:
response<-GET('https://newsapi.org/v2/everything?q=walmart&apiKey=1f57d1259be64da082615c984571e087')
walmart_json<-rawToChar(response$content)
walmart_list<-fromJSON(walmart_json)
date<-walmart_list$articles$publishedAt
publisher<-walmart_list$articles$author
title<-walmart_list$articles$title

str(date)
walmart<-data.frame(date,publisher,title,stringsAsFactors=FALSE)
str(walmart)
head(walmart)
write.csv(walmart,'walmart.csv')






