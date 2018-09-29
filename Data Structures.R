#Data Structures in R

# CTRL+ENTER when you are in the line to execute

#Vectors----
x=1:10 #create sequence numbers from 1 to 10, press ctrl+enter to create
x  #print vector x
x1 <- 1:20 # another symbol to assign a vector oldest one but = is better
x1  #first assign then print

(x1=1:30)  # only do when you are learning, this will print while creating this replaces previous one

(x2=c(1,2,13,4,5))  #C means concatenatenate numeric type of vector
class(x2)

(x3=letters[1:10])
class(x3) #data type of vector variables

LETTERS[1:26] #letters will be shown or printed in capitals
(x3b = c('a',"Dhiraj","4"))
class(x3b) #all data type is same character
?c #Help will be displayed

(x4=c(T,FALSE,TRUE,T,F)) #status of people are married, system understands single T /F is true false
class(x4) #logicals

x5=c(3L,5L) # L is required  to convert from numeric to Integer, by default it takes numeric
class(x5)

(x5b = c(1,'a',T,4L))
class(x5b)

#access elements
(x6 = seq(0,100,by=3))
(x6b = seq(0,100,3))
?seq
methods(class='data.frame') #functions that can be used for these data type

ls() #access variables in my environment

x6
length(x6) #size
x6[3] #access 3rd element

#[1] 4
x6[c(2,4)]  # access 2nd and 4th element, R starts with 1
x6[-1]      # access all but 1st element
x6
x6[-c(1:10)]#removes first 10 elements
x6[-c(1:10,15:20)]
x6[c(2,-4)] # cannot mix positive and negative numbers
#Error in x6[c(2, -4)] : only 0's may be mixed with negative subscripts

x6[c(2.4,3.54)] #real numbers are truncated to integers

x6[-c(1,5,20)]
x6
length(x6)
x6[-(length(x6)-1)] #removes 2nd last number

(x7=c(x6,x2)) # create new vector by combining 2 vectors

#modify

x6
sort(x6)
sort(x6[-c(1,2)]) #remove 1st and 2nd and then sort
sort(x6, decreasing = T) #sort in descending order
rev(x6) # only reverse the sequence created

# create a sequence starting with -3 with interval of .2
seq(-3,10,by=.2)

(x= -3:2)
x[2] <- 0;x  #modify 2nd element
x<0 
x[x<0] = 5;x  #modify elements less than 0
x[x<= 1 & x>= -1] = 100;x

x=x[1:4];x #truncate x to first 4 elements

#delete vector

(x=seq(1.5,,length.out = 15))
#[1]  1.5  2.5  3.5  4.5  5.5  6.5  7.5  8.5  9.5 10.5 11.5 12.5 13.5 14.5 15.5
x=NULL
x
x[4]

x=rnorm(100)  #normal distribution 100 values with mean =0 and s.d=1
x
plot(density(x)) # as parameters are taken large the graph will become more normal
mean(x)

(x1=rnorm(1000,mean = 50,sd=5))
plot(density(x1)) #graphical representation of normal distribution
mean(x1)

(x2=rnorm(1000000,mean = 50, sd=5))
plot(density(x1))
abline(v=mean(x1),h=0.04) #line plotted through mean

#Matrices----

100:111
(m1=matrix(1:12,nrow = 4)) #row and columns should be multiple of number of elements
(m2 = matrix(1:12,ncol=3,byrow = T)) #first fill the rows
x=101:124
length(x)
matrix(x,ncol=6) #number of col is 6

class(m1) #[1] "matrix"
attributes(m1) # all the attributes will be displayed, dimension is 1 part
dim(m1) #dimensions, row and column
m1

#access elements of matrix
m1[1,2:3] #display 1st row and 2nd and 3rd column
m1[c(1,3),] #display 1st row and 3rd row
m1[,c(1,3)]
m1[,-c(1.3)]

paste("C","D",sep="-")
paste("C",1:100,sep="-")

(colnames(m1)=paste('C',1:3,sep=''))
m1
(rownames(m1)=paste('R',1:4,sep = ''))
m1
attributes(m1)

#vector to matrix
(m3=1:24)
dim(m3)=c(6,4) #create a vector
m3

rbind(m3,c(5,85,25,23))
cbind((m3,c(5,6,2,3,5,8,9)))
?cbind

colSums(m3); rowSums(m3)
colMeans(m3);rowMeans(m3)

t(m3) #transpose

?sweep
m1
sweep(m1,MARGIN = 1,STATS = c(2,3,4,5), FUN = "+") #rowwise
sweep(m1, MARGIN = 2, STATS = c(2,3,4), FUN = "*") #colwise

#addmargins
?addmargins
m1
addmargins(m1,margin = 1,sum) #colwise function
addmargins(m1,1,sd) #colwise function

addmargins(m1,2,mean) #rowwise function
addmargins(m1,c(1,2),mean) #row &col wise function

addmargins(m1,c(1,2),list(list(mean,sum,max),list(var,sd))) #row &col
#Arrays----

#Data Frame----
#different Data type

#create vectors to be combined into DF
(rollno =1:30)
(sname = paste('student',1:30,sep=''))
(gender= sample(c('M','F'),size=30, replace=T, prob=c(.7,.3))) #everytime it will be random
table(gender) #values
prop.table(table(gender)) #near to the probability

set.seed(1234)#same pattern
(g = sample(c('M','F'),size=30, replace=T, prob=c(.7,.3))) #everytime it will be random
table(g) #values
prop.table(table(g)) 

(marks=floor(rnorm(30,mean=50,sd=10)))
(marks2=ceiling(rnorm(30,40,5)))
(course = sample(c('BBA','MBA'), size=30, replace=T, prob=c(.5,.5)))
rollno; sname; gender
marks ; marks2; course

#create DF
df1 = data.frame(rollno,sname,gender,marks,marks2,course,stringsAsFactors = F) #do not want name to be a factor or category, keep as vectors
str(df1) #structure of dataframe
head(df1) #display 1st 6 rows
tail(df1) #display last 6 rows
head(df1,n=3) #3 rows

# columns accessed by $, Compulsory for columns to have name
# 

#Factors----
