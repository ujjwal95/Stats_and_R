library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- read.csv(filename) 
library(dplyr)
dat <- na.omit( dat )
#q1
x <- filter(dat, (Diet == 'chow') & (Sex == 'M'))
x <- x$Bodyweight
mean(x)
#q2
install.packages('rafalib')
library(rafalib)
popsd(unlist(x))
#q3
set.seed(1)
x_sample <- mean(sample(x, size = 25))     
#q4
y <- filter(dat, Diet == 'hf' & Sex == 'M')
y <- y$Bodyweight
mean(y)
#q5
popsd(y)
#q6
set.seed(1)
y_sample <- mean(sample(y, size = 25))
#q7
diff_samples<- (mean(y) - mean(x)) - (mean(y_sample) - mean(x_sample))
diff_samples
#q8
x <- filter(dat, (Diet == 'chow') & (Sex == 'F'))
x <- x$Bodyweight
mean(x)
library(rafalib)
popsd(unlist(x))
set.seed(1)
x_sample <- mean(sample(x, size = 25))
y <- filter(dat, Diet == 'hf' & Sex == 'F')
y <- y$Bodyweight
mean(y)
popsd(y)
set.seed(1)
y_sample <- mean(sample(y, size = 25))
diff_samples<- abs((mean(y) - mean(x)) - (mean(y_sample) - mean(x_sample)))
diff_samples
