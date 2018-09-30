#data analysis using deplyr - 1h-dplyr.R

library(dplyr) #load the library after installing package
?mtcars #understand your data set
dplyr::filter(mtcars,mpg>25 & am==1) #you want the function of only deplyr so use ::
filter(mtcars,mpg>25 & am==1) #dataset and then condition

mtcars %>% filter(mpg>25 & am==1) #piping step by step
mtcars %>% filter(mpg>25 & am==1) %>% arrange(wt) %>% summarise(n())
mtcars %>% filter(mpg>25 & am==1) %>% arrange(wt) %>% count()

#mean mileage for manual and automatic transmission
count(mtcars)
mtcars%>% group_by(am) %>% summarise((mean(mpg)))

#mean weight for each gear type vehicle

mtcars%>% group_by(gear) %>% summarise(mean(wt))
                                       
mtcars

mtcars%>%select(mpg:cyl)

mtcars%>%top_n(10,mpg)

#sampling
sample_frac(mtcars, 0.2, replace=T) #replace = F will work, repetition not needed
sample_n(mtcars, 60, replace=T) %>% select(mpg)
slice(mtcars,10:14)
top_n(mtcars,-2, mpg)  #least 2 mpg

select(mtcars, mpg) %>% arrange(desc(mpg))

