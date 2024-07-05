rm(list = ls())  #removes all variables stored previously
library(Hmisc)   #import

data <- read.csv("C:/Users/RUTVIK/Downloads/COVID19_line_list_data.csv")
  View(data)

describe(data)

#cleaning up the data
data$death_dummy <- as.integer(data$death != 0)  #dollar sign used to create new column

#deathrate
sum(data$death_dummy) / nrow(data)
#death rate is 5.8%

#AGE
#analysis: to check if people who died are older in age.
dead=subset(data,death_dummy==1)      #in dataset people with deaths are termed as 1.
alive=subset(data,death_dummy==0)     #in dataset people who are alive are termed as 0.

mean(dead$age, na.rm=TRUE)    #average age of people who died is 68.58621
mean(alive$age, na.rm=TRUE)   #average age of people who lived is 48.07229

t.test(alive$age,dead$age,alternative="two.sided",conf.level = 0.95)
#if p value < 0.5 then data is considered significant

#so from above analysis we can say that majority of people who died due to covid were old .

