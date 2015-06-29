## ----git_config, echo=FALSE----------------------------------------------
system("git config --global -l",intern = TRUE)

## ----git_remote, echo=FALSE----------------------------------------------
system("git remote -v",intern = TRUE)

## ----git_pull, echo=FALSE------------------------------------------------
system("git pull",intern = TRUE)

## ----git_status, echo=FALSE, cache=TRUE----------------------------------
system("git status",intern = TRUE)

## ----git_add, echo=FALSE, cache=TRUE-------------------------------------
system("git add 2015-07-05-06-Barebone-Git-And-Github.Rmd",intern = TRUE)

## ----git_commit, echo=FALSE, cache=TRUE----------------------------------
system("git commit -m 'My Changes'",intern = TRUE)

## ----git_push, echo=FALSE, cache=TRUE------------------------------------
system("git push origin master",intern = TRUE)

