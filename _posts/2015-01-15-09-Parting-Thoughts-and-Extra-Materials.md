---
title: "09 - Parting Thoughts"
author: Jeffrey W. Hollister
layout: post_page
---
Having now presented these materials to multiple groups of eager USEPA students, I wanted to add one last post to the site with some parting thoughts.  But before I do that, I wanted to, as promised, put up my code for each of the exercises.  There are many ways to successfully complete the exercises so your code will very likely be different than what I have presented here.  That being said the answers should not be different (except randomForest).

- [Jeff's nla_anlaysis.R](/introR/exercises/nla_analysis.R)

##Parting Thoughts
It is impossible to become proficient at anything over the course of two days and R certainly is not an exception to this.  What I do hope this workshop and/or website has provided is a starting point.  The only way to get better with R is to keep using it.  The best way I know of to do this is to keep reading, taking workshops, and trying to solve problems with R.  A diversity of approaches is not only a good idea but with something as broad as R I think it required.  And, you will always pick up new tricks.  

In addition to an immersion approach, another REALLY good thing to do is to find a problem that you need to solve and force yourself to solve it with R.  I know most everyone has had many years experience with data analysis with other software.  When you have this background, it is certainly easy to fall back on what you know, but use this opportunity to not only get something done, but make sure you allow additional time to also learn R.  A warning though, I would not recommend going cold turkey and just diving into R.  Ramp up slowly over the next year or so and try to keep solving one more problem with R.  This allows you to keep working while also slowly building your profeciency.  In short, slow and steady.  


##Nuts and Bolts
The nuts and bolts of putting this site together is interesting, I think, in and of itself.  In case anyone is interested in this, I provide some of those details here.  

###Github Pages and Jekyll
This site and all of the source code used to generate it live on [Github](https://github.com).  The source lives in the [introR repository](https://github.com/usepa/introR) and the site is at [usepa.github.io/introR](http://usepa.github.io/introR).  This little trick of hosting a site from Github is through the use of the `gh-pages` branch.  Any `html` you place here gets served from a site with `user.github.io/repoName` as the URL.  You can put plain html there and it will work fine, but Github provides some other fun tools, most notably [Jekyll](http://jekyllrb.com/).  What this allows you to do is use templates for the general look and feel of the site and then write the page completely in markdown.  With some magic metadata and templates your site gets built and served with all things in the right place!  It certainly has a bit of a learning curve, but once you get the site templates figured out and get a handle on the general strucutre of a Jekyll site it works quite qell.

###R, Markdown, `knitr`, and make
As I mentioned, Jekyll likes markdown.  But for a site like this one I also want a good deal of R to be included.  This requires that we use R, markdown and the `knitr` package to process the R code and spit out markdown files that Jekyll then uses to build the site.  The basic workflow for the site was this.

1. Author a post in markdown with your code chunks included.  
1. Process your .Rmd (an R Markdown file) with `knitr::knit`.  This will spit out a markdown file (.md) with your R code processed and spit back out the the .md file
1. Get your generated .md files into the proper place and let Jekyll do its thing.

This is basically what happened with this site, but since there were many posts and each were written overn time with LOTS of edits I needed a way to easily run this workflow multiple times.  To accomplish this I added a makefile.  The makefile will take care of the knitting of any changed files and move my files where they need to go.  I addeded a section to the makefile to deal with the version control which committed my changes and pushed them up to Github (I am sure this is probably a version controll no-no, but it worked ok for me).

So my new workflow was

1. Author in Rmd
1. `make`
1. `make git`

Site built!  


###Creative Commons Zero
All of this materials is not mine to keep.  I have borrowed a lot of it from around the web and as a federal employee I cannot (nor do I want to) license my material.  It is realeased under the [Creative Commons Zero](https://creativecommons.org/publicdomain/zero/1.0/) public domain dedication.  This essentially means you can do anything you'd like with it!  Attribution is not required, but appreciated.

Lastly, this is on github and thus you are free to make additions and submit them back as pull requests.  I will do my best to get to those in a timely fashion.  If you do this, please see the [README](https://github.com/USEPA/introR/blob/master/README.md) and in particular the disclaimer.  Some important stuff there.  And just to make sure, the disclaimer is below for your reading pleasure!

##EPA Disclaimer
The United States Environmental Protection Agency (EPA) GitHub project code is provided on an "as is" basis and the user assumes responsibility for its use. EPA has relinquished control of the information and no longer has responsibility to protect the integrity , confidentiality, or availability of the information. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recomendation or favoring by EPA. The EPA seal and logo shall not be used in any manner to imply endorsement of any commercial product or activity by EPA or the United States Government.

By submitting a pull request, you make an agreement with EPA that you will not submit a claim of compensation for services rendered to EPA or any other federal agency.  Further, you agree not to charge the time you spend developing software code related to this project to any federal grant or cooperative agreement.
