load('skew.RData')
dim(dat)

par(mfrow= c(3,3))

for (i in 1:9) {
  qqnorm(dat[,i])
  abline(0,1)
  }

