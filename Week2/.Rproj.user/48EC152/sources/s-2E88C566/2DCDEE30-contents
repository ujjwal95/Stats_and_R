install.packages('gapminder')
library(gapminder)
data <- gapminder
View(head(data))
library(dplyr)
x <- filter(data, year == 1952)
hist(x$lifeExp)
#q1
Fn <- ecdf(x$lifeExp)
Fn(40)
#q2
Fn(60)-Fn(40)
#sapply and ecdf
prop = function(a){
  mean(x$lifeExp<=a)  
}
prop(40)
qs = seq(from=min(x$lifeExp), to=max(x$lifeExp), length=20)
props = sapply(qs, prop)
plot(qs,props)
plot(Fn)
