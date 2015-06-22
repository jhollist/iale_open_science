---
title: "00 - Before The Workshop"
author: Jeffrey W. Hollister
layout: post_page
---

Prior to the start of the workshop everyone will need to have the software 
installed and tested.  You will need to have R, RStudio, and Git installed.  Get the latest versions of each and install using the defaults.  

1. **R:** 
    - [General Info](http://cran.r-project.org/)
    - [Windows](http://cran.r-project.org/bin/windows/base/R-3.2.0-win.exe)
    - [Mac](http://cran.r-project.org/bin/macosx/R-3.2.0.pkg)
        - *Note:* Mac users will need to make sure they have XQuartz installed. You can check to see if you have it by looking in the directory `Applications/Utilities`.  If you need to install it, [follow this link](http://xquartz.macosforge.org/landing/).
2. **RStudio:** 
    - [General Info](http://www.rstudio.com/products/rstudio/download/)
    - [Windows](http://download1.rstudio.org/RStudio-0.99.446.exe)
    - [Mac](http://download1.rstudio.org/RStudio-0.99.446.dmg)
3. **Git:** 
    - [General Info](https://git-scm.com/downloads)
    - [Windows](https://git-scm.com/download/win)
    - [Mac](https://git-scm.com/download/mac)
4. **LaTeX:**
    - [General Info](http://latex-project.org/ftp.html)
    - [Windows](http://www.tug.org/protext/)
    - [Mac](http://www.tug.org/mactex/)
  
Once everything is installed, follow the instructions below to test your installation.

## Open RStudio
Once installed, RStudio should be accessible from the start menu.  Start up RStudio.  Once running it should look something like:

![RStudio Window](/iale_open_science/figure/rstudio.png)

## Find "Console" window
By default the console window will be on the left side of RStudio.  Find that window.  It will looking something like:  

![RStudio Console](/iale_open_science/figure/rstudio_console.png)

## Copy and paste the code
Click in the window and paste in the code from below:


{% highlight r %}
version$version.string
{% endhighlight %}

## It should say...


{% highlight text %}
## [1] "R version 3.2.0 (2015-04-16)"
{% endhighlight %}

## And Check on Git 
Lastly, let's make sure Git is running.  Can also do this from R with:


{% highlight r %}
system("git --version")
{% endhighlight %}

## Which looks like...


{% highlight text %}
## [1] "git version 1.9.0"
{% endhighlight %}

## And LaTeX


{% highlight r %}
system("latex --version")
{% endhighlight %}

## Which looks (something) like...


{% highlight text %}
##  [1] "pdfTeX 3.1415926-2.5-1.40.14 (TeX Live 2013)"                                
##  [2] "kpathsea version 6.1.1"                                                      
##  [3] "Copyright 2013 Peter Breitenlohner (eTeX)/Han The Thanh (pdfTeX)."           
##  [4] "There is NO warranty.  Redistribution of this software is"                   
##  [5] "covered by the terms of both the pdfTeX copyright and"                       
##  [6] "the Lesser GNU General Public License."                                      
##  [7] "For more information about these matters, see the file"                      
##  [8] "named COPYING and the pdfTeX source."                                        
##  [9] "Primary author of pdfTeX: Peter Breitenlohner (eTeX)/Han The Thanh (pdfTeX)."
## [10] "Compiled with libpng 1.5.16; using libpng 1.5.16"                            
## [11] "Compiled with zlib 1.2.7; using zlib 1.2.7"                                  
## [12] "Compiled with xpdf version 3.03"
{% endhighlight %}


