library(UsingR)

head(ChickWeight)

plot( ChickWeight$Time, ChickWeight$weight, col=ChickWeight$Diet)

chick = reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time",direction="wide")

head(chick)
chick = na.omit(chick)

#q1
mean(c(chick$weight.4,3000))/mean(chick$weight.4)

#q2
median(c(chick$weight.4,3000))/median(chick$weight.4)

#q3
sd(c(chick$weight.4,3000))/sd(chick$weight.4)

#q4
mad(c(chick$weight.4,3000))/mad(chick$weight.4)

#q5
plot( ChickWeight[ChickWeight$Time==4 | ChickWeight$Time==21,]$Time, ChickWeight[ChickWeight$Time==4 | ChickWeight$Time==21,]$weight, col=ChickWeight[ChickWeight$Time==4 | ChickWeight$Time==21,]$Diet)
cor(c(chick$weight.4, 3000), c(chick$weight.21,3000))/cor(chick$weight.4, chick$weight.21)
