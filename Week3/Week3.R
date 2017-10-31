set.seed(1)
library(dplyr)
chowPopulation <- read.csv('femaleControlsPopulation.csv')
chowPopulation <- unlist(chowPopulation)

mu_chow <- mean(chowPopulation)
print(mu_chow)

N <- 30
chow <- sample(chowPopulation, N)
print(mean(chow))

se <- sd(chow)/sqrt(N)
print(se)
#this is normal N(0,1) random variable
Q <- qnorm(1- 0.05/2)
-Q < (mean(chow)-mean(chowPopulation))/se < Q
interval <- c(mean(chow)-Q*se,mean(chow)+Q*se)
interval
interval[1]<mu_chow & mu_chow <interval[2]
