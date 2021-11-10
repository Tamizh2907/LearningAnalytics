#various analysis of data

library(tidyverse)

library(ggplot2)

install.packages("ggplot2movies")

library(ggplot2movies)

# Basic bar plot

#Analysis by age

ggplot(enrolment, aes(age_range)) + geom_bar(stat="count") + 
  
  geom_text(stat='count', aes(label=..count..), vjust=-1) + ggtitle("Count of enrolment by age") + theme_minimal()

#Analysis by gender

ggplot(enrolment, aes(gender)) + geom_bar(stat="count") + 
  
  geom_text(stat='count', aes(label=..count..), vjust=-1) + ggtitle("Count of enrolment by gender") + theme_minimal()

#Analysis by highest education

ggplot(enrolment, aes(highest_education_level)) + geom_bar(stat="count") + 
  
  geom_text(stat='count', aes(label=..count..), vjust=-1) + ggtitle("Count of enrolment by highest education level") + theme_minimal()

#Analysis by employment status

ggplot(enrolment, aes(employment_status)) + geom_bar(stat="count") + 
  
  geom_text(stat='count', aes(label=..count..), vjust=-1) + ggtitle("Count of enrolment by employment status") + theme_minimal()

#Analysis by week number

ggplot(finalmerge, aes(week_number.x)) + geom_bar(stat="count") + 
  
  geom_text(stat='count', aes(label=..count..), vjust=-1) + ggtitle("Learners by week number") + theme_minimal()

#Analysis by step number

finalmerge %>%
  
  filter(week_number.x == "1") %>%
  
  ggplot(aes(step_number)) + geom_bar(stat="count") + 
  
  geom_text(stat='count', aes(label=..count..), vjust=-1) + ggtitle("Learners by step number") + theme_minimal()


finalmerge %>%
  
  filter(week_number.x == "2") %>%
  
  ggplot(aes(step_number)) + geom_bar(stat="count") + 
  
  geom_text(stat='count', aes(label=..count..), vjust=-1) + ggtitle("Learners by step number") + theme_minimal()


finalmerge %>%
  
  filter(week_number.x == "3") %>%
  
  ggplot(aes(step_number)) + geom_bar(stat="count") + 
  
  geom_text(stat='count', aes(label=..count..), vjust=-1) + ggtitle("Learners by step number") + theme_minimal()
