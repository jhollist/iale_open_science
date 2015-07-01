---
title: "03 - Spatial Data in R"
author: Bryan Milstead
layout: post_page
---


{% highlight text %}
## Error in library(leaflet): there is no package called 'leaflet'
{% endhighlight %}



{% highlight text %}
## 
## The downloaded source packages are in
## 	'/tmp/RtmpKe1gv0/downloaded_packages'
{% endhighlight %}



{% highlight text %}
## [[1]]
## [1] TRUE
## 
## [[2]]
## [1] TRUE
## 
## [[3]]
## [1] TRUE
## 
## [[4]]
## [1] TRUE
## 
## [[5]]
## [1] TRUE
## 
## [[6]]
## [1] TRUE
{% endhighlight %}

Introduction
-------------------------
R is a really cool program for working with Spatial Data because ...

##Lesson Goals
- Beginning understanding of SP (spatial) objects in R
- Brief introduction to R packages for Spatial Analysis
- Learn how to read shapefiles into R
- Explore how to visualize SP objects in R
- Conduct a basic GIS analysis in R

##Quick Links to Exercises
- [Exercise 1](#exercise-1): Convert Shapefiles into SP objects and plot them
- [Exercise 2](#exercise-2): 


##Git and Github

###What is Git?

###What is GitHub?

###How do they relate?

##Basics of Github

##Exercise 1

### Building the datasets for this exercise

Lets start by making a shapefiles for our current location and a polygon around our location. We won't have time to go into how to do this but I am including the code so you can see how it was done.  These files are available on github so we'll be able to read them in for the exercises (see below).


{% highlight r %}
#Our current location (from GoogleEarth) is:
  Loc<-data.frame(lon=-122.68014,lat=45.517564,name='PDXhilton')

#The Coordinate reference system for GoogleEarth is WGS84 Decimal Degrees
  WGS84<-CRS("+proj=longlat +datum=WGS84")  #ESRI GCS_WGS_1984 

#From this we create SP object (Spatial Points Data Frame)
  #A SpatialPoints object has the geographic information but no attributes
    LocPt<-SpatialPoints(coordinates(Loc[,-3]),proj4string=WGS84)
    class(LocPt) #class info for object
    coordinates(LocPt) #coordinates of point
  #A SpatialPointsDataFrame object has the geographic information plus attributes
    LocPtDF<-SpatialPointsDataFrame(coordinates(Loc[,-3]),Loc,proj4string=WGS84)
        class(LocPtDF) #class info for object
        coordinates(LocPtDF) #coordinates of point
        slotNames(LocPtDF) #get a list of the "slot" names for the object
        LocPtDF@coords #slot method for listing coordinates
        LocPtDF@bbox #bounding box of object
        LocPtDF@proj4string #coordinate reference system for the object

#Let's also create a random polygon around our location
  #coordinates for the polygon
    Poly<-data.frame(Lon=c(-122.683461544862,-122.687996482959,-122.685670328434,-122.682541408927,-122.678202313853,-122.674828807098,-122.674485521254,-122.672769412589,-122.675904138992,-122.674481812434,-122.676631816156,-122.680281068949,-122.683461544862),Lat=c(45.5230187040173,45.5195152981109,45.5143352152495,45.5154464797329,45.512619192088,45.5138738461287,45.5167150399938,45.5190852959663,45.5192876717319,45.5216119799917,45.5235316111073,45.5213931392957,45.5230187040173))  

#create SpatialPolygons Object
  p<-Polygon(Poly) #convert coords to polygon
  p1<- Polygons(list(p), ID=1) #add id variable
  LocPoly<- SpatialPolygons(list(p1),proj4string=WGS84) #create SpatialPolygons object

#create SpatialPolygonsDataFrame Object
  LocPolyDF<- SpatialPolygonsDataFrame(LocPoly,data.frame(Info='PolygonAroundPDXhilton')) #add field "Info" as an attribute to the polygon.
  
#write the spatial dataframe objects to shapefiles
  writeOGR(LocPtDF,'.','LocPt', driver="ESRI Shapefile",overwrite_layer=TRUE)
  writeOGR(LocPolyDF,'.','LocPoly', driver="ESRI Shapefile",overwrite_layer=TRUE)

#create KML file of locations with the maptools package 
  #point
    kmlPoints(LocPtDF, 
              kmlfile='LocPt.kml', 
              name="Hilton", 
              description=paste("Our Current Location"),
              icon="http://maps.google.com/mapfiles/kml/paddle/ltblu-stars.png",
              kmlname="PDXhilton",
              kmldescription="We R Here")
    #open file in google earth
      #shell.exec('LocPt.kml')
  #polygon
    kmlPolygon(LocPolyDF, 
              kmlfile='LocPoly.kml', 
              name="HiltonPoly", 
              description=paste("Random Polygon"),
              lwd=5,border=2,
              kmlname="HiltonPoly",
              kmldescription="We R Here")
    #open file in google earth
      #shell.exec('LocPoly.kml')
{% endhighlight %}

### Reading the spatial Data

The `rgdal` package is good for reading of vector spatial data into R. For Grid data we will use the package `raster`.  All spatial data in these exercises will be converted into SP objects (SpatialPointsDataFrame; SpatialPolygonsDataFrame; and, SpatialGrid) 


{% highlight r %}
# Using rgdal command - readOGR - we now read in the shapefiles of for our current location.
  #point location
    Pt<-readOGR('.',"LocPt")
{% endhighlight %}



{% highlight text %}
## Error in ogrInfo(dsn = dsn, layer = layer, encoding = encoding, use_iconv = use_iconv, : Cannot open file
{% endhighlight %}



{% highlight r %}
  #Polygon location
    Poly<-readOGR('.',"LocPoly")
{% endhighlight %}



{% highlight text %}
## Error in ogrInfo(dsn = dsn, layer = layer, encoding = encoding, use_iconv = use_iconv, : Cannot open file
{% endhighlight %}

### Plotting our location

- We can plot our current location-but it won't be very interesting
- Here is the plot with ggplot2 


{% highlight r %}
  ggplot(Poly,aes(x=long, y=lat)) + geom_path() + geom_point(data=Pt@data, aes(x=lon, y=lat),shape=16,color='orange',size=8)
{% endhighlight %}



{% highlight text %}
## Error in ggplot(Poly, aes(x = long, y = lat)): object 'Poly' not found
{% endhighlight %}

- this is what it looks like with base graphics


{% highlight r %}
  plot(Poly)
{% endhighlight %}



{% highlight text %}
## Error in plot(Poly): error in evaluating the argument 'x' in selecting a method for function 'plot': Error: object 'Poly' not found
{% endhighlight %}



{% highlight r %}
  plot(Pt,add=TRUE,pch=16,col='orange',cex=3)
{% endhighlight %}



{% highlight text %}
## Error in plot(Pt, add = TRUE, pch = 16, col = "orange", cex = 3): error in evaluating the argument 'x' in selecting a method for function 'plot': Error: object 'Pt' not found
{% endhighlight %}

- It is more fun to show our location on map satellite image from Google Maps


{% highlight r %}
    #get the image
      map<-ggmap(get_googlemap(center=c(lon=Pt@data$lon,lat=Pt@data$lat),
            zoom=15, #large numbers = larger scale (i.e zoomed in)
            maptype='satellite', #also hybrid/terrain/roadmap
            scale = 2), #resolution scaling, 1 (low) or 2 (high)
            size = c(600, 600), #size of the image to grab
            extent='device', #can also be "normal" etc
            darken = 0) #you can dim the map when plotting on top
{% endhighlight %}



{% highlight text %}
## Error in get_googlemap(center = c(lon = Pt@data$lon, lat = Pt@data$lat), : object 'Pt' not found
{% endhighlight %}



{% highlight r %}
    #plot location on the image
      map+geom_point(data=Pt@data, aes(x=lon, y=lat),shape=16,color='orange',size=8)+
        geom_path(data=Poly,aes(x=long, y=lat),size=2,colour='green')
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'map' not found
{% endhighlight %}

- For interactive maps there are some new packages such as "leaflet" available (see https://rstudio.github.io/leaflet/)
- A newer version of leaflet (leafletR) is now available on CRAN
- Jeff is also developing a package (quickmapper) to interact with spatial objects.  He will demonstrate this later if there is time.



{% highlight r %}
#build the map without "pipes"
  m<-leaflet() #setup map
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): could not find function "leaflet"
{% endhighlight %}



{% highlight r %}
  m<-addTiles(m) #add open street map data
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): could not find function "addTiles"
{% endhighlight %}



{% highlight r %}
  m
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'm' not found
{% endhighlight %}



{% highlight r %}
  m<-addMarkers(m,lng=Pt@data$lon, lat=Pt@data$lat, popup="We R Here")  #add point location
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): could not find function "addMarkers"
{% endhighlight %}



{% highlight r %}
  m
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'm' not found
{% endhighlight %}



{% highlight r %}
  addPolygons(m,data=Poly, weight=2) #add polygon  
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): could not find function "addPolygons"
{% endhighlight %}



{% highlight r %}
  m
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'm' not found
{% endhighlight %}



{% highlight r %}
#or build the map with "pipes"
  leaflet() %>%   #setup map
  addTiles() %>%  #add open street map data
  addMarkers(lng=Pt@data$lon, lat=Pt@data$lat, popup="We R Here") %>%  #add point location 
  addPolygons(data=Poly, weight=2) #add polygon
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): could not find function "%>%"
{% endhighlight %}

- Now let's add in some raster data.
- The 2011 NLCD Data were downloaded from http://gisdata.usgs.gov/TDDS/DownloadFile.php?TYPE=nlcd2011&FNAME=nlcd_2011_landcover_2011_edition_2014_10_10.zip.
- This file was too big to save on github so the image was cropped to a 10km x 10km area around our current location. 
- The cropped image is saved as "NLCDpdx.tif"


{% highlight r %}
#get the NLCD grid data-to repeat this is time cosuming; the final raster is available on github
  NLCD<-raster('C:/Bryan/EPA/Data/nlcd_2011_landcover_2011_edition_2014_10_10/nlcd_2011_landcover_2011_edition_2014_10_10.img')  #change location to match your directory structure

#NLCD includes all lower 48 states.  Reduce to bbox(Pt) + 10km
    #reproject Pt to match NLCD
      PtAlb<-spTransform(Pt,proj4string(NLCD))  
      #define extent based on bbox(PtAlb)+100km
        B<-bbox(PtAlb)
        Add<-10000 
        Extent<-c(B[1,1]-Add,B[1,2]+Add,B[2,1]-Add,B[2,2]+Add)
      #Crop NLCD 
        NLCDpdx<-crop(NLCD,Extent)

#add colortable
  #get gex colors from Jeff's miscPackage
    ct <- system.file("extdata/nlcd_lookup.csv", package = "miscPackage")
    ct <- read.csv(ct, stringsAsFactors = FALSE)
  #add colors 1:256
    ctbl <- rep("#000000", 256)
  #update non-NULL colors
    ctbl[ct$code + 1] <- ct$hex
    NLCDpdx@legend@values <- ct$code
    NLCD@legend@colortable <- ctbl
    NLCD@legend@names <- ct$label

#export cropped NLCD as geotiff
  writeRaster(NLCDpdx, filename="NLCDpdx.tif", format="GTiff", overwrite=TRUE)
{% endhighlight %}

- reread and plot the NLCD data for the Portland area


{% highlight r %}
NLCD<-raster('NLCDpdx.tif')
{% endhighlight %}



{% highlight text %}
## Error in .rasterObjectFromFile(x, band = band, objecttype = "RasterLayer", : Cannot create a RasterLayer object from this file. (file does not exist)
{% endhighlight %}



{% highlight r %}
plot(NLCD)
{% endhighlight %}



{% highlight text %}
## Error in plot(NLCD): error in evaluating the argument 'x' in selecting a method for function 'plot': Error: object 'NLCD' not found
{% endhighlight %}

- add our location and surrounding polygon


{% highlight r %}
plot(NLCD)
{% endhighlight %}



{% highlight text %}
## Error in plot(NLCD): error in evaluating the argument 'x' in selecting a method for function 'plot': Error: object 'NLCD' not found
{% endhighlight %}



{% highlight r %}
plot(Poly,add=T,lwd=3,col='white')
{% endhighlight %}



{% highlight text %}
## Error in plot(Poly, add = T, lwd = 3, col = "white"): error in evaluating the argument 'x' in selecting a method for function 'plot': Error: object 'Poly' not found
{% endhighlight %}



{% highlight r %}
plot(Pt,add=T,pch=16,col='blue',cex=2) 
{% endhighlight %}



{% highlight text %}
## Error in plot(Pt, add = T, pch = 16, col = "blue", cex = 2): error in evaluating the argument 'x' in selecting a method for function 'plot': Error: object 'Pt' not found
{% endhighlight %}

- nothing happens due to differences in projection
- view projection information


{% highlight r %}
  #Coordinate reference system for the raster
    proj4string(NLCD)
{% endhighlight %}



{% highlight text %}
## Error in proj4string(NLCD): error in evaluating the argument 'obj' in selecting a method for function 'proj4string': Error: object 'NLCD' not found
{% endhighlight %}



{% highlight r %}
#Coordinate reference system for point location
    proj4string(Pt)
{% endhighlight %}



{% highlight text %}
## Error in proj4string(Pt): error in evaluating the argument 'obj' in selecting a method for function 'proj4string': Error: object 'Pt' not found
{% endhighlight %}



{% highlight r %}
#Coordinate reference system for polygon location
    proj4string(Poly)
{% endhighlight %}



{% highlight text %}
## Error in proj4string(Poly): error in evaluating the argument 'obj' in selecting a method for function 'proj4string': Error: object 'Poly' not found
{% endhighlight %}

- could change to the raster to WGS84 or 
- change the locations to Albers
- since we will want to keep albers for analysis convert the locations


{% highlight r %}
  #reproject Pt to match NLCD
      PtAlb<-spTransform(Pt,proj4string(NLCD))  
{% endhighlight %}



{% highlight text %}
## Error in spTransform(Pt, proj4string(NLCD)): error in evaluating the argument 'x' in selecting a method for function 'spTransform': Error: object 'Pt' not found
{% endhighlight %}



{% highlight r %}
  #reproject Polyg to match NLCD
      PolyAlb<-spTransform(Poly,proj4string(NLCD)) 
{% endhighlight %}



{% highlight text %}
## Error in spTransform(Poly, proj4string(NLCD)): error in evaluating the argument 'x' in selecting a method for function 'spTransform': Error: object 'Poly' not found
{% endhighlight %}

- now we can add Ptalb and Polyalb to the NLCD plot


{% highlight r %}
plot(NLCD)
{% endhighlight %}



{% highlight text %}
## Error in plot(NLCD): error in evaluating the argument 'x' in selecting a method for function 'plot': Error: object 'NLCD' not found
{% endhighlight %}



{% highlight r %}
plot(PtAlb,add=T,pch=4,col='white',cex=1.5,lwd=2) 
{% endhighlight %}



{% highlight text %}
## Error in plot(PtAlb, add = T, pch = 4, col = "white", cex = 1.5, lwd = 2): error in evaluating the argument 'x' in selecting a method for function 'plot': Error: object 'PtAlb' not found
{% endhighlight %}



{% highlight r %}
plot(PolyAlb,add=T,lwd=3,col=NA,border='black')
{% endhighlight %}



{% highlight text %}
## Error in plot(PolyAlb, add = T, lwd = 3, col = NA, border = "black"): error in evaluating the argument 'x' in selecting a method for function 'plot': Error: object 'PolyAlb' not found
{% endhighlight %}

- add a legend from color table 


{% highlight r %}
  #get color table
    ct <- system.file("extdata/nlcd_lookup.csv", package = "miscPackage")
    ct <- read.csv(ct, stringsAsFactors = FALSE)
  #need to replot the figure before adding legend for this to render in knitr
    plot(NLCD)
{% endhighlight %}



{% highlight text %}
## Error in plot(NLCD): error in evaluating the argument 'x' in selecting a method for function 'plot': Error: object 'NLCD' not found
{% endhighlight %}



{% highlight r %}
    plot(PolyAlb,add=T,lwd=3,col='white')
{% endhighlight %}



{% highlight text %}
## Error in plot(PolyAlb, add = T, lwd = 3, col = "white"): error in evaluating the argument 'x' in selecting a method for function 'plot': Error: object 'PolyAlb' not found
{% endhighlight %}



{% highlight r %}
    plot(PtAlb,add=T,pch=16,col='blue',cex=2) 
{% endhighlight %}



{% highlight text %}
## Error in plot(PtAlb, add = T, pch = 16, col = "blue", cex = 2): error in evaluating the argument 'x' in selecting a method for function 'plot': Error: object 'PtAlb' not found
{% endhighlight %}



{% highlight r %}
  #add legend
    legend('topright',ct$label,fill=ct$hex)
{% endhighlight %}



{% highlight text %}
## Error in strwidth(legend, units = "user", cex = cex, font = text.font): plot.new has not been called yet
{% endhighlight %}


