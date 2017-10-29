2+2
data <- read.csv('femaleMiceWeights.csv')
x <- data[12,2]
show(x)
y <- data$Bodyweight[11]
show(y)
length(data$Diet)
mean(data[data$Diet == 'hf',]$Bodyweight)
set.seed(1)
z <- sample(data$Bodyweight[13:24],size = 1)
