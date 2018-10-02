#Time Series - SMA

#MA
#https://www.rdocumentation.org/packages/forecast/versions/8.4/topics/ma
head(wineind)
class(wineind)
wineind
str(wineind)
plot(wineind)
sm <- ma(wineind,order=3,centre = T)
sm
lines(sm,col="red")
?ma
smF<-ma(wineind,order=3,centre = F)
head(smF)
head(sm)
head(wineind,n=3)
head(sm,n=3)
sum(head(wineind,n=3))/3 # process to determine the moving average


#centered
x = ts(runif(25,50,80))
x
forecast::ma(x, order=2, centre=T)

plot(wineind)
csm <- ma(wineind,order=12, centre=T)
lines(csm,col="red")



#method1
#https://rpubs.com/ajaydecis/ts5
kings <- scan("http://robjhyndman.com/tsdldata/misc/kings.dat",skip=3) #load data from url
kings
kingstimeseries <- ts(kings) # convert into timeseries object, by default yearly data
kingstimeseries
plot.ts(kingstimeseries)
#install.packages("TTR")
library("TTR")
(kingstimeseriesSMA8 <- SMA(kingstimeseries,n=8))
?SMA
plot.ts(kingstimeseriesSMA8)

library(forecast)
fit <- HoltWinters(kingstimeseries, beta=FALSE, gamma=FALSE)

fit1<- ets(kingstimeseries) #exponential smoothing, forecasting is done
forecast(fit, 3)
plot(forecast(fit, 3)) 
forecast(fit1, 3)
plot(forecast(fit1, 3)) 




#Method2
#https://cran.r-project.org/web/packages/smooth/vignettes/sma.html
require(smooth)
require(Mcomp)
sma(M3$N2457$x, h=18, silent=FALSE)
sma(M3$N2568$x, h=18)