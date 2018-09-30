# Combined Plots

#plot, histogram, pie, boxplot, linechart, correlation plot


#plot
women
plot(women) #default is points
plot(women, type='p', pch=19) #check pch from net
plot(women, type='l')
plot(women, type='b', pch=18, lty=2, col=2)
plot(women, type='b', pch=18, lty=2, col='red')
plot(women, xlim=c(30,100), ylim=c(min(women$weight)-10, 200), pch=10)

#more features with plot
plot(x=women$weight, y=women$height, pch=15, xlab='Weight', ylab='Height', col='red', cex=2, type='b')
title(main='Main Title', sub='Sub Title') #cex magnify plotting symbol, type is both, main title and sub title
#see cheat sheet on base graphs

plot(women)
abline(lm(women$weight ~ women$height), col='red', lty=2, lwd=4) #line of base fit


#boxplot
boxplot(women$height)
abline(h=c(58, 62,65,68,72))

#draw lines on plot for number summary
summary(women)
quantile(women$height)
quantile(women$height,seq(0,1,.1)) #decile or value at every 10% interval
quantile(women$height,seq(0,1,.01)) # percentile is calculated
stem(women$height) #stem stats


boxplot(women$height, col='green')
abline(h=quantile(women$height))
text(1+.2, quantile(women$height), labels=c('min','1Q','median','3Q','max'))

#histogram
hist(women$height)
hist(women$height, breaks=10)
hist(women$height, breaks=5, col=1:5)

#histogram2
(x = rnorm(100,50,10))
hist(x)

hist(x, freq=F, col=1:5)
lines(density(x))

#density plot : shape of data
plot(density(x), col='red') #only graph without histogram

#pie
gender
table(gender)
pie(table(gender))
x = c(10,20,40,50)
pie(x)
xlabels = c('A','B','C','D')
pie(x, labels=xlabels)
x/sum(x)
(xlabels2=paste(xlabels,round(x/sum(x),2)*100,sep='-')) #plotting the percentage
pie(x, labels=xlabels2)
x
#barplot ... barplot is better to compare proportion or height
barplot(x,col=1:4)
barplot(x,col=1:4, horiz = T)

#correlation plot
pairs(women)
cor(women$height,women$weight) #corelation is b/w 0and 1, direction and strength of relationship
cov(women$height,women$weight) #covariance says the direction of relationship +ve or -ve

head(mtcars)
?mtcars

cor(mtcars)
names(mtcars)
pairs(mtcars)
pairs(mtcars[1:4])
options(digits=4)

pairs(mtcars[c('mpg','wt','hp')]) #only 3 columns to be compared
