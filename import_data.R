setwd("/home/fpohl/Dokumente/Masterthesis/EOBS")
corma <- read.csv("correl_matrix.csv")
summary(corma)
head(corma)

install.packages("speedR",dependencies = TRUE)
install.packages("readOSD",dependencies = TRUE)
install.packages("ggplot2")
