---
title: "08 - Install spatial libraries"
author: "Scott Chamberlain"
layout: post_page
---
  
Installing `rgdal` and `rgeos`

__rgdal__

Install from source from CRAN, and pass to `configure.args` the path to your GDAL library. 

```r
install.packages("rgdal", type = "source", configure.args = "--with-gdal-config=/Library/Frameworks/GDAL.framework/Versions/1.11/unix/bin/gdal-config --with-proj-include=/Library/Frameworks/PROJ.framework/unix/include --with-proj-lib=/Library/Frameworks/PROJ.framework/unix/lib")
```

__rgeos__

May work without anything, 

```r
install.packages("rgeos", type = "source")
```
