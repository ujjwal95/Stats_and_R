library(downloader)
library(dplyr)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)
bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist

#q1
N <- 10
B <- 1000
means <- vector('numeric', B)
set.seed(1)
nonsmokers <- sample(bwt.nonsmoke , N)
smokers <- sample(bwt.smoke , N)
obs <- mean(smokers) - mean(nonsmokers)
print(obs)
for (i in 1:B){
dat <- c(smokers,nonsmokers)
shuffle <- sample( dat )
smokersstar <- shuffle[1:N]
nonsmokersstar <- shuffle[(N+1):(2*N)]
means[i] <- mean(smokersstar)-mean(nonsmokersstar)
}
mean(abs(means)> 16.9)
mypar()
qqnorm(means)
abline(0,1)
qqline(means)

#q2
N <- 10
B <- 1000
medians <- vector('numeric', B)
set.seed(1)
nonsmokers <- sample(bwt.nonsmoke , N)
smokers <- sample(bwt.smoke , N)
obs <- median(smokers) - median(nonsmokers)
print(obs)
for (i in 1:B){
  dat <- c(smokers,nonsmokers)
  shuffle <- sample( dat )
  smokersstar <- shuffle[1:N]
  nonsmokersstar <- shuffle[(N+1):(2*N)]
  medians[i] <- median(smokersstar)-median(nonsmokersstar)
}
mean(abs(medians)> 23)
mypar()
qqnorm(medians)
abline(0,1)
qqline(medians)
