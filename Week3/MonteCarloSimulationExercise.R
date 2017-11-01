#q1
set.seed(1)
x <- rnorm(5,mean = 0, sd = 1)
t_stat <- mean(x)/sd(x)*sqrt(5)
print(t_stat)

#q2
set.seed(1)
t_stat <- function(N, mean = 0, sd = 1){
  x <- rnorm(N, mean, sd)
  t_stat <- mean(x)/sd(x)*sqrt(N)
  return(t_stat)
}
B <- 1000
t_stats <- replicate(B, t_stat(5))
mean(t_stats> 2)

#q3
B <- 100
N <- 3
ps = seq(1/(B+1), 1-1/(B+1),len=B)
t_stats <- replicate(B, t_stat(N))
qt(ps, df = N-1)
qqplot(qt(ps, df = N-1), t_stats)
abline(0,1)

#q4
B <- 100
N <- 50
ps = seq(1/(B+1), 1-1/(B+1),len=B)
t_stat <- function(N, mean = 0, sd = 1){
  x <- rnorm(N, mean, sd)
  t_val <- t.test(x,var.equal = TRUE)$statistic
  return(t_val)
  }
t_stats <- replicate(B, t_stat(N))
qqplot(qt(ps, df = 2*N-2), t_stats, xlim = c(6,-6), ylim = c(6,-6))
abline(0,1)

#q5
B <- 100
N <- 15
ps = seq(1/(B+1), 1-1/(B+1),len=B)
t_stat <- function(N, mean = 0, sd = 1){
  X  <- sample(c(-1,1), N, replace=TRUE)
  t_val <- sqrt(N)*mean(X) / sd(X)
  return(t_val)
}
t_stats <- replicate(B, t_stat(N))
qqplot(qt(ps, df = N-1), t_stats, xlim = c(4,-4), ylim = c(4,-4))
abline(0,1)

#q6
B <- 100
N <- 1000
ps = seq(1/(B+1), 1-1/(B+1),len=B)
t_stat <- function(N, mean = 0, sd = 1){
  X  <- sample(c(-1,1), N, replace=TRUE)
  t_val <- sqrt(N)*mean(X) / sd(X)
  return(t_val)
}
t_stats <- replicate(B, t_stat(N))
qqplot(qt(ps, df = N-1), t_stats, xlim = c(4,-4), ylim = c(4,-4))
abline(0,1)

#q7
set.seed(1)
mypar(3,3)
Ns <- seq(5,45,5)
B <- 1000
t_stat <- function(N, mean = 0, sd = 1){
  x <- rnorm(N, mean, sd)
  t_stat <- median(x)
  return(t_stat)
}
for (n in Ns){
t_stats <- replicate(B, t_stat(n))
qqnorm(t_stats)
qqline(t_stats)
}
# ps = seq(1/(B+1), 1-1/(B+1),len=B)
# t_stats <- replicate(B, t_stat(N))
# qqplot(qt(ps, df = N-1), t_stats, xlim = c(4,-4), ylim = c(4,-4))
# abline(0,1)
