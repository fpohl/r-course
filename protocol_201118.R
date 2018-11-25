install.packages("suncalc")
install.packages("V8")
library(suncalc,V8)
getSunlightTimes(date=Sys.Date(),lat=49.782332, lon=9.970187,tz="CET")
mydate <- as.Date(c("2007-06-22"))
getSunlightTimes(date=mydate,lat=49.782332, lon=9.970187,tz="CET")

####################################################################################################

greet <- function(name) {
  paste0("How do you do, ",name,"?")
}
greet("Felix")

####################################################################################################

library(ggplot2)
x11()
x <- data.frame(x=1,y=1,label="ggplot2 introduction")
ggplot(data=x,aes(x=x,y=y)) + geom_text(aes(label=label),size=15)

library(readr)
baeume_steigi <- read_csv2("~/Dokumente/Masterthesis/Auswertung_Baumarten/baeume_steigi.csv")
head(baeume_steigi)
df <- data.frame(baeume_steigi)
head(df)
x11()
ggplot(df,aes(baum,gesamt)) + geom_point()
ggplot(df,aes(baum,gesamt)) + geom_point(alpha=.8)
ggplot(df,aes(x=baum)) + geom_bar() + labs(title="first plot",x="x axis \n and anew line")
ggplot(df,aes(baum)) + geom_bar(aes(gesamt))

####################################################################################################

ggplot(df,aes()) + geom_histogram()
ggplot(df,aes(gesamt,fill=gesamt)) + geom_density(alpha=.5)
ggplot(df)+
  geom_bar(aes(gesamt), fill="blue",color="darkgrey")+
  geom_density(aes(gesamt,..density..),colour="yellow")+
  geom_rug(aes(gesamt))

ggplot(df, aes(gesamt)) +
  geom_point(stat="count",size=6,alpha=.5)+
  coord_flip()+
  theme_bw()

ggplot(df, aes(baum,gesamt)) +
  geom_jitter(alpha=.5,width=.25,color="blue")+
  geom_boxplot()

ggplot(df, aes(baum,gesamt)) +
  geom_point(alpha=.5) + facet_grid(baum~.)

ggplot(df, aes(y=as.numeric(gesamt), x=baum)) +
  geom_bar( stat="identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  scale_y_continuous(breaks=seq(0,0.5,0.1))

  
#################################################################################################

df <- read.csv("https://raw.githubusercontent.com/wegmann/R_data/master/Steigerwald_sample_points_all_data_subset_withNames.csv")
head(df)

ggplot(df,aes(x=L8.ndvi,y=L8.savi)) + geom_point()
ggplot(df,aes(x=L8.ndvi,y=L8.savi,colour=SRTM)) + geom_point() + geom_smooth()
ggplot(df,aes(x=L8.ndvi,y=L8.savi,colour=SRTM)) + geom_point() + geom_smooth() + facet_wrap(~LCname)

ggplot(df,aes(x=L8.ndvi,y=L8.savi))+
  geom_point8aes(color=LCname),size=2)+
  facet_grid(. ~ LCname)

########################################################################################################

df <- read.csv("/home/fpohl/r-course/EUForestspecies.csv")
df_ger <- df[df$COUNTRY=="Germany",]
head(df_ger)
head(df)
plot(df_ger)
length(df_ger$COUNTRY)
ggplot(df_ger,aes(x=X,y=Y)) + geom_point(alpha=.1) 
ggplot(df_ger,aes(x=X,y=Y)) + geom_density2d
ggplot(df_ger,aes(x=X,y=Y)) + stat_density2d(aes(alpha=..level..), geom="polygon") + geom_point(colour="green",alpha=0.01,width=1)


k <- with(df_ger,MASS:::kde2d(x,y))
######################################################################################################

library(ggmap)
library(mapproj)
map.wue <- get_map("Frankfurt",source="osm")

######################################################################################################

lsat.df <- data.frame(coordinates(lsat),getValues(lsat))
lsat.df <- lsat.df[lsat.df$B3_dn!=0,]
ggplot(lsat.df)+
  geom_raster(aes(x=x,y=y,fill=B3_dn)) +
  scale_fill_gradient(na.value=NA) +
  coord_equal()

ggplot(lsat.df)+
  geom_raster(aes(x=x,y=y,fill=B3_dn)) +
  scale_fill_gradient(low="white",high="red",na.value=NA) +
  coord_equal()

#############################################################################

plotRGB(lsat,3,2,1)
plotRGB(lsat,3,2,1,stretch="lin")

library(RStoolbox)
ggR(lsat,layer=4,maxpixels = 1e6, stretch = "hist")
a <- ggR(lsat,layer=1,stretch="lin",geom_raster=TRUE)+
      scale_fill_gradient(low="blue",high="green")
a

poly <- readRDS(system.file("external/trainingPolygons.rds",package="RStoolbox"))
plots <- as.data.frame(coordinates(poly))

lim <- extent(lsat)
lim

