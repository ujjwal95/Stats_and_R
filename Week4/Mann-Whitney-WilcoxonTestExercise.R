chick = reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time",
                direction="wide")

chick = na.omit(chick)

#q1
x<- chick[chick$Diet==1,]$weight.4
y<- chick[chick$Diet==4,]$weight.4
t_test <- t.test(x,y)
wilcox_test <- wilcox.test(x,y)
t_test <- t.test(c(x,200),y)
t_test$p.value

#q2
wilcox_test <- wilcox.test(c(x,200),y)

#q3
library(rafalib)
mypar(1,3)
boxplot(x,y)
boxplot(x,y+10)
boxplot(x,y+100)
print(t.test(x,y+10)$statistic-t.test(x,y+100)$statistic)

#q4
wilcox.test(c(1,2,3),c(4,5,6))$p.value

#q5
wilcox.test(c(1,2,3),c(400,500,600))$p.value
