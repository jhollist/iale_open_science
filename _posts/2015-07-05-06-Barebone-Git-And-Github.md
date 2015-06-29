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
  - [Exercise 2](#exercise-2): Set-up global configuration on local machine
  - [Exercise 3](#exercise-3): Use Git from shell to push initial changes
  - [Exercise 4](#exercise-4): Use RStudio with your GitHub repository

##Git and GitHub

Git and GitHub are two releated, but separate entities.  Git could exisit without GitHub, but GitHub probably couldn't.  Both Git and GitHub are built around the idea of a repository.  At it's simplest, a repository is nothing more than a folder with another folder, `.git`, inside of it.  All of the Git magic occurs within that folder.  So, when we talk about repositories, either locally or on GitHub all we mean is a folder that holds a group of related files and folders.  Those repositories can represent software (e.g. an R Package), a mansucript, or even a website.  Each of these things is just files, folders, and text (and binary too, but they are dealt with a bit differently).

###What is Git?

Git is version control software.  It was originally built to manage the development of the Linux Kernel.  Since then it has taken off and is, arguably, the most widely used software for managing versions of code (and really any text).  It is designed to work in a distributed fashion.  What this means, is that we can each have our version of the code (or text), then, if we want, combine those together into a centralized, master version.  Since it is distributed, it deals with multiple changes, from multiple people and it  provides mechanisms to combine those changes together.  In essence, think of it as "track-changes" on steroids.  We'll get into more details in a bit.

###What is GitHub?

GitHub is a website that facilitates sharing and colloborating on coding (and text) projects.  It serves as a cenralized location to store code, data, and files related to a project and also has a social component to it in that you can follow other users, star projects, etc.  It has grown tremendously in the last 5 years or so and houses some pretty big name projects (e.g. the Linux Kernel,jQuery) and, increasingly, is getting used more and more for hosting scientific projects.  It relies heavily on Git and much of the structure and functionality is an outgrowth of this reliance.

##Basics of Github
There are a lot of great features built into GitHub.  We will only talk about the those needed to work with repositories locally with RStudio and only use GitHub a little to get an example up and running.

The GitHub concepts/features that, in my experience, tend to get the most use are:

  - Repositories
  - Forks
  - Pull Requests
  - Issues
  - Other cool things
      - Social Stuff
      - Free Web Hosting
      - Outside Services

### Repositories
I already mentioned these briefly, but they require mentioning again as a Repository (aka, a "repo") is the basic unit of both Git and GitHub.  Any stand along project, be it code, a website, a manuscript, a presentation ... can be housed as a GitHub repository (and thus tracked via Git).  Creating a new repository on GitHub is easy.  First, go to [GitHub](https://github.com) and log in.  You screen will look like:

![github](/iale_open_science/figure/gh1.png)

What you need to do, is find the plus sign in the upper right:

![github2](/iale_open_science/figure/gh2.png)

Click on that and you will see:

![github3](/iale_open_science/figure/gh3.png)

Which takes you to the new repository page:

![github4](/iale_open_science/figure/gh4.png)

On this page you should fill out (at a minimum) the repository name.  A brief description is probably a good idea too.  With that done, click on "create repository."  With that done, you have a new repository and are ready to start adding elegant code or fantastic prose desribing your soon to be Nobel prize winning work.

### Forks
Forks are simply copies of other GitHub repositories.  If you are working with others on a project it is possible that a repository exists, but that you do not have write access to.  In this case, you "fork" that repository.  GitHub will make a copy of that repository to your account.  You can now make whatever changes you like to your copied version (aka, your "fork") of that original repository.

### Pull Requests
Given the situation above, there is a project/repository that you would like to contribute to, but you don't have push rights.  How do you do this?  Well that is done via a "pull request".  This is always (at least I think so) done from a forked repository.  You make your changes, send them to your forked repo, then you ask the maintainers of the repository you forked from to pull in your changes.  Pull requests can also be used when you are wokring with others on a repo that you all have write access to.  In either case, all of the changes you made are highlighted and others are given the chance to review your work prior to adding in to repo.

### Issues
Issues are GitHubs way of keeping track of bugs, to-do lists, discussions about new features, etc. (e.g. [the `lawn` issues](https://github.com/ropensci/lawn/issues)).  Whether you are working on code or on a manuscript that is stored on GitHub, the issues can be a better mechanism for discussing the project than email as it keeps the correspondence with the project itself.  

### Other Cool Things
In addition the more basic functions, GitHub has some other bells and whistles worth mentioning.  First, GitHub has a lot of "social" functionality built in.  You can follow people, star repos, watch repos, etc.  Taking advantage of this will help you find interesting projects and build a network of people working on similar things.  One of the biggest benefits I have gotten out of this is to watch other repositories and see how more experienced users are using GitHub.  Can get you up-to-speed pretty quickly on using issues, working with pull requests, etc.

One of the greatest things, in my opinion, that GitHub provides is free web hosting from repos (my personal page and these workshop materials are hosted there).  There is a lot more info [here](https://pages.github.com/).  We will talk a bit more about this as we go through the exercises.

Lastly, there a number of other companies that are building cool tools off of github.  SOme of these are examining testing coverage in your code (ie. [coveralls.io](https://coveralls.io/)) and continuous integration (ie. [Travis CI](https://travis-ci.org/)).  This is a bit beyond the scope of this workshop, but just be aware that there is a lot of cool, techy stuff going on both at GitHub and elsewhere that may have benefit for your work.

##Exercise 1
With this exercise we are going to get you set up with the minimum: an account and your first repo.  

1. If you do not already have one, go to [GitHub](https://github.com) and create a new account.  
2. Set up a new repo.  Use the following for the name of this repo: username.github.io.  Repos with this naming convention are used by GitHub to host your user web page.  We will be adding some to this in the later exercises.

##Basics of Git
Git is huge.  It currently has 154 commands and each command has a number of possible of options.  For example, the command `git add` has 13 options availble.  So with 154 time whatever number of options it can get dense, quickly.  Luckily for us, we don't need to worry so much about everything that Git can do.  We just need the bare minimum.  This inlcudes:

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
## [1] "user.email=jeff.w.hollister@gmail.com"     
## [2] "user.name=Jeff Hollister"                  
## [3] "credential.helper=cache --timeout=10000000"
{% endhighlight %}

We will get to the other concepts in a bit.  First, lets try to get our config set up.

##Exercise 2
For this exercise, we are going to get your global config set up with your use name and email.

1. Open a shell window
2. Set you user name
3. Set your user email
4. List that to the screen


##More Git Basics

### Remote
Git is distributed version contorl system.  This essentially means that we have repositories that are local (e.g., the copy of your repo that lives on your hard drive) or remote (e.g, the GitHub repo).  While we won't be doing much with remotes in these exercises, it is good to know about this.  One command that is useful is being able to list the remote info.  This can be done with:

```
git remote -v
```


{% highlight text %}
## [1] "origin\thttps://github.com/jhollist/iale_open_science (fetch)"
## [2] "origin\thttps://github.com/jhollist/iale_open_science (push)"
{% endhighlight %}

### Git Workflow
The rest of the concepts we are going to cover make up a general Git workflow and this workflow has four main parts, 1)pulling, from your remote, any changes, 2) adding locally changed files to a "staging area", 3) committing the changes to the version control history, and 4) pushing those changes up to your remote repo.  We will look at each of these a bit more closely.

**Pull**

**Add**

**Commit**

**Push**

##Exercise 3

##Git and GitHub integration with RStudio
Now that you know of all the great things that GitHub has to offer (I am not getting kickbacks, I swear) and you have an understanding of the key concepts of Git, next thing we want to be able to do is work with your new repo locally and via RStudio.  Our first step is to make sure RStudio knows where Git lives on your machine.  This will be OS specific.  What I have provided below are the steps for windows.

First thing is to make sure Git is installed.  It can be downloaded from the main [git page](https://git-scm.com/).  Once Git is installed, we just need to make sure that RStudio knows where to find it.  On windows that is most likely going to be in `C:/Program Files (x86)/Git/bin/git.exe`.  In RStudio, go to Tools:Global Options from the menu bar.  Click on Git/SVN down at the bottom left.  The window you get should look like:

![rstudio options](/iale_open_science/figure/rstudio_options.png)

Just make sure you have the right path in the "Git exectuable" box.  If you want, you can also click on the checkbox to use Git Bash as you shell.

If you had to make changes to location of the executable, shut down and restart RStudio and you should be all set.

Next we need to link up an RStudio project with a GitHub repo.  The steps to do this are File:New Project.  The window you get should like:

![new project 1](/iale_open_science/figure/rstudio_proj1.png)

From there, select "Version Control", which sends you to:

![new project 2](/iale_open_science/figure/rstudio_proj2.png)

And there, select Git, which finally gets you to:

![new project 3](/iale_open_science/figure/rstudio_proj3.png)

In the Repository URL all we have to do is point it to our GitHub repo.  The URL of that is going to be something like `https://github.com/username/reponame`.  Once you get that in and hit "Create Project" it will create the project and clone the repository.  You are now ready to add files, make edits, and push those changes up to GitHub.

##Exercise 4


