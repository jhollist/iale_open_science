


## ----function_create-----------------------------------------------------
hw<-function(){
  print("Hello, World")
}

hw()


## ----function2_create----------------------------------------------------
p<-function(my_text){
  print(my_text)
}

p("Hello, world")
p("Hola, mundo")
p("Howdy, Texas")


## ----plot_function_examp-------------------------------------------------
myplot<-function(x,y,grp,file){
  my_p<-ggplot(data.frame(x,y,grp),aes(x=x,y=y)) +
            geom_point(aes(color=grp, shape=grp),size=5) +
            geom_smooth(method="lm",aes(colour=grp))+
            labs(x=substitute(x),y=substitute(y))
  ggsave(my_p,file=file)
  return(my_p)
}

myplot(iris$Petal.Length,iris$Petal.Width,iris$Species,"petal_petal.jpg")
myplot(iris$Sepal.Length,iris$Sepal.Width,iris$Species,"sepal_l_petal_w.jpg")


## ----if_else_examp-------------------------------------------------------
odd_even<-function(num){
  if(num %% 2 == 0){
    print("EVEN")
  } else {
    print("ODD")
  }
}

odd_even(27)
odd_even(34)


## ----if_else_examp2------------------------------------------------------
plus_minus<-function(num){
  if(num>0){
    print("plus")
  } else if (num < 0) {
    print("minus")
  } else {
    print("zero")
  }
}
 
plus_minus(198)
plus_minus(-44)
plus_minus(37*0)


## ----for_examp-----------------------------------------------------------
sum_vec<-function(vec){
  j<-0
  for(i in vec){
    j<-i+j
    print(j)
  }
}

sum_vec(1:2)
sum_vec(1:10)


## ----for_examp_print-----------------------------------------------------
# A simple vectorize operation
x<-1:100
y<-100:1
z<-x+y
z


## ----looping_vector_examp------------------------------------------------
#We will assume vectors of the same length...
add_vecs<-function(vec1,vec2){
  out<-NULL
  for(i in 1:length(vec1)){
    out[i]<-vec1[i]+vec2[i]
  }
  out
}
add_vecs(x,y)


## ----for_vector_time-----------------------------------------------------
large_vec1<-as.numeric(1:100000)
large_vec2<-as.numeric(100000:1)
#Different speed
vec_time<-system.time(large_vec1+large_vec2)
loop_time<-system.time(add_vecs(large_vec1,large_vec2))
vec_time
loop_time


## ----looping_vector_examp2-----------------------------------------------
#We will assume vectors of the same length...
add_vecs2<-function(vec1,vec2){
  out<-vector("numeric",length(vec1))
  for(i in 1:length(vec1)){
    out[i]<-vec1[i]+vec2[i]
  }
  out
}

system.time(add_vecs2(large_vec1,large_vec2))


## ----odd_even_return-----------------------------------------------------
odd_even<-function(num){
  if(num %% 2 == 0){
    return("EVEN")
  } 
  return("ODD")
}


## ----sum_vec_return------------------------------------------------------
sum_vec<-function(vec){
  j<-0
  for(i in vec){
    j<-i+j
  }
  return(j)
}


## ----Exercise1, echo=FALSE-----------------------------------------------


## ----ggplot_starter function, eval=FALSE---------------------------------
## plot_nla<-function(x,y,out=NULL){
##   #ggplot2 code
##   #Note: ggplot requires a data frame as input.  How would you deal with that?
## 
##   #ggsave here
##   #look into the is.null() function
##   if(put condition here){
##     ggsave()
##   }
## 
##   #Need to return something ...
##   return()
## }


