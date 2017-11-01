#q1
head(InsectSprays)

# boxplot(split(values, factor))
boxplot(InsectSprays$count ~ InsectSprays$spray)

#q2
library(dplyr)
data(nym.2002, package="UsingR")
library(rafalib)
males_times <- nym.2002[nym.2002$gender=='Male',]
males_times <- males_times$time
females_times <- nym.2002[nym.2002$gender=='Female',]
females_times <- females_times$time
mypar()
boxplot(nym.2002$time ~ nym.2002$gender)
histogram(males_times, breaks = seq(floor(min(males_times)), ceiling(max(males_times))))
histogram(females_times, breaks = seq(floor(min(females_times)), ceiling(max(females_times))))
qqnorm(males_times)
qqline(males_times)
qqnorm(females_times)
qqline(females_times)
