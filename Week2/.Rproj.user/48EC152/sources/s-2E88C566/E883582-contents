library(dplyr)
library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )
#q1
set.seed(1)
n <- 1000
mean <- vector('numeric', n)
for (i in 1:n){
  samples <- sample(x, 5)
  samples <- unlist(samples)
  mean[i] <- mean(samples)-mean(x)
}
hist(mean)
sum(abs(mean)>1)/n
#q2
set.seed(1)
n <- 10000
mean <- vector('numeric', n)
for (i in 1:n){
  samples <- sample(x, 5)
  samples <- unlist(samples)
  mean[i] <- mean(samples)-mean(x)
}
hist(mean)
sum(abs(mean)>1)/n
#q3
set.seed(1)
n <- 1000
mean <- vector('numeric', n)
for (i in 1:n){
  samples <- sample(x, 50)
  samples <- unlist(samples)
  mean[i] <- mean(samples)-mean(x)
}
hist(mean)
sum(abs(mean)>1)/n
