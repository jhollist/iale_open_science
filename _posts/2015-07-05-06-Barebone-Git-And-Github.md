---
title: "06 - Barebones Git and GitHub"
author: Jeffrey W. Hollister
layout: post_page
---



Collaboration is essential to science, and requires understanding both the social side to collaboration as well as the logistical, nuts-and-bolts, technical side.  In spite of its importance, we get very little training in how to do this.  In this lesson we are going to start to focus on the technical side of collaboration.  Given the limited time we have, we are going to show you the bare bones of [GitHub](https://github.com) and the underlying version control technology, [Git](https://git-scm.com/).  The purpose of this lesson is to give you the basic skills in Git that will allow you to start working and collaborating with GitHub. 

##Lesson Goals
- Understand Git and GitHub and how they work together
- Be able to use basic Git commands from the shell
- Be able to use RSutdio's Git interface

##Quick Links to Exercises and R code
- [Exercise 1](#exercise-1): Create a repository on GitHub
- [Exercise 2](#exercise-2): Use RStudio with your GitHub repository
- [Exercise 3](#exercise-3): Set-up global configuration on local machine
- [Exercise 4](#exercise-4): Use Git from shell to push initial changes


##Git and GitHub

Git and GitHub are two releated, but separate entities.  Git could exisit without GitHub, but GitHub probably couldn't.  Both Git and GitHub are built around the idea of a repository.  At it's simplest, a repository is nothing more than a folder with another folder, `.git`, inside of it.  All of the Git magic occurs within that folder.  So, when we talk about repositories, either locally or on GitHub all we mean is a folder that holds a group of related files and folders.  Those repositories can represent software (e.g. an R Package), a mansucript, or even a website.  Each of these things is just files, folders, and text (and binary too, but they are dealt with a bit differently).

###What is Git?

Git is version control software.  It was originally built to manage the development of the Linux Kernel.  Since then it has taken off and is, arguably, the most widely used software for managing versions of code (and really any text).  It is designed to work in a distributed fashion.  What this means, is that we can each have our version of the code (or text), then, if we want, combine those together into a centralized, master version.  Since it is distributed, it deals with multiple changes, from multiple people and it  provides mechanisms to combine those changes together.  In essence, think of it as "track-changes" on steroids.  We'll get into more details in a bit.

###What is GitHub?

GitHub is a website that facilitates sharing and colloborating on coding (and text) projects.  It serves as a cenralized location to store code, data, and files related to a project and also has a social component to it in that you can follow other users, star projects, etc.  It has grown tremendously in the last 5 years or so and houses some pretty big name projects (e.g. the Linux Kernel,jQuery) and, increasingly, is getting used more and more for hosting scientific projects.  It relies heavily on Git and much of the structure and functionality is an outgrowth of this reliance.

##Basics of Github
There are a lot of great features built into GitHub.  We will only talk about the those needed to work with repositories locally with RStudio and only use GitHub a little to get an example up and running.

The GitHub concepts/features that, in my experience, tend to get the most use are:

  - Forks
  - Pull Requests
  - Issues
  - Creating new Repos
  - Other cool things
      - Social Stuff
      - Free Web Hosting
      - Outside Services

### Forks

### Pull Requests

### Issues

### New Repositories

### Other Cool Things

##Exercise 1

##Basics of Git

Git is huge.  It currently has 154 commands and each command has a number of possible of options.  For example, the command `git add` has these options availble:


{% highlight text %}
##  [1] "usage: git add [options] [--] <pathspec>..."                                          
##  [2] ""                                                                                     
##  [3] "    -n, --dry-run         dry run"                                                    
##  [4] "    -v, --verbose         be verbose"                                                 
##  [5] ""                                                                                     
##  [6] "    -i, --interactive     interactive picking"                                        
##  [7] "    -p, --patch           select hunks interactively"                                 
##  [8] "    -e, --edit            edit current diff and apply"                                
##  [9] "    -f, --force           allow adding otherwise ignored files"                       
## [10] "    -u, --update          update tracked files"                                       
## [11] "    -N, --intent-to-add   record only the fact that the path will be added later"     
## [12] "    -A, --all             add changes from all tracked and untracked files"           
## [13] "    --ignore-removal      ignore paths removed in the working tree (same as --no-all)"
## [14] "    --refresh             don't add, only refresh the index"                          
## [15] "    --ignore-errors       just skip files which cannot be added because of errors"    
## [16] "    --ignore-missing      check if - even missing - files are ignored in dry run"     
## [17] ""
{% endhighlight %}

So with 154 time whatever number of options it can get dense, quickly.  Luckily for us, we don't need to worry so much about everything that Git can do.  We just need the bare minimum.  This inlcudes:

  - config
  - remote
  - add
  - commit
  - push
  - pull
  
One quick note, unlike all the other work in this workshop, we will not be using RStudio directly for this section.  We need to open up a shell or command window.  Easiest way to do this is in RStudio with `Tools:Shell`.

### Config

This is one I always have to look up to remember the exact syntax.  Reason is, you only need to use it once per machine.  There are many things you can manage with config.  We are only going to show two, your email and your name.  This allows all changes you make to be assigned back to you.  Not a big deal on a project with one or two collaborators, but a big deal when many people are all working on the same project.

So from your shell you can type the following to set your user name:

```
git config --global user.name "Your Name"
```
To set your email:

```
git config --global user.email "your.name@example.com"
```
And lastly, it is sometimes nice to see that these did something.  You can list your current configuration with 

```
git config --global -l
```


{% highlight text %}
## [1] "user.name=Jeffrey W. Hollister"            
## [2] "user.email=jeff.w.hollister@gmail.com"     
## [3] "credential.helper=cache --timeout=10000000"
## [4] "core.autocrlf=true"
{% endhighlight %}

##Exercise 3
For this exercise, we are going to get your global config set up with your use name and email.

1. Open a shell window
2. Set you user name
3. Set your user email
4. List that to the screen



