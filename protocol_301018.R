install.packages("fun")
library(fun)
if (.Platform$OS.type == "windows") x11() else x11(type="Xlib")
mine_sweeper()
gomoku()

install.packages("tkrplot")
install.packages("sudoku",requiries=TRUE)
install.packages("sudoku")
library(sudoku,tkrplot)
library(tkrplot)
playSudoku()
##############################

install.packages("devtools")
library(devtools)
devtools::install_github("zumbov2/colorfindr")
install.packages("colorfindr",requiries=TRUE)
library(colorfindr)

# Plot (5000 randomly selected pixels)
get_colors("https://upload.wikimedia.org/wikipedia/commons/f/f4/The_Scream.jpg") %>% 
  plot_colors_3d(sample_size = 5000, marker_size = 2.5, color_space = "RGB")

#################################

x <- seq(1,100,by=2.5)
x2 <- numeric(length(X))
length(x2)
numeric(length(x2))
x2[x<=30] <- 1

install.packages("car")
library(car)
x2 <- recode(x,"0:30=1; 30:70=2; else=3")
x2

rev(x)
sort(x,decreasing=TRUE)
sample(X,10)

############################### MATRIX ###

m1 <- matrix(c(4,7,3,8,9,2),nrow=2)
m2 <- matrix(
   c(2,4,3,1,5,7), #data elements
   nrow=2, #number of rows
   ncol=3, #number of columns
   byrow=TRUE) #fill matrix by rows

m1+m2
m1[,2] #column
m1[2,] #row

numbers_1 <- rnorm(80,mean=0,sd=1)
mat_1 <- matrix(numbers_1,nrow=20,ncol=4)
mat_1

df_1 <- data.frame(mat_1)
names(df_1) <- c("var1","var2","var3","var4")
df_1
head(df_1)

test <- data.frame(A=c(1,2,3),B=c("aB1","aB2","aB3"))
test$A

#################################################

df_1 <- data.frame(
  plot="location_name_1", 
  measure1=runif(100)*1000, #equal distribution w/ number of observation
  measure2=round(runif(100)*100), #rounding of numbers
  value=rnorm(100,2,1), #name of column and its data, rnorm=normal distribution
  ID=rep(LETTERS,100) #LETTERS=in-build constants
)

df_2 <- data.frame(
  plot="location_name_2",
  measure1=runif(50)*100,
  measure2=round(runif(50)*10),
  value=rnorm(50),
  ID=rep(LETTERS,50)
)

df <- rbind(df_1,df_2) #combine two data frame row-wise (alternative cbind)
head(df)
str(df)
mode(df)


df[1:3,c('plot','measure1','measure2')]

a <- runif(199)
b <- c("aa","bb","cc","dd","ee")
c <- list(a,b)
c[2]

a <- list(obj_1=runif(100),obj_2=c("aa","bb"),obj_3=c(1,2,4))
a$obj_2
df[df$value > 3.0 & df$measure1 > 500., 2]
df[df$value > 3.0 | df$measure1 > 500., 2]

df$new_col <- df$measure1*df$measure2
df[grep("a",df$ID, ignore.case=T),]

###########################################

x1 <- rbinom(10,size=1,prob=0.5)
x2 <- factor(x1,labels=c("yes","no"))
summary(x2)
levels(x2)
x2
as.character(x2)

library(car)
recode(x2,"'yes'='sure';'no'='maybe'")
ifelse(x2=="no","maybe","sure") #if statement is true, use "maybe" if not use "sure"

########################################

df <- read.csv("https://raw.githubusercontent.com/wegmann/R_data/master/Steigerwald_sample_points_all_data_subset_withNames.csv")
spdf.obj <- df
names(spdf.obj)
library(sp)
coordinates(spdf.obj) <- ~x+y
writeOGR(spdf.obj,"sample_point_with_data.shp",driver="ESRI Shapefile","data")
install.packages("rgdal")
library(rgdal)
