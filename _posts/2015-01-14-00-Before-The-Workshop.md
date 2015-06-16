---
title: "00 - Before The Workshop"
author: Jeffrey W. Hollister
layout: post_page
---

Prior to the start of the workshop everyone will need to have had the software 
installed and tested.  You will need to have the following installed (links assume Windows as this is the predominant OS within EPA):

1. **R:** Get the [latest download](http://cran.r-project.org/bin/windows/base/) and install using the default settings.
2. **RStudio:** Get the [latest download](http://www.rstudio.com/products/rstudio/download/) and install using the default settings.
3. **Perl:** We will be using [Strawberry Perl](http://strawberryperl.com/).  For most of the workshop this is not important it is only needed for reading directly from an Excel Spreadsheet which is a VERY small part of the workshop.

Once everything is installed, follow the instructions below to test your installation.

## Open RStudio
Once installed, RStudio should be accessible from the start menu.  Start up RStudio.  Once running it should look something like:

![RStudio Window](/introR/figure/rstudio.png)

## Find "Console" window
By default the console window will be on the left side of RStudio.  Find that window.  It will looking something like:  

![RStudio Console](/introR/figure/rstudio_console.png)

## Copy and paste the code
Click in the window and paste in the code from below:


{% highlight r %}
version$version.string
{% endhighlight %}

## It should say...


{% highlight text %}
## [1] "R version 3.1.2 (2014-10-31)"
{% endhighlight %}



