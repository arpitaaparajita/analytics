#create Vector, DF
#Convert relevant column to factors
# summarise,plot,Filter,search
#store data in csv, Open csv in excel

#create Vectors

(gender= sample(c('M','F'),size=100, replace=T, prob=c(.7,.3)))
(spl= sample(c('Marketing','Finance','HR'),size=100, replace=T, prob=c(.4,.3,.3)))
(grades = sample(c('A','B','C','D'), size=100, replace=T, prob=c(.2,.4,.3,.1)))
(placement= sample(c('Yes','No'),size=100, replace=T, prob=c(.8,.2)))
(age=sample(c(21:30),size=100, replace=T))
(experience= rnorm(100,mean = 4,sd=1))

#create DF

df=data.frame(gender,spl,grades,placement,age,experience,stringsAsFactors = T)
head(df)

#create Factors
?factor

(gradesFactorOrderedLevels = factor(grades, ordered=T, levels=c('D','C','B','A'))) #Levels: D < C < B < A

#summarise
summary(df)
class(df); dim(df)
nrow(df) ; names(df) ;NROW(df)
colnames(df)
rownames(df)
students=df
#summarise the data in various ways using deplyr
library(dplyr)
students %>% group_by(placement,gender) %>% summarise(mean(experience),max(experience),min(experience),mean(age))
students %>% group_by(spl,gender) %>% summarise(max(experience))
students %>% filter(spl=='Marketing') %>% group_by(gender) %>%summarise(mean(experience))
students %>% filter(spl!='Marketing') %>% group_by(gender) %>%summarise(mean(experience))


#plots

hist(students$age)# continuous variables
(t1=table(students$placement))

barplot(t1, col=1:2)
boxplot(students$age)

pairs(students[,c('age','experience')])
pie(t1) #pie plot done on categories

par(mfrow=c(2,2)) #display is divided into 4 matrix, multiple frames in one row, column wise mcol
pie(table(students$gender))
pie(table(students$placement))
pie(table(students$grades))
pie(table(students$spl))
par(mfrow=c(1,1))

table(students$gender,students$placement, students$spl)

#read and write CSV
library(arules)
?write.csv
write.csv(students, file = "./Data/students_practise.csv")
students2=read.csv("./Data/students_practise.csv")
head(students2)

#Multiple linear regression can be done to check if grades and experience are significant for placement
#logistic Regression which are the variables significant for placement
#clustering can be done on numerical columns
km3 = kmeans(students[,c('age','experience')],centers = 3)
km3
km3$centers
plot(students[,c('age','experience')],col=km3$cluster)

#decision tree
library(rpart)
library(rpart.plot)

students3=read.csv("./Data/students_3.csv")
head(students3)
students3=students3[-1]

tree = rpart(placement~.,data=df)
rpart.plot(tree, nn=T, cex=.8)
printcp(tree) #should I prune or not
tree2=prune(tree,cp=0.05)
rpart.plot(tree2, nn=T, cex=.8)


#instead of pruning i like to see by taking 3 sample data if student is likely to get selected or not
ndata = sample_n(df,5)
ndata
predict(tree,newdata=ndata, type='class') # yes or no
predict(tree, newdata=ndata, type='prob') #probability of getting placed
#whether a particular person is going to get selected or not


#logisticregression, we are not able to predict as logistic regression is not coming significantly
logitmodel1=glm(placement~.,data=df,family = 'binomial')
summary(logitmodel1)
#as * is coming for grades
logitmodel2 = glm(placement~grades,data=df,family = 'binomial')
summary(logitmodel2)


#try to predict age wrt other columns
linear1 = lm(age~.,data=df)
summary(linear1)
#good linear model could not be found w.rt this data. we have to ignore this model and cannot predict on basis of this, output doesnt depend on any independent variable