library(dplyr)
dat <- read.csv("mice_pheno.csv") #Previously downloaded 

controlPopulation <- filter(dat,Sex == "F" & Diet == "chow") %>%  
  select(Bodyweight) %>% unlist

hfPopulation <- filter(dat,Sex == "F" & Diet == "hf") %>%  
  select(Bodyweight) %>% unlist

mu_hf <- mean(hfPopulation)
mu_control <- mean(controlPopulation)
print(mu_hf - mu_control)
#percent increase
print(((mu_hf-mu_control)/mu_control)*100)

#type 2 error generally made for small sample size
set.seed(1)
N <- 5
hf <- sample(hfPopulation, N)
control <- sample(controlPopulation, N)
t.test(hf, control)$p.value

N<- 12
alpha <- 0.05
hf <- sample(hfPopulation, N)
control <- sample(controlPopulation, N)
t.test(hf, control)$p.value

N<- 30
alpha <- 0.05
hf <- sample(hfPopulation, N)
control <- sample(controlPopulation, N)
t.test(hf, control)$p.value

#power and type 2 error
N<- 12
alpha <- 0.05 #cutoff to reject null hypothesis
B <- 2000

reject <- function(N, alpha = 0.05){
  hf <- sample(hfPopulation, N)
  control <- sample(controlPopulation, N)
  pval <- t.test(hf, control)$p.value
  pval < alpha  
}
reject(12)

rejections <- replicate(B, reject(N))
#proportion of the time we rejected
power <- mean(rejections)
print(power)

Ns <- seq(5, 50, 5)

power <- sapply(Ns,function(N){
  rejections <- replicate(B, reject(N))
  mean(rejections)
})

plot(Ns, power, type="b")
