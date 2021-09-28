#cleaning record, labeled data in R: both qualitative and quantiative data variable
library(ggplot2)
library(plotly)

dataset_Name<-"flight_info.csv"
flight_DF<-read.csv(dataset_Name,na.string=c("","")) ## the ns.string=c("") will turn blank into NA
head(flight_DF,n=15)
str(flight_DF)
## (as needed):
## Missing values/ Incorrect values/ Incorrect formats/ Incorrect data types/ Duplicates/ Outliers
##  STEP 1: Remove columns we do not need or want
## First - some basics..................
## Get c
(ColNames<-names(flight_DF))
ColNames[1] ## Access a column name
flight_DF[ColNames[1]] ## Access data in a column by name
for(name in 1:length(ColNames)){
  cat(ColNames[name],"\n")
}
NumColumnd<-ncol(flight_DF)
NumRow<-nrow(flight_DF)
## Let's make tables of all the columns
lapply(flight_DF,table)  
lapply(flight_DF,summary) ## Now we can use this to think about cleaning...
## Remove columns we do not want
## WAY 1: One way is by index - we want to remove column 1 here....
(flight_DF<-flight_DF[,-3])
(flight_DF<-flight_DF[,-3])
(flight_DF<-flight_DF[,-3])
(flight_DF<-flight_DF[,-3])
(flight_DF<-flight_DF[,-3])
(flight_DF<-flight_DF[,-3])
(flight_DF<-flight_DF[,-3])
(flight_DF<-flight_DF[,-3])
head(flight_DF)
## MISSING VALUES
## check the entire DF for missing values in total
head(is.na(flight_DF) ) ## This method is logical 
## Using an inline function and sapply (for simplify apply)
sapply(flight_DF, function(x) sum(is.na(x)))
str(flight_DF) # date_of_journey should be date, and airline should be char
flight_DF$Date_of_Journey<-as.character(flight_DF$Date_of_Journey)
flight_DF$Airline<-as.character(flight_DF$Airline)
str(flight_DF) 
table(flight_DF) #quik look: looks good. no missing value.
## mean, variance, etc.
summary(flight_DF) 
nrow(flight_DF) 


#Airline:
airline_before<-ggplot(flight_DF, 
                        aes(x=Airline, fill=Price)) + 
  geom_bar()+
  geom_text(stat='count',aes(label=..count..),vjust=2)+
  ggtitle("airline") 

  
airline_before 
#from this, we can see that this combine both ordinary and seceral business flights, to clean, we just retain the ordinary tickets.
#let's fix them to get a general ordinary overview.

#new_flight_DF <- flight_DF[!(flight_DF %in% c(5374,7353,9717,10366,659,2926)), ] 
new_flight_DF <- flight_DF[-c(5373,7352,9716,10365,658,2925,427,718,1800,4628,4719,5091,5490,5674,5837,6471,6592,6602,7658,8616,9250,9254),]
summary(new_flight_DF) 
new_flight_DF
airline_after<-ggplot(new_flight_DF,
                       aes(x=Airline, fill=Price)) + 
  geom_bar()+
  geom_text(stat='count',aes(label=..count..),vjust=2)+
  ggtitle("airline") 
airline_after # after-cleaned catergorical data （using R 

#using boxplot to check outliers:
#install.packages("ggstatsplot")
library(ggstatsplot)
boxplot(new_flight_DF$Price,
        ylab="e-ticket price") #we do have a significant outlier which price is around $50000/e-ticket

summary(new_flight_DF$Price)
sd(new_flight_DF$Price) 
Q<-quantile(new_flight_DF$Price,probs=c(0.25,0.75),na.rm=FALSE)
iqr<-IQR(new_flight_DF$Price)
up<-Q[2]+1.5*iqr#upper range
low<-Q[1]-1.5*iqr#lower range

new_flight_DF<- subset(new_flight_DF, new_flight_DF$Price > (Q[1] - 1.5*iqr) & new_flight_DF$Price < (Q[2]+1.5*iqr))

boxplot(new_flight_DF$Price,
        ylab="e-ticket price") 
summary(new_flight_DF$Price) #cleaned e-ticket price, looks good 
write.csv(new_flight_DF,"cleaned_flight_info.csv")





