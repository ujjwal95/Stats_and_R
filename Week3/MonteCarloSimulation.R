set.seed(1)

library(rafalib)

dat <- read.csv('mice_pheno.csv')
controlPopulation <- read.csv('femaleControlsPopulation.csv')
controlPopulation <- unlist(controlPopulation)

ttestgenerator <- function(n){
  #assume the null hypothesis is true
  cases <- sample(controlPopulation,n)
  controls <- sample(controlPopulation,n)
  tstat <- (mean(cases)-mean(controls))/sqrt((var(cases)/length(cases))+(var(controls)/length(controls)))
  return(tstat)
}

tstats <- replicate(1000,ttestgenerator(10))
hist(tstats)
qqnorm(tstats)
qqline(tstats)

tstats <- replicate(1000,ttestgenerator(3))
hist(tstats)
qqnorm(tstats)
qqline(tstats)

ps <- (seq(0,999)+0.5)/1000
qqplot(qt(ps, df = 2*3-2),tstats, xlim = c(6,-6), ylim = c(6,-6))
abline(0,1)

qqnorm(controlPopulation)
qqline(controlPopulation)

#here we generate the population data
controls <- rnorm(5000, mean = 24, sd = 3.5)

ttestgenerator <- function(n, mean = 24, sd = 3.5){
  cases <- rnorm(n, mean, sd)
  controls <- rnorm(n, mean, sd)
  tstat <- (mean(cases)-mean(controls))/sqrt((var(cases)/length(cases))+(var(controls)/length(controls)))
  return(tstat)
}

ttests <- replicate(1000, ttestgenerator(3))
qqnorm(ttests)
qqline(ttests)
ps <- (seq(0,999)+0.5)/1000
qqplot(qt(ps, df = 2*3-2),ttests, xlim = c(6,-6), ylim = c(6,-6))
abline(0,1)
