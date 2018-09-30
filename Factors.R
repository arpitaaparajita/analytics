(grades=sample(c('A','B','C','D'),size = 30,replace = T, prob = c(0.4,0.2,0.3,0.1)))
?factor
(gradesF=factor(grades))

summary(grades) #only length is got
summary(gradesF)

?table
table(grades) #counting the unique values even if it is not factor
table(gradesF)

class(gradesF) #its only nominal data not ordered

(gradesFO=factor(grades,ordered=T)) #Levels: A < B < C < D

(gradesFO1=factor(grades,ordered=T,levels = c('B','C','A','D'))) #Levels: B < C < A < D
summary(gradesFO1)

(marks=ceiling(rnorm(30,mean = 60, sd=5)))
(gender = factor(sample(c('M','F'),size=30,replace=T)))
(student1 = data.frame(marks,gender,gradesFO1))
boxplot(marks~gradesFO1,data=student1)
boxplot(marks~gradesFO1+gender,data=student1)

boxplot(marks)
summary(marks)  
abline(h=summary(marks))
quantile(marks)
