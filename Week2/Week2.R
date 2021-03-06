library(dplyr)
#import data
data <- read.csv('femaleMiceWeights.csv')
#separate data
control <- data[data$Diet=='chow',]$Bodyweight 
treatment <- data[data$Diet=='hf',]$Bodyweight
#comparison of averages
obs <- mean(treatment) - mean(control)
#original complete population
population <- read.csv('femaleControlsPopulation.csv')
population <- unlist(population)
#random variable
mean(sample(population,12))
#null hypothesis and p values
population <- read.csv('femaleControlsPopulation.csv')
population <- unlist(population)
# so we are saying in null hypothesis that high fibre diet has no effect on the weight,
# so we can simply draw out treatment data from the initial control population
n <- 10000
null_values <- vector('numeric',n)
for (i in 1:n){
  control <- sample(population, 12)
  treatment <- sample(population, 12)
  null_values[i] <- mean(treatment)- mean(control)
}
#null distribution
hist(null_values)
#p-value
p_value <- sum(abs(null_values) > obs)/n
#p_value <- sum(abs(null_values) > obs)/n
show(p_value)
#probability distributions
#normal distributions
#clt
#clt in practice
library(rafalib)
mypar()
?mypar
qqnorm(null_values)
qqline(null_values)
#t-test in practice
control <- data[data$Diet =='chow',]$Bodyweight
treatment <- data[data$Diet == 'hf',]$Bodyweight
N <- length(treatment)
se <- sqrt(var(treatment)/N+var(control)/N)
tstat <- (mean(treatment)-mean(control))/se
tstat
2* (1 - pnorm(tstat))
# t-test in practice
library(dplyr)
data <- read.csv('femaleMiceWeights.csv')
control <- data[data$Diet =='chow',]$Bodyweight
treatment <- data[data$Diet == 'hf',]$Bodyweight
ttest <- t.test(treatment,control)
ttest

qqnorm(control)
qqline(control)

qqnorm(treatment)
qqline(treatment)
