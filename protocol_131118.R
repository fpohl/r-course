library(devtools)
devtools::install_github("gaborcsardi/praise")
library(praise)
praise()

devtools::install_github("brooke-watson/BRRR")
library(BRRR)
skrrrahh("drummaboy")


#########################

library(rgdal)
vector_file <- readOGR("sample_point_with_data.shp")
#writeOGR <- (vector_file,layer="vector_file",driver="GPKG")

install.packages("units")
install.packages("sf")
library(sf)

######################-

library(RStoolbox)
data(lsat)
raster_sd <- calc(lsat,fun=sd)
raster_sd <- calc(lsat,fun=sd,filename="lsat_sd.tif",options=c("COMPRESS=DEFLATE")) 

scaleFactor <- 1000
fun <- function(x) {
  (x - rowMeans(x) ) * scaleFactor
}

raster_output <- calc(lsat,fun,forcefun=T,filename="mystandardizedandscaled.tif",datatype="INT2S")
head(lsat)

writeRaster(lsat,datatype='FLT4S',filename='new_data.tif',format="GTiff",overwrite=T)
plotRGB(lsat)
plotRGB(lsat, r=1, g=2, b=3, maxpixels=5000)


###################

ndvi <- (lsat$nir - lsat$red) / (lsat$nir + lsat$red)
fun_ndvi=function(nir,red){(nir-red)/(nir+red)}
ndvi <- overlay(lsat$B4_dn,lsat$B3_dn,fun=fun_ndvi)

plot(ndvi)
fun_msavi=function(nir,red){(2*nir+1-sqrt((2*nir+1)^2-8*(nir-red)))/(2)}
msavi <- overlay(lsat$B4_dn,lsat$B3_dn,fun=fun_msavi)
plot(msavi)

ndvi <- spectralIndices(lsat,red="B3_dn",nir="B4_dn",indices="NDVI")
plot(ndvi)
VIs <-  spectralIndices(lsat,red="B3_dn",nir="B4_dn")

############################

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

