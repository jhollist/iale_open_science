## ----locationData, echo=TRUE, eval=FALSE---------------------------------
## #Our current location (from GoogleEarth) is:
##   Loc<-data.frame(lon=-122.68014,lat=45.517564,name='PDXhilton')
## 
## #The Coordinate reference system for GoogleEarth is WGS84 Decimal Degrees
##   WGS84<-CRS("+proj=longlat +datum=WGS84")  #ESRI GCS_WGS_1984
## 
## #From this we create SP object (Spatial Points Data Frame)
##   #A SpatialPoints object has the geographic information but no attributes
##     LocPt<-SpatialPoints(coordinates(Loc[,-3]),proj4string=WGS84)
##     class(LocPt) #class info for object
##     coordinates(LocPt) #coordinates of point
##   #A SpatialPointsDataFrame object has the geographic information plus attributes
##     LocPtDF<-SpatialPointsDataFrame(coordinates(Loc[,-3]),Loc,proj4string=WGS84)
##         class(LocPtDF) #class info for object
##         coordinates(LocPtDF) #coordinates of point
##         slotNames(LocPtDF) #get a list of the "slot" names for the object
##         LocPtDF@coords #slot method for listing coordinates
##         LocPtDF@bbox #bounding box of object
##         LocPtDF@proj4string #coordinate reference system for the object
## 
## #Let's also create a random polygon around our location
##   #coordinates for the polygon
##     Poly<-data.frame(Lon=c(-122.683461544862,-122.687996482959,-122.685670328434,-122.682541408927,-122.678202313853,-122.674828807098,-122.674485521254,-122.672769412589,-122.675904138992,-122.674481812434,-122.676631816156,-122.680281068949,-122.683461544862),Lat=c(45.5230187040173,45.5195152981109,45.5143352152495,45.5154464797329,45.512619192088,45.5138738461287,45.5167150399938,45.5190852959663,45.5192876717319,45.5216119799917,45.5235316111073,45.5213931392957,45.5230187040173))
## 
## #create SpatialPolygons Object
##   p<-Polygon(Poly) #convert coords to polygon
##   p1<- Polygons(list(p), ID=1) #add id variable
##   LocPoly<- SpatialPolygons(list(p1),proj4string=WGS84) #create SpatialPolygons object
## 
## #create SpatialPolygonsDataFrame Object
##   LocPolyDF<- SpatialPolygonsDataFrame(LocPoly,data.frame(Info='PolygonAroundPDXhilton')) #add field "Info" as an attribute to the polygon.
## 
## #write the spatial dataframe objects to shapefiles
##   writeOGR(LocPtDF,'.','LocPt', driver="ESRI Shapefile",overwrite_layer=TRUE)
##   writeOGR(LocPolyDF,'.','LocPoly', driver="ESRI Shapefile",overwrite_layer=TRUE)
## 
## #create KML file of locations with the maptools package
##   #point
##     kmlPoints(LocPtDF,
##               kmlfile='LocPt.kml',
##               name="Hilton",
##               description=paste("Our Current Location"),
##               icon="http://maps.google.com/mapfiles/kml/paddle/ltblu-stars.png",
##               kmlname="PDXhilton",
##               kmldescription="We R Here")
##     #open file in google earth
##       #shell.exec('LocPt.kml')
##   #polygon
##     kmlPolygon(LocPolyDF,
##               kmlfile='LocPoly.kml',
##               name="HiltonPoly",
##               description=paste("Random Polygon"),
##               lwd=5,border=2,
##               kmlname="HiltonPoly",
##               kmldescription="We R Here")
##     #open file in google earth
##       #shell.exec('LocPoly.kml')

## ----readSpatialData-----------------------------------------------------
# Using rgdal command - readOGR - we now read in the shapefiles of for our current location.
  #point location
    Pt<-readOGR('.',"LocPt")
  #Polygon location
    Poly<-readOGR('.',"LocPoly")

## ----plot_ggplot, message=FALSE------------------------------------------
  ggplot(Poly,aes(x=long, y=lat)) + geom_path() + geom_point(data=Pt@data, aes(x=lon, y=lat),shape=16,color='orange',size=8)

## ----plot_base-----------------------------------------------------------
  plot(Poly)
  plot(Pt,add=TRUE,pch=16,col='orange',cex=3)

## ----plot_ggmap, message=FALSE-------------------------------------------
    #get the image
      map<-ggmap(get_googlemap(center=c(lon=Pt@data$lon,lat=Pt@data$lat),
            zoom=15, #large numbers = larger scale (i.e zoomed in)
            maptype='satellite', #also hybrid/terrain/roadmap
            scale = 2), #resolution scaling, 1 (low) or 2 (high)
            size = c(600, 600), #size of the image to grab
            extent='device', #can also be "normal" etc
            darken = 0) #you can dim the map when plotting on top
    #plot location on the image
      map+geom_point(data=Pt@data, aes(x=lon, y=lat),shape=16,color='orange',size=8)+
        geom_path(data=Poly,aes(x=long, y=lat),size=2,colour='green')

## ----leaflet, message=FALSE----------------------------------------------
#build the map without "pipes"
  m<-leaflet() #setup map
  m<-addTiles(m) #add open street map data
  m
  m<-addMarkers(m,lng=Pt@data$lon, lat=Pt@data$lat, popup="We R Here")  #add point location
  m
  addPolygons(m,data=Poly, weight=2) #add polygon  
  m

#or build the map with "pipes"
  leaflet() %>%   #setup map
  addTiles() %>%  #add open street map data
  addMarkers(lng=Pt@data$lon, lat=Pt@data$lat, popup="We R Here") %>%  #add point location 
  addPolygons(data=Poly, weight=2) #add polygon
  

## ----cropNLCD, message=FALSE, echo=TRUE, eval=FALSE----------------------
## #get the NLCD grid data-to repeat this is time cosuming; the final raster is available on github
##   NLCD<-raster('C:/Bryan/EPA/Data/nlcd_2011_landcover_2011_edition_2014_10_10/nlcd_2011_landcover_2011_edition_2014_10_10.img')  #change location to match your directory structure
## 
## #NLCD includes all lower 48 states.  Reduce to bbox(Pt) + 10km
##     #reproject Pt to match NLCD
##       PtAlb<-spTransform(Pt,proj4string(NLCD))
##       #define extent based on bbox(PtAlb)+100km
##         B<-bbox(PtAlb)
##         Add<-10000
##         Extent<-c(B[1,1]-Add,B[1,2]+Add,B[2,1]-Add,B[2,2]+Add)
##       #Crop NLCD
##         NLCDpdx<-crop(NLCD,Extent)
## 
## #add colortable
##   #get gex colors from Jeff's miscPackage
##     ct <- system.file("extdata/nlcd_lookup.csv", package = "miscPackage")
##     ct <- read.csv(ct, stringsAsFactors = FALSE)
##   #add colors 1:256
##     ctbl <- rep("#000000", 256)
##   #update non-NULL colors
##     ctbl[ct$code + 1] <- ct$hex
##     NLCDpdx@legend@values <- ct$code
##     NLCD@legend@colortable <- ctbl
##     NLCD@legend@names <- ct$label
## 
## #export cropped NLCD as geotiff
##   writeRaster(NLCDpdx, filename="NLCDpdx.tif", format="GTiff", overwrite=TRUE)

## ----plotNLCD1, message=FALSE--------------------------------------------
NLCD<-raster('NLCDpdx.tif')
plot(NLCD)

## ----plotNLCD2, message=FALSE--------------------------------------------
plot(NLCD)
plot(Poly,add=T,lwd=3,col='white')
plot(Pt,add=T,pch=16,col='blue',cex=2) 

## ----proj4---------------------------------------------------------------
  #Coordinate reference system for the raster
    proj4string(NLCD)
#Coordinate reference system for point location
    proj4string(Pt)
#Coordinate reference system for polygon location
    proj4string(Poly)

## ----reproject-----------------------------------------------------------
  #reproject Pt to match NLCD
      PtAlb<-spTransform(Pt,proj4string(NLCD))  
  #reproject Polyg to match NLCD
      PolyAlb<-spTransform(Poly,proj4string(NLCD)) 

## ----plotNLCD3, message=FALSE--------------------------------------------
plot(NLCD)
plot(PtAlb,add=T,pch=4,col='white',cex=1.5,lwd=2) 
plot(PolyAlb,add=T,lwd=3,col=NA,border='black')


## ----legend1, message=FALSE----------------------------------------------
  #get color table
    ct <- system.file("extdata/nlcd_lookup.csv", package = "miscPackage")
    ct <- read.csv(ct, stringsAsFactors = FALSE)
  #need to replot the figure before adding legend for this to render in knitr
    plot(NLCD)
    plot(PolyAlb,add=T,lwd=3,col='white')
    plot(PtAlb,add=T,pch=16,col='blue',cex=2) 
  #add legend
    legend('topright',ct$label,fill=ct$hex)

