library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)
library(dplyr)
library(rafalib)

bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist
mean(bwt.nonsmoke)-mean(bwt.smoke)
popsd(bwt.nonsmoke)
popsd(bwt.smoke)

#q1
set.seed(1)
dat.ns <- sample(bwt.nonsmoke,size = 5)
dat.s <- sample(bwt.smoke,size = 5)
print(t.test(dat.ns,dat.s)$p.value)

#q2
set.seed(1)
B <- 10000
N <- 5
alpha <- 0.05
reject <- function(N, alpha = 0.05){
  dat.ns <- sample(bwt.nonsmoke,size = N)
  dat.s <- sample(bwt.smoke,size = N)
  p_value <- t.test(dat.ns,dat.s)$p.value
  p_value < alpha
}
rejections <- replicate(B, reject(N, alpha))
mean(rejections)
