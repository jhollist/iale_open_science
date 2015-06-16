


## ----ggplot_install, eval=FALSE------------------------------------------
## install.packages("ggplot2")
## library("ggplot2")


## ----ggplot_examp--------------------------------------------------------
# aes() are the "aesthetics" info.  When you simply add the x and y
# that can seem a bit of a confusing term.  You also use aes() to 
# change color, shape, size etc. of some items 
iris_gg<-ggplot(iris,aes(x=Petal.Length,y=Petal.Width))


## ----points_examp--------------------------------------------------------
#Different syntax than you are used to
iris_gg + 
  geom_point()

#This too can be saved to an object
iris_scatter<-iris_gg +
                geom_point()

#Call it to create the plot
iris_scatter


## ----iris_labels---------------------------------------------------------
iris_scatter<-iris_scatter +
                labs(title="Iris Petal Morphology Relationship",
                     x="Petal Length", y="Petal Width")
iris_scatter


## ----iris_colors---------------------------------------------------------
iris_scatter<- iris_scatter +
                geom_point(aes(color=Species, shape=Species),size=5)
iris_scatter


## ----iris_loess----------------------------------------------------------
iris_scatter_loess<-iris_scatter +
                geom_smooth()
iris_scatter_loess


## ----iris_lm-------------------------------------------------------------
iris_scatter_lm<-iris_scatter +
                  geom_smooth(method="lm")
iris_scatter_lm


## ----iris_lm_groups------------------------------------------------------
iris_scatter_lm_group<-iris_scatter+
                        geom_smooth(method="lm", 
                                    aes(group=Species))
iris_scatter_lm_group


## ----iris_lm_color-------------------------------------------------------
iris_scatter_lm_color<-iris_scatter+
                        geom_smooth(method="lm", 
                                    aes(color=Species))
iris_scatter_lm_color


## ----gg_box_examp--------------------------------------------------------
ggplot(iris,aes(x=Species,y=Sepal.Width)) +
  geom_boxplot()


## ----gg_hist_examp-------------------------------------------------------
ggplot(iris,aes(x=Sepal.Width))+
  geom_histogram(binwidth=0.25)


## ----gg_bar_examp2-------------------------------------------------------
iris_species_mean<-group_by(iris,Species) %>%
                    summarize(mean_pl=mean(Petal.Length))
iris_meanpl_bar<-ggplot(iris_species_mean,aes(x=Species,y=mean_pl))+
  geom_bar(stat="identity")
iris_meanpl_bar


## ----Exercise1, echo=FALSE-----------------------------------------------


## ----themes_examp--------------------------------------------------------
scatter_p<-ggplot(iris,aes(x=Petal.Width,y=Petal.Length)) +
              geom_point(aes(colour=Species, shape=Species))
scatter_p


## ----themes_examp_custom-------------------------------------------------
scatter_p_base<-scatter_p + 
  theme(panel.background = element_blank(), 
        panel.grid = element_blank(),
        panel.border = element_rect(fill = NA),
        text=element_text(family="Times",colour="red",size=24))
scatter_p_base


## ----themes_examp_stock--------------------------------------------------
scatter_p + theme_bw()
scatter_p + theme_classic()


## ----themes_examp_polished-----------------------------------------------
#Now Let's start over, with some new colors and regression lines
scatter_polished <- ggplot(iris,aes(x=Petal.Width,y=Petal.Length)) +
              geom_point(aes(colour=Species, shape=Species)) +
              stat_smooth(method="lm", aes(colour=Species)) +
              scale_colour_manual(breaks = iris$Species,
                                  values= c("steelblue1",
                                            "sienna",
                                            "springgreen3")) + 
              theme_classic(18,"Times") +
              theme(text=element_text(colour="slategray")) +
              labs(title="Iris Petal Morphology Relationship",
                     x="Petal Length", y="Petal Width")
              

scatter_polished 


## ----ggsave_examp--------------------------------------------------------
#Save as jpg, with 600dpi, and set width and height
#Many other options in the help
ggsave(plot=scatter_polished,
       file="Fig1.jpg",dpi=600,width=8, heigh=5)
#Save as PDF
ggsave(plot=scatter_polished,
       file="Fig1.pdf")


## ----Exercise2, echo=FALSE-----------------------------------------------


## ----facet_grid_example--------------------------------------------------
#From the examples in H. Wickham. ggplot2: elegant graphics for data analysis. 
#Springer New York, 2009. 
#In particular the facet_grid help.
p <- ggplot(mtcars, aes(mpg, wt)) + geom_point()
# With one variable
p + facet_grid(cyl ~ .)
# With two variables
p + facet_grid(vs ~ am)




## ----facet_grid_nla, warning=FALSE, message=FALSE------------------------
tp_chla <- ggplot(nla_data,aes(x=log10(PTL),y=log10(CHLA))) + geom_point()

tp_chla + facet_grid(RT_NLA ~ .)

tp_chla +
  stat_smooth() +
  facet_grid(RT_NLA ~ LAKE_ORIGIN)


