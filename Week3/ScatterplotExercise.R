library(UsingR)
library(dplyr)
library(rafalib)
data <- data(nym.2002, package="UsingR")

data_male <- filter(nym.2002, gender == "Male")
data_female <- filter(nym.2002, gender == "Female")

#q1
print(cor(data_male$time, data_male$age))

#q2
print(cor(data_female$time, data_female$age))

#q3
mypar(2,2)

means  <- tapply(data_male$time,floor(data_male$age/5)*5,mean)
plot(as.numeric(names(means)),means, main = "male times")

means  <- tapply(data_female$time,floor(data_female$age/5)*5,mean)
plot(as.numeric(names(means)),means, main = "female times")

data_male$age <- floor(data_male$age/5)*5
boxplot(data_male$time ~ data_male$age)

data_female$age <- floor(data_female$age/5)*5
boxplot(data_female$time ~ data_female$age)
