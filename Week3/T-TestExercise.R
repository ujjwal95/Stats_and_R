install.packages('downloader')
library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)
library(dplyr)
bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist
library(rafalib)
mean(bwt.nonsmoke)-mean(bwt.smoke)
popsd(bwt.nonsmoke)
popsd(bwt.smoke)
#q1
set.seed(1)
dat.ns <- sample(bwt.nonsmoke, size = 25)
dat.s <- sample(bwt.smoke, size = 25)
tval <- t.test(dat.ns,dat.s)
tval
#also
t_stat <- abs(mean(dat.s)-mean(dat.ns))/sqrt((var(dat.s)/length(dat.s))+(var(dat.ns)/length(dat.ns)))
t_stat
#q2
tval <- t_stat
2*(1-pnorm(tval))
#q3
2*pnorm(-abs(tval))
#q4
?qnorm
qnorm(0.995)*sqrt( (var(dat.ns)/25 + var(dat.s)/25)) 
