install.packages('UsingR')
library(UsingR)

x <- father.son$fheight

# round(sample(x,20),1)

#------------ Histogram ---------------------------------#
#breaks is telling the function where to draw the intervals
hist(x, breaks = seq(floor(min(x)), ceiling(max(x))),main = "Height Histogram", xlab = "Height in inches", ylab = "Number of Fathers")

#------------ ECDF (Percentage function) ---------------------------------#
intervals <- seq(floor(min(x)), ceiling(max(x)), 0.1)
plot(intervals, ecdf(x)(intervals),type = 'l' , xlab = "Height in inches", ylab = "Fx")

#------------ Normal Approximation ---------------------------------#
#if data is normally distributed
mean(x<70)
pnorm(70, mean(x), sd(x))
#if it fits all the values, then normal distribution is a very good fit of the data

#------------ Q-Q Plot ---------------------------------#
# qqnorm(x)
# qqline(x)
ps <- seq(0,0.99, 0.001)
qs <- quantile(x,ps)
normalps <- qnorm(ps, mean(x), sd(x))
plot(normalps,qs,xlab = "Normal percentiles", ylab = "height percentiles")
abline(0,1)

#------------ Boxplot ---------------------------------#

hist(exec.pay)
#fat right tail
qqnorm(exec.pay)
qqline(exec.pay)

boxplot(exec.pay,ylab = "10,000s of Dollars", ylim=c(0,400))

#------------ Scatterplot ---------------------------------#

data("father.son")
x <- father.son$fheight
y <- father.son$sheight
#can show trends
plot(x,y, xlab = "Father's height in inches", ylab = "Son's height in inches", main = paste("correlation= ", signif(cor(x,y),2)))
     