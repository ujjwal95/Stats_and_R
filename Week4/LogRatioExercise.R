library(UsingR)
time <- sort(nym.2002$time)

print(time)

#q1
print(time[1]/median(time))

#q2
print(time[length(time)]/median(time))

#q3
plot(time/median(time), ylim=c(1/4,4))
abline(h=c(1/2,1,2))

plot(log2(time/median(time)),ylim=c(-2,2))
abline(h=-1:1)

