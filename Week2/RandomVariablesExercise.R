library(dplyr)

library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )
#q1
complete_mean <- mean(x)
#q2
set.seed(1)
sample <- sample(x, size = 5)
sample_mean <- mean(sample)
abs(complete_mean-sample_mean)
#q3
set.seed(5)
sample <- sample(x, size = 5)
sample_mean <- mean(sample)
abs(complete_mean-sample_mean)
