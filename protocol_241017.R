difftime("2018-12-24",Sys.Date(),units="days")
difftime("2018-12-24",Sys.Date(),units="mins")
difftime("2018-12-24",Sys.Date(),units="sec")

##################################################

library(sp,raster)  
germany <- getData("GADM",country="DEU",level=2)
plot(germany)
prec <- getData("worldclim",var="prec",res=.5,lon=10,lat=51)
plot(prec)

prec_ger1 <- crop(prec,germany) #crop prec to extent of ger
spplot(prec_ger1)

prec_ger2 <- mask(prec_ger1,germany) #mask prec to shape of ger
spplot(prec_ger2)

#if(!exists("largeData")) {
#  largeData <- read.csv("huge-file.csv",
#    header = TRUE)
#}

#################################################

eobs_var <- read.table("/home/fpohl/Dokumente/Masterthesis/EOBS/eobs_var.txt", header=TRUE)
head(eobs_var)

#######################

library(RCurl)
df <- read.csv("https://raw.githubusercontent.com/wegmann/R_data/master/Steigerwald_sample_points_all_data_subset_withNames.csv")
df

library("tidyverse")
df <- read.csv("sample_points_all_data_subset_withNames.csv")
df <- read.csv("https://raw.githubusercontent.com/wegmann/R_data/master/Steigerwald_sample_points_all_data_subset_withNames.csv")

head(df)
tail(df)
summary(df)
plot(df)
str(df)
names(df)
dim(df)
class(df)
levels(df)

X <- seq(1,100,by=2.5)
X
X[5:7]
X[length(X)-1]
length(X)

idx <- c(1,4,6)
X[idx]
X[-idx]
X>20
X[X>20|X>80]

summary(X)
sum(X)
cumsum(X)
rev(X)
sort(X,decreasing=TRUE)
sample(X,10)

df$LUCAS_LC # = df[,2]
df[1:10,]
df[1:10]
df[,c(2,13)]

plot(df$LUCAS_LC,df$SRTM)
plot(df$SRTM,df$LUCAS_LC)
