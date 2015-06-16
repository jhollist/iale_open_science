---
title: "01 - Introduction to R: The basics"
author: Jeffrey W. Hollister
layout: post_page
---



Over the course of the next two days we are going to walk through a typical data analysis workflow in R.  But, with this first lesson we are going to focus on making sure everything is working and getting some basic orientation in R.  The real fun will start in the lessons to come.  

##Quick Links to Exercises and R code
My goal is to have this workshop be as hands-on as possible.  As such, there are exercises through out.  For each lesson, I will provide a list of links near the top of the post so that you can skip all the prose and jump straight to the lessons.  So, here are the links for Lesson 1.

- [Lesson 1 R Code](/introR/rmd_posts/2015-01-14-01-Introduction.R): All the code from this post in an R Script.
- [Exercise 1](#exercise-1): RStudio Introduction.
- [Exercise 2](#exercise-2): Functions, packages, and help

##Lesson Goals
- Understand what R is and what it can be used for
- Why would you choose R over another tool
- Troubleshoot software installs (keep your fingers crossed)
- Gain familiarity with using R from within the RStudio IDE
- Get to know the basic syntax of R functions
- Be able to install and load a package into your R library
- Know how to get help

##What is R and why use it
R is an open source language and environment for data analysis, statistics, and visualization.  This is the typical definition.  I would argue that R has evolved a bit and is now, more and more, also a general purpose computing language.  It is very widely used in academia and industry for statistics, visualization, data science, and general purpose computation.  In short, the answer to the question to, "Can you do that in R" is almost always yes.  R may not be the best answer, but it is an accurate one.  

The primary reason R is widely used is that it is free, has a large and vibrant community, it is easily extensible, and back to that question, yes you can do that in R!  More to the point, in the environmental sciences R is able to handle any data management, analysis or visualization task that you would need to accomplish and it has capabilities to provide a fully reproducible analysis. 

Lastly, R has almost become the standard for any data analysis or visualization task.  A great site [r4stats.com](http://r4stats.com) has an [article](http://r4stats.com/articles/popularity/) on data analysis software popularity that is kept up to date on the relative popularity of different languages.  One striking figure is the comparison of links to the main pages of the different languages:

[![r4stats.com web site link graph](http://r4stats.files.wordpress.com/2012/04/fig_8_websitelinks.png?w=640&h=689)](http://r4stats.com/articles/popularity/)

<caption align="bottom">source: r4stats.com - The Popularity of Data Analysis Software </caption>

If you read this article you certainly get the sense that R is one of the top languages and trends all favor its continued growth while other popular software (SAS, SPSS, etc.) are seeing decline.

##Getting R and RStudio going
Over the last several years, RStudio has become a very popular IDE (integrated development environment) for R.  In addition to interacting with the R Console, RStudio has many extras built in including version control integration, package building, reproducible research, de-bugging, and built-in text editor with smart highlighting and code completion.  This is the environment we will be using for the two days and should set you up for continued learning with R.



##Exercise 1
This exercise will make sure R and RStudio are working and that you can get around the basics in RStudio.  Use the green stickies when you have completed, and red stickies if you are running into problems.

1. Start RStudio: To start both R and RStudio requires only firing up RStudio.  RStudio should be available from All Programs at the Start Menu.  Fire up RStudio. You should have done this already (see [post 00](/introR/2015/01/14/00-Before-The-Workshop/)).

2. Take a few minutes to look around RStudio.  Find the Console Pane. Find Global and Project Options (hint: look in Tools).  Look at the Environment, History Pane.  Look at the Files, Plots, Packages ... pane.

3. Create a new project.  Name it "gedr_workshop".  We will use this for the rest of the workshop.

4. Create a new "R Script"" in the Source Pane, save that file into your newly created project and name it "lesson1.R". 

5. Download [Lesson 1 R Code](/introR/rmd_posts/2015-01-14-01-Introduction.R) and save it to your project.

##Using functions
R is built off of functions and most of everything you do uses a function.

The basic syntax of function follows the form: `function_name(arg1, arg2, ...)`.  With the base install, you will gain access to many.  For instance:


{% highlight r %}
#Print
print("hello world!")
{% endhighlight %}



{% highlight text %}
## [1] "hello world!"
{% endhighlight %}



{% highlight r %}
#A sequence
seq(1,10)
{% endhighlight %}



{% highlight text %}
##  [1]  1  2  3  4  5  6  7  8  9 10
{% endhighlight %}



{% highlight r %}
#Random normal numbers
rnorm(100,mean=10,sd=2)
{% endhighlight %}



{% highlight text %}
##   [1]  9.503635  9.658867 10.809119  7.196272  9.617089 14.427944 10.266405
##   [8]  9.208680  8.069583 10.019208 10.845454  7.848427 12.232910  8.911676
##  [15]  8.792205  9.565062 11.314472 11.329894 10.245768 10.469647  8.482466
##  [22]  9.947160  8.560172  9.057813 10.105641 11.827359  8.469151  8.694326
##  [29]  8.387490 13.065772 10.544873  9.759926  9.386290  5.294732 11.035148
##  [36]  9.173042  9.405570  5.582514 11.072690  6.375319 10.498527  5.850321
##  [43]  9.569044 12.589174  7.895866  8.705838  9.377995  9.322650  7.776636
##  [50] 14.123041  9.462630 10.285608 15.246510  8.187882 12.804417  8.289699
##  [57] 11.221295  9.954942  8.931465 10.665480 10.020029 10.748939 11.960836
##  [64]  7.823979  8.681838 12.496001  7.579327  6.966075 11.052662  6.607227
##  [71]  8.994145  8.793718  7.166819 10.868010 11.714470 15.024320 13.477942
##  [78] 11.332838  7.609653 10.378092 12.934813  7.718621 12.834847 11.413512
##  [85] 14.335480 11.204350  7.655815 14.749214  9.609365 13.402930 10.127457
##  [92]  7.981437 12.065508 10.889148  9.852252 10.153049 13.411786  9.581553
##  [99] 11.184177 13.668655
{% endhighlight %}



{% highlight r %}
#Mean
mean(rnorm(100))
{% endhighlight %}



{% highlight text %}
## [1] -0.11899
{% endhighlight %}



{% highlight r %}
#Sum
sum(rnorm(100))
{% endhighlight %}



{% highlight text %}
## [1] -6.345912
{% endhighlight %}

A few side notes.  The `#` indicates a comment.  You can put whatever else you'd like after this, but on the same line as the `#`.  R will not evaluate it.  When commenting your code, err on the side of too much!  Also, you will see `()`, `[]`, and `{}` used in R code.  The `()` indicates a function (almost always), the `[]` indicates indexing (grabbing values by the location), and the `{}` groups code that is meant to be run together and is usually used when programming functions in R.

##Using packages
The base install of R is quite powerful, but you will soon have a need or desire to go beyond this.  Packages provide this ability.  They are a standardized method for extending R with new methods, techniques, and programming functionality.  There is a lot to say about packages regarding finding them, using them, etc., but for now let's focus just on the basics.  

###CRAN
One of the reasons for R's popularity is CRAN, [The Comprehensive R Archive Network](http://cran.r-project.org/).  This is where you download R and also where most will gain access to packages (there are other places, but that is for later).  Not much else to say about this now other than to be aware of it.

###Installing packages
When a package gets installed, that means the source (or packaged binary for Windows) is downloaded and put into your library.  A default library location is set for you so no need to worry about that.  In fact on Windows most of this is pretty automatic.  Let's give it a shot.



{% highlight r %}
#Install dplyr and ggplot2
install.packages("ggplot2")
{% endhighlight %}



{% highlight text %}
## Installing package into '/data/jhollist/R/x86_64-redhat-linux-gnu-library/3.1'
## (as 'lib' is unspecified)
{% endhighlight %}



{% highlight text %}
## 
## The downloaded source packages are in
## 	'/tmp/RtmpFFMvXl/downloaded_packages'
{% endhighlight %}



{% highlight r %}
install.packages("dplyr")
{% endhighlight %}



{% highlight text %}
## Installing package into '/data/jhollist/R/x86_64-redhat-linux-gnu-library/3.1'
## (as 'lib' is unspecified)
{% endhighlight %}



{% highlight text %}
## 
## The downloaded source packages are in
## 	'/tmp/RtmpFFMvXl/downloaded_packages'
{% endhighlight %}



{% highlight r %}
#You can also put more than one in like
install.packages(c("randomForest","formatR"))
{% endhighlight %}



{% highlight text %}
## Installing packages into '/data/jhollist/R/x86_64-redhat-linux-gnu-library/3.1'
## (as 'lib' is unspecified)
{% endhighlight %}



{% highlight text %}
## 
## The downloaded source packages are in
## 	'/tmp/RtmpFFMvXl/downloaded_packages'
{% endhighlight %}

###Loading packages
One source of confusion that many have is when they cannot access a package that they just installed. This is because getting to this point requires an extra step, loading (or attaching) the package.   


{% highlight r %}
#Add libraries to your R Session
library("ggplot2")
{% endhighlight %}



{% highlight text %}
## Loading required package: methods
{% endhighlight %}



{% highlight r %}
library("dplyr")
{% endhighlight %}



{% highlight text %}
## 
## Attaching package: 'dplyr'
## 
## The following object is masked from 'package:stats':
## 
##     filter
## 
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
{% endhighlight %}



{% highlight r %}
#You can also access functions without loading by using package::function
randomForest::randomForest
{% endhighlight %}



{% highlight text %}
## function (x, ...) 
## UseMethod("randomForest")
## <environment: namespace:randomForest>
{% endhighlight %}

You will often see people use `require()` to load a package. It is better form to not do this. For a more detailed explanation of why `library()` and not `require()` see [Yihui Xie's post on the subject](http://yihui.name/en/2014/07/library-vs-require/.)

###Some other useful commands
There are a lot of other commands that help you navigate packages


{% highlight r %}
#See what is installed
installed.packages()

#What packages are available?
available.packages()

#Update, may take a while if you have many packages installed
update.packages()
{% endhighlight %}

Lastly, a quick note on pacakges and libraries.  You will often hear people use the terms interchangably.  This is not correct.  A package is what is submitted to CRAN, it is what contains a group of functions that address a common problem, and it is what has allowed R to expand.  A library is, more or less, where you packages are stored.  You have a path to that library and this is where R puts new packages that you install (e.g. via `install.packages()`).  These two terms are related, but most certainly different.  Apologies up front if I slip and use one when I actually mean the other...

##Help!
Being able to find help and interpret that help is probably one of the most important skills for learning a new language.  R is no different. Help on functions and packages can be accessed directly from R, can be found on CRAN and other official R resources, searched on Google, found on StackOverflow, or from any number of fantastic online resources. I will cover a few of these here. 

###Help from the console
Getting help from the console is straightforward and can be done numerous ways.


{% highlight r %}
#Using the help command/shortcut
help("print") #Help on the print command
?print #Help on the print command using the `?` shortcut
help(package="dplyr") #Help on the package `dplyr`

#Don't know the exact name or just part of it
apropos("print") #Returns all available functions with "print" in the name
??print #Shortcut, but also searches demos and vignettes in a formatted page
{% endhighlight %}

###Official R Resources
In addition to help from within R itself, CRAN and the R-Project have many resources available for support.  Two of the most notable are the mailing lists and the [task views](http://cran.r-project.org/web/views/).

- [R Help Mailing List](https://stat.ethz.ch/mailman/listinfo/r-help): The main mailing list for R help.  Can be a bit daunting and some (although not most) senior folks can be, um, curmudgeonly...
- [R-sig-ecology](https://stat.ethz.ch/mailman/listinfo/r-sig-ecology): A special interest group for use of R in ecology.  Less daunting the the main help with participation from some big names in ecological modelling and statistics (e.g., Ben Bolker, Gavin Simpson, and Phil Dixon).  One of the moderators is great, the other is a bit of a jerk (it's me).
- [Environmetrics Task View](http://cran.r-project.org/web/views/Environmetrics.html): Task views are great in that they provide an annotated list of packages relevant to a particular field.  This one is maintained by Gavin Simpson and has great info on packages relevant to much of the work at EPA.
- [Spatial Analysis Task View](http://cran.r-project.org/web/views/Spatial.html): One I use a lot that lists all the relevant packages for spatial analysis, GIS, and Remote Sensing in R. 

###Google and StackOverflow
While the resources already mentioned are useful, often the quickest way is to just turn to Google.  However, a search for "R" is a bit challenging.  A few ways around this.  Google works great if you search for a given package.  You can search for mailing lists directly (i.e. "R-sig-geo").  An R specific search tool, [RSeek.org](http://www.rseek.org/), has been created to facilitate this.  

One specific resource that I use quite a bit is [StackOverflow with the 'r' tag](http://stackoverflow.com/questions/tagged/r).  StackOverflow is a discussion forum for all things related to programming.  You can then use this tag and the search functions in StackOverflow and find answers to almost anything you can think of.

###Other Resources
As I mention earlier, there are TOO many resources to mention and everyone has their favorites.  Below are just a few that I like.

- [R For Cats](http://rforcats.net/): Basic introduction site, meant to be a gentle and light-hearted introduction
- [Advanced R](http://adv-r.had.co.nz/): Web home of Hadley Wickham's new book.  Gets into more advanced topics, but also covers the basics in a great way.
- [Why R is Hard To Learn](http://r4stats.com/articles/why-r-is-hard-to-learn/): Long and detailed blog post discussing some of the challenges people often face when learning R.
- [Other Resources](http://scicomp2014.edc.uri.edu/resources.html): A list I helped compile for a URI Class.
- [CRAN Cheatsheets](http://cran.r-project.org/doc/contrib/Short-refcard.pdf): A good cheat sheet from the official source
- [RStudio Cheatsheets](http://www.rstudio.com/resources/cheatsheets/): Additional cheat sheets from RStudio.  I am especially fond of the data wrangling one.



##Exercise 2
For this second exercise we are going to get used to using some basic functions, working with scripts and not just the console, and look through some task views and get used to basic navigation around packages.  Use the green stickies when you have completed, and red stickies if you are running into problems.

1. If it is not already open, open the "lesson1.R" file you created in Exercise 1. Enter your commands into this script.
2. Use the `print` function to print something to the screen.
3. Combine `mean` and `rnorm` to return the mean value of a set of random numbers.
4. Open up a [task view](http://cran.r-project.org/web/views/) of your choosing.  Select a package and install it. 
5. Load the package into your library.
6. Open the help for the package.
7. Save all these functions inside your "lesson1.R" script.  Run the script using the "Run" button at the top right of the editor.




