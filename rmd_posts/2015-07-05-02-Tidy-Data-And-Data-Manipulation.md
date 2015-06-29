---
title: "02 - Tidy Data and Data Manipulation with R"
author: Betty J. Kreakie
layout: post_page
---

**Tidy Data**

Nearly everything that I will cover in the section is stolen directly from Hadley Wickham.  In fact, if you just read the following paper, you should learn everything you need to know about data management (unless you are doing crazy database stuff- then you might need some intense instruction).

[Wickham, H. 2014. Tidy Data. Journal of Statistical Software 59.](http://vita.had.co.nz/papers/tidy-data.pdf)

> “Happy families are all alike; every unhappy family is unhappy in its own way”
> *Leo Tolstoy*

> “[T]idy datasets are all alike but every messy dataset is messy in its own way.”
> *Hadley Wickham*

It is estimated that 80% of data analysis time is spent cleaning and preparing data (Dasu T, Johnson T (2003). Exploratory Data Mining and Data Cleaning. John Wiley & Sons).  There will be always be a need to devote some time to prepare data for your specific analysis.  But the ultimate goal is to reduce the time needed to deal with “messy data” issues.


Tidy data is a standard method of data storage for increased interpretability and integration.

  * Data analysis software is created based on a standardized data format
  * Data is super expensive and difficult to collect
  * Increase the ease and accuracy of data sharing
  * Because you are required to care

The Principles of Tidy Data:

1. Rows are observations
2. Variables are Columns
3. Observational Units are Tables



The rest of this section will be spent talking about (and playing with) two data manipulation packages: tidyr and dplyr.  To understand these packages (and other Wickham packages like ggplot), it is first useful to make sure we have a basic understanding of pipes.  

Pipes allow us to:

1. Reduce the number of nested parenthesizes
2. Write code that reads left to right 
3. Increase organization and more in-line with workflow





