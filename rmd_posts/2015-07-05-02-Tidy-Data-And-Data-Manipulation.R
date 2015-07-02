## ------------------------------------------------------------------------
library('magrittr')
str1<- "Facts are stubborn"
str2<-"but statistics are more pliable"

##Example of intermediate step
play<-paste(str1,str2)
toupper(play)
 
##Example of nested functions 
toupper(paste(str1,str2))

##Pipes
str1 %>% substr(1,5)
str1 %>% paste(str2) %>% toupper()



## ------------------------------------------------------------------------
library(tidyr)
messy<-data.frame(site=c("pawcatuck"," pettaquamscutt","pawtuxet"," pocasset","ponaganset"), a=c(56,76,43,25,21),b=c(123,234,187,198,23))

messy

messy %>%
  gather(treatment, count, a:b) %>% print()



## ------------------------------------------------------------------------
df <- data.frame(x = c("a.b", "a.d", "b.c"))
df %>% separate(x, c("A", "B"))%>% print()

df <- data.frame(x = c("x: 123", "y: error: 7"))
df %>% separate(x, c("key", "value"), ": ", extra = "merge") %>% print()



## ------------------------------------------------------------------------
library(dplyr)
glimpse(iris)

head(select(iris, contains("Petal"))) 

iris%>%filter(Species=="setosa")%>%head()

iris%>%arrange(Petal.Length)%>%head()

iris%>%arrange(desc(Petal.Length))%>%head()


iris%>%mutate(Sepal.Length.mm=Sepal.Length*10)%>%head()

iris%>%summarize(sepalMean=mean(Sepal.Length,na.rm=TRUE))


## ------------------------------------------------------------------------
group_by(iris,Species)%>%
  summarize(mean(Sepal.Length),
            mean(Sepal.Width),
            mean(Petal.Length),
            mean(Petal.Width))



## ------------------------------------------------------------------------
###Use for #1-3
set.seed(10)
messy <- data.frame(
  id = 1:4,
  trt = sample(rep(c('control', 'treatment'), each = 2)),
  work.T1 = runif(4),
  home.T1 = runif(4),
  work.T2 = runif(4),
  home.T2 = runif(4)
)



