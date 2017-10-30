library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv"
if(!file.exists("femaleMiceWeights.csv")) download(url,destfile=filename)
dat <- read.csv(filename)
library(dplyr)
#q1
n <- 100
set.seed(1)
means <- replicate(10000, mean(sample(1:6,n, replace = TRUE)==6))
p <- 1/6
z <- (means - p) / sqrt(p*(1-p)/n)
mean(abs(z)>2)
#q2
mypar(2,2)
n <- 5
p <- 0.5
set.seed(1)
means <- replicate(10000, mean(sample(1:1/p,n, replace = TRUE)==1))
z <- (means - p) / sqrt(p*(1-p)/n)
mean(abs(z)>2)
qqnorm(z)
qqline(z)
n <- 30
p <- 0.5
set.seed(1)
means <- replicate(10000, mean(sample(1:1/p,n, replace = TRUE)==1))
z <- (means - p) / sqrt(p*(1-p)/n)
mean(abs(z)>2)
qqnorm(z)
qqline(z)
n <- 30
p <- 0.01
set.seed(1)
means <- replicate(10000, mean(sample(1:1/p,n, replace = TRUE)==1))
z <- (means - p) / sqrt(p*(1-p)/n)
mean(abs(z)>2)
qqnorm(z)
qqline(z)
n <- 100
p <- 0.01
set.seed(1)
means <- replicate(10000, mean(sample(1:1/p,n, replace = TRUE)==1))
z <- (means - p) / sqrt(p*(1-p)/n)
mean(abs(z)>2)
qqnorm(z)
qqline(z)
#q3
X <- filter(dat, Diet=="chow") %>% select(Bodyweight) %>% unlist
Y <- filter(dat, Diet=="hf") %>% select(Bodyweight) %>% unlist
Ux <- mean(X)
Ux
#q6
sqrt(var(X))
#q7
Xmean <- mean(X)
a <- (2/sqrt(var(X)))*sqrt(length(X))
a
?pnorm
2*(1-pnorm(2/sd(X) * sqrt(12) ))
#q8
b <- sqrt((var(X))/12+(var(Y))/12)
b
#q9
t_stat <- (mean(Y)-mean(X)) / b
t_stat
#q11
2*(1-pnorm(t_stat))
#q12
ttest <- t.test(X,Y)
ttest
