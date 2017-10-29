install.packages('dplyr')
library(dplyr)

data <- read.csv('femaleMiceWeights.csv')
View(data)

mice_on_chow <- filter(data, Diet=='chow')
only_weights <- select(mice_on_chow, Bodyweight)
unlist(only_weights)

# pipe based commands pipe = %>%
mice_only_weights <- filter(data,Diet=='chow') %>% select(Bodyweight) %>% unlist