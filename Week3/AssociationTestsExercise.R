d = read.csv('assoctest.csv')
library(dplyr)
library(rafalib)

#q1
?chisq.test
chisq.test(table(d))
View(d)
?table

#q2
fisher.test(table(d))

table(d)
