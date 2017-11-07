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