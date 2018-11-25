install.packages("fortunes")
library(fortunes)
fortune()
fortune("memory")

install.packages("cowsay")
library(cowsay)
say("Hello world")

s1_say_hello <- function() {
  animal <- sample(names(animals),1)
  say(paste("Hello, I'm a ",animal,".",collapse=""),by = animal)
}
s1_say_hello()

s1_say_my_fortune <- function(x) {
  animal <- animal <- sample(names(animals),1)
  say(paste(fortune(),collapse="\n"),by=animal)
}
s1_say_my_fortune()

###############

df <- read.csv("https://raw.githubusercontent.com/wegmann/R_data/master/Steigerwald_sample_points_all_data_subset_withNames.csv")
spdf.obj <- df

df$SRTM
df$L7.ndvi[df$L7.ndvi<0.5]
df[df$SRTM,]
df$SRTM[1:10]
df$LCname
df$SRTM[df$L7.ndvi<0.5 & df$LCname=="conferious_woodland"]
df[grep(>0.5,df$L7.ndvi,ignore.case=T)]
df2 <- df[grep(>0.5,df$L7.ndvi,ignore.case=T)]
df2 <- subset(df,df$L7.ndvi>0.5)
df2
head(df2)

###########################
library(sp)
spdf.obj <- df
names(spdf.obj)
coordinates(spdf.obj) <- ~x+y
proj4string(spdf.obj) <- CRS("+init=epsg:32632")
library(rgdal)
writeOGR(spdf.obj,"sample_point_with_data.shp",driver="ESRI Shapefile","data")

###########################
install.packages("RStoolbox")
library(RStoolbox)
install.packages("rgeos")
library(rgeos)
library(raster)
r1 <- raster(nrows=100,ncols=100) #empty raster with 10x10 rows and colums
r1
plot(r1)
r1[] <- rnorm(100)
r1[] <- dnorm(100)
r1[] <- runif(1000)

df <- data.frame(measure1=runif(1000)*100,measure2=round(rnorm(1000)*100))
length(df$measure2)

r1 <- raster(nrows=100,ncols=100)
r1
r1[] <- df$measure1[1:1000]
plot(r1)
r2 <- raster(nrows=100,ncols=100)
r2[] <- df$measure2[1:1000]
plot(r2)
r12 <- stack(r1,r2)
r12
plot(r12$layer.1) #plot(r12[[1]])

r12$new <- r12$layer.1 *r12$layer.2^2
names(r12)
plot(r12)

df12 <- r12[] #back to data.frame
head(df12)

lsat[[1]]
lsat$B1_dn
plot(lsat[[1]])
x <- lsat[[2:3]]
plot(x)

data(lsat) #load/create example data
x <-lsat[1:10,] #values of rows one to ten of each band matrix, lsat has 287 columns and the first ten rows of the matrix are called: 2870 in total for each band
x <- lsat[]

#populate all bands with normally distributed data, ncells=number of entries
lsat[] <- rnorm(ncell(lsat))
lsat[lsat<0]

#######################################

a <- 5
if(a>0){
  print("HIV positive")
}

if(a!=5){
  print("number is not equal 5")
} else {
  print("number is equal 5")
}

j <- 0
while (j<1){
  print(j) ;  j <- j+0.1
}

func1 <- function(x,y){
  z <- x+y
  return(z)
}
func1(4,3)
