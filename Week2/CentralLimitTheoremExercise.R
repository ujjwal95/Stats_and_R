library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- na.omit( read.csv(filename) )
library(dplyr)
#q1
?rnorm
x <- rnorm(10000)
sum(x<1 & x>-1)/length(x)
#q2
sum(x<2 & x>-2)/length(x)
#q3
sum(x<3 & x>-3)/length(x)
#q4
install.packages('rafalib')
library(rafalib)
?popsd
y <- filter(dat,Diet == 'chow' & Sex == 'M')
y <- y$Bodyweight
y <- as.vector(y)
sd_y <- popsd(y)
mean_y <- mean(y)
sum((y < mean_y+sd_y) & (y> mean_y-sd_y))/length(y)
#q5
sum((y < mean_y+sd_y*2) & (y> mean_y-sd_y*2))/length(y)
#q6
sum((y < mean_y+sd_y*3) & (y> mean_y-sd_y*3))/length(y)
#q7
?qqnorm
mypar(1,1)
z_score <- (dat$Bodyweight-mean(dat$Bodyweight))/popsd(dat$Bodyweight)
qqnorm(z_score)
qqline(z_score)
#q8
mypar(2,2)
y <- filter(dat, Sex == "M" & Diet == "chow") %>% select(Bodyweight) %>% unlist
z_score <- (y-mean(y))/popsd(y)
qqnorm(z_score)
qqline(z_score)
y <- filter(dat, Sex == "F" & Diet == "chow") %>% select(Bodyweight) %>% unlist
z_score <- (y-mean(y))/popsd(y)
qqnorm(z_score)
qqline(z_score)
y <- filter(dat, Sex == "M" & Diet == "hf") %>% select(Bodyweight) %>% unlist
z_score <- (y-mean(y))/popsd(y)
qqnorm(z_score)
qqline(z_score)
y <- filter(dat, Sex == "F" & Diet == "hf") %>% select(Bodyweight) %>% unlist
z_score <- (y-mean(y))/popsd(y)
qqnorm(z_score)
qqline(z_score)
#q9
sample_males <- filter(dat, Sex == 'M' & Diet == 'chow') %>% select(Bodyweight) %>% unlist
set.seed(1)
averages <- replicate(10000, mean(sample(sample_males,25)))
mypar(1,2)
hist(averages)
qqnorm(averages)
qqline(averages)
mean(averages)
popsd(averages)
