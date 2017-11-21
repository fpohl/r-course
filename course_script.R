############
#07-11-2017#
############

getwd() #setwd() 

my.df <- read.table("bio_data_forest.csv",
           header=TRUE,
           sep=""
           #dec=".",                #defines the decimal seperator
           #na.strings="NA",        #defines how NAs are identified, can be changed to e.g. a number
           #stringsAsFactors=TRUE  #if variables are converted to character type (FALSE)
           )

head(my.df)
summary(my.df)

##################

x <- matrix(c(4,7,3,8,9,2),nrow=2)
x
x[2,2]
x[,2]

################

number_1 <- rnorm(80,mean=0,sd=1)
mat_1 <- matrix(number_1,nrow=20,ncol=4)
mat_1

df_1 <- data.frame(mat_1)
names(df_1) <- c("var1","var2","var3","var4")
head(df_1)

################

x <- seq(1,100,by=2.4)
x
x[length(x)]
x[length(x)-1]
(x<=10)|(x>=30)
x[x<10|x>30]

###############

x2 <- numeric(length(x))
x2[x>=30] <- 1
x2[(x>30)&(x<70)] <- 2
x2[x>70] <- 3
x2

#alternative
library(car)
x2 <- recode(x, "0:30=1,30:70=2,else=3")

summary(x)
sum(x)
cumsum(x)

rev(x)
sort(x, decreasing=TRUE)
sample(x,10)

test <- data.frame(A=c(1,2,3),B=c("aB1","aB2","aB3"))
test
test$A

################################

df <- data.frame(plot="location_name_1", 
                 measure1=runif(100)*1000,
                 measure2=round(runif(100)*1000),
                 value=rnorm(100,2,1),
                 ID=rep(LETTERS,100)
                 )

df2 <- data.frame(plot="location_name_2", 
                 measure1=runif(50)*100,
                 measure2=round(runif(50)*10),
                 value=rnorm(50),
                 ID=rep(LETTERS,50)
                 )

df <- rbind(df,df2)
summary(df)
str(df)
mode(df)
head(df)

df[df$value<3.0 & df$value>2.0,]
df$new_col <- df$measure1*df$measure2
head(df)

######################################################

prec_avg[7]
plot(prec_avg[4:9])




#####################################################
#21.11.2017

a <- sqrt(9)
if(a*a != 9)
{print("R is great!")}

j<-0
while (j<1)
{print(j);j<-j+0.1}

#####################

anika <- function(x,y){
  z<-x+y
  return(z)
}
anika(10,3)

#####################

ndvi <- function()
  
  
####################

band_1<-raster("/home/fpohl/Dokumente/Sentinel-2/Sentinel_2_20160512.tif",band=1)
band_2<-raster("/home/fpohl/Dokumente/Sentinel-2/Sentinel_2_20160512.tif",band=2)

allbands<-stack(band_1,band_2)  
allbands<-brick("/home/fpohl/Dokumente/Sentinel-2/Sentinel_2_20160512.tif")  

img <- brick("/home/fpohl/Dokumente/Sentinel-2/Sentinel_2_20160512.tif")
img
plot(img)

plotRGB(allbands,4,3,2,stretch="lin")
ggRGB(allbands,4,3,2,stretch="lin")

#export raster . overwrite if already existent
writeRaster(img,datatype="FLT4S",filename="new_data.tif",format="GTiff",overwrite=TRUE)

#export a picture to GoogleEarth
KML(img,"/home/fpohl/Dokumente/Sentinel-2/Sentinel_2_20160512.tif",col=rainbow(255),maxpixel=100000)

plot(band_2)
ext <- drawExtent()

raster_sd<-calc(img,fun=sd)
fun <- function(x) {x/10}
raster_output <- calc(img,fun)
fun <- function(x) {x[is.na(x)] <- -999; return(x)}
raster_output <- calc(img,fun)

#regression analysis
#raster1 and raster2 have 5 layers,coeffiecients[2] is the slope
raster12 <- stack(raster_1,raster_2)
fun <- function(x) {lm(x[1:5] ~ x[6:10])$coefficients[2]}
raster_output <- calc(raster12,fun)

#write your permanent results directly to disk when calculating them
calc(img,fun=sd,filename="img_sd.grd")


#NDVI CALCULATION

lsat <- brick("/home/fpohl/Dokumente/Sentinel-2/Sentinel_2_20160512.tif")
ndvi <- (lsat[[4]]-lsat[[3]])/(lsat[[4]]+lsat[[3]])
plot(ndvi)

ndvi <- calc(lsat,fun=function(x){(x[,4]-x[,3])/(x[,4]+x[,3])})
plot(ndvi)

band_4 <- raster("/home/fpohl/Dokumente/Sentinel-2/Sentinel_2_20160512.tif",band=4)
band_3 <- raster("/home/fpohl/Dokumente/Sentinel-2/Sentinel_2_20160512.tif",band=3)

func_msavi <- function(nir,red){
  (2*nir+1-sqrt((2*nir+1)^2-8*(nir-red)))/2
  }

msavi <- overlay(band_4,band_3,fun=func_msavi)
plot(msavi)

#spectralIndices from RStoolbox
ndvi <- spectralIndices(lsat,red="B3_dn",nir="B4_dn",indices="NDVI")
