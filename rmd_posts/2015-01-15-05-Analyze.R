


## ----ttest_examp---------------------------------------------------------
x<-rnorm(30,mean=3,sd=2)
y<-rnorm(30,mean=10,sd=5)
xy_tt<-t.test(x,y)
xy_tt


## ----ttest_formula_examp-------------------------------------------------
#Lets pick another dataset, ToothGrowth.
#Looking at diff in tooth length by groups specified in supp
rbind(head(ToothGrowth),tail(ToothGrowth))
t.test(ToothGrowth$len~ToothGrowth$supp)


## ----corr_examp,message=FALSE,warning=FALSE------------------------------
#A simple correlation
cor(iris$Petal.Width,iris$Petal.Length)
#And a test of that correlation
cor.test(iris$Petal.Width,iris$Petal.Length)
#A data frame as input returns a correlation matrix
cor(iris)
#Oops, non-numeric data.  Lets use dplyr to get what we want and pipe to cor
library(dplyr)
select(iris,-Species) %>% 
  cor()


## ----lm_examp------------------------------------------------------------
lm(Ozone~Temp,data=airquality)
#Not much info, so save to object and use summary
lm_aq1<-lm(Ozone~Temp,data=airquality)
summary(lm_aq1)
#And now a multiple linear regression
lm_aq2<-lm(Ozone~Temp+Wind+Solar.R,data=airquality)
summary(lm_aq2)


## ----Exercise1, echo=FALSE-----------------------------------------------


