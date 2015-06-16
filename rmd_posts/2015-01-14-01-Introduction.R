
## ----setup, echo=FALSE, warning=FALSE------------------------------------
options(repos="http://cran.rstudio.com/")


## ----Exercise1, echo=FALSE-----------------------------------------------


## ----function_examples, cache=TRUE---------------------------------------
#Print
print("hello world!")
#A sequence
seq(1,10)
#Random normal numbers
rnorm(100,mean=10,sd=2)
#Mean
mean(rnorm(100))
#Sum
sum(rnorm(100))


## ----install_package, cache=TRUE-----------------------------------------
#Install dplyr and ggplot2
install.packages("ggplot2")
install.packages("dplyr")

#You can also put more than one in like
install.packages(c("randomForest","formatR"))


## ----load_package--------------------------------------------------------
#Add libraries to your R Session
library("ggplot2")
library("dplyr")

#You can also access functions without loading by using package::function
randomForest::randomForest



## ----other_packages, eval=FALSE------------------------------------------
## #See what is installed
## installed.packages()
## 
## #What packages are available?
## available.packages()
## 
## #Update, may take a while if you have many packages installed
## update.packages()


## ----help_from_console, eval=FALSE---------------------------------------
## #Using the help command/shortcut
## help("print") #Help on the print command
## ?print #Help on the print command using the `?` shortcut
## help(package="dplyr") #Help on the package `dplyr`
## 
## #Don't know the exact name or just part of it
## apropos("print") #Returns all available functions with "print" in the name
## ??print #Shortcut, but also searches demos and vignettes in a formatted page
## 


## ----Exercise2, echo=FALSE-----------------------------------------------


