




## ----rf_install, eval=FALSE----------------------------------------------
## install.packages("randomForest")
## library("randomForest")
## help(package="randomForest")


## ----rf_example----------------------------------------------------------
rf_x<-select(iris,Petal.Width, Petal.Length, Sepal.Width, Sepal.Length)
rf_y<-select(iris,Species)
rf_y<-rf_y$Species
iris_rf<-randomForest(x=rf_x,y=rf_y)
iris_rf


## ----rf_form_examp-------------------------------------------------------
iris_rf2<-randomForest(Species~.,data=iris)
iris_rf2


## ----rf_plots------------------------------------------------------------
#Error vs num of trees
plot(iris_rf2)
#Variable Importance
varImpPlot(iris_rf2)


## ----Exercise1, echo=FALSE-----------------------------------------------


## ----vignette_examp,eval=FALSE-------------------------------------------
## vignette(package="knitr")


