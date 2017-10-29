install.packages('downloader')

#download data
library(downloader)
url="https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- basename(url)
download(url,filename)

library(dplyr)
#read data
data <- read.csv('msleep_ggplot2.csv')
#q1
class(data)
#q2
nrow(data[data$order=='Primates',])
#q3
class(data[data$order=='Primates',])
#q4
class(select(data[data$order=='Primates',],sleep_total))
#q5
mean(data[data$order=='Primates',]$sleep_total)
#q6
summarise(filter(data, order == 'Primates'), mean = mean(sleep_total))
#or using pipe
filter(data, order == 'Primates') %>% summarise(mean = mean(sleep_total))
