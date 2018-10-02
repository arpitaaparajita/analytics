# xts  - create object and export data
library(xts)
#create matrix : 1 col for 1 share
(stockprices = matrix(c(100,103, 105, 205, 210, 207, 530, 500, 535), ncol=3, byrow = F))
(cdtindex = c('25-09-2018', '27-09-2018', '28-09-2018'))
#convert to date format
(dtindex = as.Date(cdtindex, format="%d-%m-%Y"))
#now we have index + matrix for xts object

(ts_xts = xts(x=stockprices, order.by=dtindex))
#this series is not continuous but has missing dates

#-----
#matrix data extract
coredata(ts_xts)
#extract dates
index(ts_xts)


#write to csv file
write.zoo(ts_xts, "./data/zoodata.csv")


#multivariate Time Series data is created

(stockdata=ceiling(rnorm(90,mean=400,sd=30)))

(stockprices = matrix(stockdata, ncol=3, byrow = F))
(dtindex=as.Date('2018-09-01') + seq(0,29,1)) #create data sequentially
(ts_xts2=xts(x=stockprices,order.by = dtindex))
?colnames
colnames(ts_xts2)=c('PNB','SBI','ICICI')
ts_xts2

#matrix data extract
coredata(ts_xts2)
#extract dates
index(ts_xts2)
write.zoo(ts_xts2, "./Data/MVTS_stockdata.csv")

