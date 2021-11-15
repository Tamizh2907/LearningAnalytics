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

ggplot(stepactivity, aes(week_number)) + geom_bar(stat="count") + 
  
  geom_text(stat='count', aes(label=..count..), vjust=-1) + ggtitle("Learners by week number") + theme_minimal()

#Analysis by step number

stepactivity %>%
  
  filter(week_number == "1") %>%
  
  ggplot(aes(step_number)) + geom_bar(stat="count") + 
  
  geom_text(stat='count', aes(label=..count..), vjust=-1) + ggtitle("Learners by step number - 1") + theme_minimal()


stepactivity %>%
  
  filter(week_number == "2") %>%
  
  ggplot(aes(step_number)) + geom_bar(stat="count") + 
  
  geom_text(stat='count', aes(label=..count..), vjust=-1) + ggtitle("Learners by step number - 2") + theme_minimal()


stepactivity %>%
  
  filter(week_number == "3") %>%
  
  ggplot(aes(step_number)) + geom_bar(stat="count") + 
  
  geom_text(stat='count', aes(label=..count..), vjust=-1) + ggtitle("Learners by step number - 3") + theme_minimal()


#Analysis by question response

questionresponse %>%
  
  filter(quiz_question != "") %>% unique(.) %>%

  ggplot(aes(correct)) + geom_bar(stat="count") +
  
  geom_text(stat='count', aes(label=..count..), vjust=-1) + ggtitle("Learners by responses") + theme_minimal()

questionresponse %>%
  
  filter(quiz_question != "") %>% unique(.) %>%
  
  ggplot(aes(fill = correct, x = quiz_question)) + geom_bar(position = "stack", stat="count") +
  
  geom_text(stat='count', aes(label=..count..), vjust=-1) + ggtitle("Learners for each question by responses") + theme_minimal()



#Analysis by weekly response

boxplot(week_number~experience_rating, data=weeklysurvey, main="Experience rating by week", 
          
        xlab="Week number", ylab="Experience rating")


#Analysis by archetypes

archetype %>%
  
  unique(.) %>%
  
  ggplot(aes(archetype)) + geom_bar(stat="count") +
  
  geom_text(stat='count', aes(label=..count..), vjust=-1) + ggtitle("Learners by archetypes") + theme_minimal()


finalmerge %>%
  
  filter(quiz_question != "NA") %>% filter(archetype != "NA") %>% unique(.) %>%
  
  ggplot(aes(fill = correct, x = archetype)) + geom_bar(position = "stack", stat="count") +
  
  geom_text(stat='count', aes(label=..count..), vjust=-1) + ggtitle("Learners for each question by responses") + theme_minimal()


#Analysis by video stats

videostats %>%
  
  unique(.) %>% group_by(step_position) %>%
  
  ggplot(aes(step_position, total_views)) + geom_bar(stat="identity") +
  
  ggtitle("Video watched by step position") + theme_minimal()


#Analysis by leaving survey

leavingsurvey %>%
  
  filter(last_completed_step != "NA") %>%
  
  ggplot(aes(last_completed_step)) + geom_bar(stat="count") +
  
  geom_text(stat='count', aes(label=..count..), vjust=-1) + 
  
  ggtitle("Leaving response by step number") + theme_minimal()


#Analysis by team members

teammembers %>%
  
  ggplot(aes(fill = user_role, team_role)) + geom_bar(position = "stack", stat="count") +
  
  geom_text(stat='count', aes(label=..count..), vjust=-1) + 
  
  ggtitle("Team members by enrolment role") + theme_minimal()



#Analysis by each run

enrolcompile %>%
  
  ggplot(aes(x = run, y = count)) + geom_line() + geom_point() +
  
  geom_label(aes(label = count)) + ggtitle("Number of enrolments in each run") + theme_minimal()
  
  

stepruncompile %>%
  
  ggplot(aes(x = run, y = count, group = week, color = as.factor(week))) + geom_line() + geom_point() +
  
  scale_color_manual(values=c('#FF0000','#0000FF', '#097969')) + geom_label(aes(label = count)) + labs(color = "week") +
  
  ggtitle("Number of visitors by week in each run") + theme_minimal()
  

quizruntruecompile %>%
  
  ggplot(aes(x = run, y = count, group = week, color = as.factor(week))) + geom_line() + geom_point() +
  
  scale_color_manual(values=c('#FF0000','#0000FF', '#097969')) + geom_label(aes(label = count)) + labs(color = "week") +
  
  ggtitle("Number of correct responses to quiz by week in each run") + theme_minimal()

quizrunfalsecompile %>%
  
  ggplot(aes(x = run, y = count, group = week, color = as.factor(week))) + geom_line() + geom_point() +
  
  scale_color_manual(values=c('#FF0000','#0000FF', '#097969')) + geom_label(aes(label = count)) + labs(color = "week") +
  
  ggtitle("Number of wrong responses to quiz by week in each run") + theme_minimal()


weeklycompile %>%
  
  ggplot(aes(x = rating, y = count, group = week, color = as.factor(week))) + geom_line() + geom_point() +
  
  scale_color_manual(values=c('#FF0000','#0000FF', '#097969')) + geom_label(aes(label = count)) + labs(color = "week") +
  
  ggtitle("Number of ratings by week in each run") + theme_minimal()


colorspalette = rainbow(13, s=0.6, v=0.9)

videostats %>%
  
  ggplot(aes(x = run_number, y = total_views, group = step_position, color = as.factor(step_position))) + geom_line() + geom_point() +
  
  scale_color_manual(values=colorspalette) + geom_label(aes(label = total_views)) + labs(color = "step_position") +
  
  ggtitle("Total views by step position in each run") + theme_minimal()



videostatsaggregate %>%
  
  ggplot(aes(x = step_position, y = viewed_fifty_percent)) + geom_line() + geom_point() +
  
  geom_label(aes(label = viewed_fifty_percent)) +
  
  ggtitle("Average fifty percent view by step position") + theme_minimal()


videostatsaggregate %>%
  
  ggplot(aes(x = step_position, y = viewed_onehundred_percent)) + geom_line() + geom_point() +
  
  geom_label(aes(label = viewed_onehundred_percent)) +
  
  ggtitle("Average hundred percent view by step position") + theme_minimal()


videostatsaggregaterun %>%
  
  ggplot(aes(x = run_number, y = viewed_fifty_percent)) + geom_line() + geom_point() +
  
  geom_label(aes(label = viewed_fifty_percent)) +
  
  ggtitle("Average fifty percent view by run") + theme_minimal()


videostatsaggregaterun %>%
  
  ggplot(aes(x = run_number, y = viewed_onehundred_percent)) + geom_line() + geom_point() +
  
  geom_label(aes(label = viewed_onehundred_percent)) +
  
  ggtitle("Average hundred percent view by run") + theme_minimal()


videostatsaggregaterun %>%
  
  ggplot(aes(x = run_number, y = viewed_onehundred_percent)) + geom_line() + geom_point() +
  
  geom_label(aes(label = viewed_onehundred_percent)) +
  
  ggtitle("Average hundred percent view by run") + theme_minimal()


videostatsaggregaterun %>%
  
  ggplot(aes(x = run_number, y = europe_views_percentage)) + geom_line() + geom_point() +
  
  geom_label(aes(label = europe_views_percentage)) +
  
  ggtitle("Europe percent view by run") + theme_minimal()


videostatsaggregaterun %>%
  
  ggplot(aes(x = run_number, y = oceania_views_percentage)) + geom_line() + geom_point() +
  
  geom_label(aes(label = oceania_views_percentage)) +
  
  ggtitle("Oceania percent view by run") + theme_minimal()


videostatsaggregaterun %>%
  
  ggplot(aes(x = run_number, y = asia_views_percentage)) + geom_line() + geom_point() +
  
  geom_label(aes(label = asia_views_percentage)) +
  
  ggtitle("Asia percent view by run") + theme_minimal()  


videostatsaggregaterun %>%
  
  ggplot(aes(x = run_number, y = north_america_views_percentage)) + geom_line() + geom_point() +
  
  geom_label(aes(label = north_america_views_percentage)) +
  
  ggtitle("North America percent view by run") + theme_minimal()


videostatsaggregaterun %>%
  
  ggplot(aes(x = run_number, y = south_america_views_percentage)) + geom_line() + geom_point() +
  
  geom_label(aes(label = south_america_views_percentage)) +
  
  ggtitle("South America percent view by run") + theme_minimal()  
  

videostatsaggregaterun %>%
  
  ggplot(aes(x = run_number, y = africa_views_percentage)) + geom_line() + geom_point() +
  
  geom_label(aes(label = africa_views_percentage)) +
  
  ggtitle("Africa percent view by run") + theme_minimal()


videostatsaggregaterun %>%
  
  ggplot(aes(x = run_number, y = desktop_device_percentage)) + geom_line() + geom_point() +
  
  geom_label(aes(label = desktop_device_percentage)) +
  
  ggtitle("Desktop percent view by run") + theme_minimal()


videostatsaggregaterun %>%
  
  ggplot(aes(x = run_number, y = mobile_device_percentage)) + geom_line() + geom_point() +
  
  geom_label(aes(label = mobile_device_percentage)) +
  
  ggtitle("Mobile percent view by run") + theme_minimal()


videostatsaggregaterun %>%
  
  ggplot(aes(x = run_number, y = tablet_device_percentage)) + geom_line() + geom_point() +
  
  geom_label(aes(label = tablet_device_percentage)) +
  
  ggtitle("Tablet percent view by run") + theme_minimal()










