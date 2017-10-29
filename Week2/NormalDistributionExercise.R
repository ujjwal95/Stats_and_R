library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )
library(dplyr)
set.seed(1)
n <- 1000
mean_5 <- vector('numeric',n)
for (i in 1:n){
  sample <-sample(x,5)
  sample <- unlist(sample)
  mean_5[i] <- mean(sample)
}
n <- 1000
mean_50 <- vector('numeric',n)
for (i in 1:n){
  sample <-sample(x,50)
  sample <- unlist(sample)
  mean_50[i] <- mean(sample)
}
#q1
hist(mean_50)
hist(mean_5)
#q2
Fn <- ecdf(mean_50)
Fn(23)-Fn(25)
# or mean(mean_50 < 23) - mean(mean_50 < 25)
#q3
x <- rnorm(1000, mean = 23.9, sd = 0.43)
mean(x<25)-mean(x<23)
