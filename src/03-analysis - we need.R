#various analysis of data

# Basic bar plot

#Analysis by age

ggplot(enrolment, aes(age_range)) + geom_bar(stat="count") + 
  
  geom_text(stat='count', aes(label=..count..), vjust=-0.3) + 
  
  ggtitle("Count of enrolment by age") + theme_minimal() 

#Analysis by gender

ggplot(enrolment, aes(gender)) + geom_bar(stat="count") + 
  
  geom_text(stat='count', aes(label=..count..), vjust=-0.3) + 
  
  ggtitle("Count of enrolment by gender") + theme_minimal()

#Analysis by highest education

ggplot(enrolment, aes(highest_education_level)) + geom_bar(stat="count") + 
  
  geom_text(stat='count', aes(label=..count..), vjust=-0.3) +
  
  ggtitle("Count of enrolment by highest education level") + theme_minimal()

#Analysis by employment status

ggplot(enrolment, aes(employment_status)) + geom_bar(stat="count") + 
  
  geom_text(stat='count', aes(label=..count..), vjust=-0.3) + ggtitle("Count of enrolment by employment status") + 
  
  scale_x_discrete(labels = function(employment_status) str_wrap(employment_status, width = 10)) + theme_minimal()


#Analysis by question response

questionresponse %>%
  
  filter(quiz_question != "") %>% unique(.) %>%

  ggplot(aes(correct)) + geom_bar(stat="count") +
  
  geom_text(stat='count', aes(label=..count..), vjust = -0.3) + ggtitle("Learners by responses") + theme_minimal()


questionresponse %>%
  
  filter(quiz_question != "") %>% unique(.) %>%
  
  ggplot(aes(fill = correct, x = quiz_question)) + geom_bar(position = "stack", stat="count") +
  
  geom_text(stat='count', aes(label=..count..), position = position_stack(vjust=0.5)) + 
  
  ggtitle("Learners for each question by responses") + theme_minimal()


#Analysis by leaving survey

leavingsteptop10 %>%
  
  top_n(n=10, n) %>%
  
  ggplot(., aes(last_completed_step, n)) + geom_bar(stat="identity") +
  
  geom_text(stat='identity', aes(label=last_completed_step), vjust=1) + 
  
  geom_text(stat='identity', aes(label=n), vjust=-1) + 
  
  ggtitle("Leaving response by step number") + theme_minimal()


#Analysis by each run

enrolcompile %>%
  
  ggplot(aes(x = run, y = count)) + geom_line() + geom_point() +
  
  geom_label(aes(label = count)) + ggtitle("Number of enrolments in each run") + theme_minimal()
  

quizruntruecompile %>%
  
  ggplot(aes(x = run, y = count, group = week, color = as.factor(week))) + geom_line() + geom_point() +
  
  scale_color_manual(values=c('#FF0000','#0000FF', '#097969')) + geom_label(aes(label = count)) + labs(color = "week") +
  
  ggtitle("Number of correct responses to quiz by week in each run") + theme_minimal()


quizrunfalsecompile %>%
  
  ggplot(aes(x = run, y = count, group = week, color = as.factor(week))) + geom_line() + geom_point() +
  
  scale_color_manual(values=c('#FF0000','#0000FF', '#097969')) + geom_label(aes(label = count)) + labs(color = "week") +
  
  ggtitle("Number of wrong responses to quiz by week in each run") + theme_minimal()


#leaving survey

leavingruncompile %>%
  
  ggplot(aes(x = run, y = count)) + geom_line() + geom_point() +
  
  geom_label(aes(label = count)) +
  
  ggtitle("Number of leaving learners by run") + theme_minimal()


runcompilethreetoseven %>%
  
  filter(is.na(leaving_reason) == FALSE) %>%
  
  ggplot(aes(leaving_reason)) + geom_bar(stat="count") +
  
  geom_text(stat='count', aes(label=..count..), vjust=-0.3) + 
  
  scale_x_discrete(labels = function(leaving_reason) str_wrap(leaving_reason, width = 10)) + ggtitle("Number of leaving learners by reason") + theme_minimal()


#comparison

finalmergeuniquecompile %>%
  
  ggplot(aes(x = group, y = as.integer(count))) + geom_bar(stat="identity") + geom_text(stat = "identity", aes(label = count), vjust = -0.3) +
  
  scale_x_discrete(labels = function(group) str_wrap(group, width = 10)) +
  
  ggtitle("Plot to show learner's charecters") + theme_minimal()


tablefinalmergelearnerid %>%
  
  ggplot(aes(Freq)) + geom_bar(stat="count") +
  
  geom_text(stat='count', aes(label=..count..), vjust=-0.3) +
  
  ggtitle("Number of learners who enrolled multiple courses") + theme_minimal()


leavingreasongroupbygender %>%
  
  filter(gender != "Unknown") %>%
  
  ggplot(aes(x = leaving_reason, y = n, group = gender, color = as.factor(gender))) + geom_line() + geom_point() +
  
  geom_label(aes(label = n)) + labs(color = "gender") + scale_x_discrete(labels = function(leaving_reason) str_wrap(leaving_reason, width = 10)) +
  
  ggtitle("Leaving reason by gender") + theme_minimal()



leavingreasongroupbyeducation %>%
  
  filter(highest_education_level != "Unknown") %>%
  
  ggplot(aes(x = leaving_reason, y = n, group = highest_education_level, color = as.factor(highest_education_level))) + geom_line() + geom_point() +
  
  geom_label(aes(label = n)) + labs(color = "highest_education_level") + scale_x_discrete(labels = function(leaving_reason) str_wrap(leaving_reason, width = 10)) +
  
  ggtitle("Leaving reason by highest education level") + theme_minimal()


leavingreasongroupbyemployment %>%
  
  filter(employment_status != "Unknown") %>%
  
  ggplot(aes(x = leaving_reason, y = n, group = employment_status, color = as.factor(employment_status))) + geom_line() + geom_point() +
  
  geom_label(aes(label = n)) + labs(color = "employment_status") + scale_x_discrete(labels = function(leaving_reason) str_wrap(leaving_reason, width = 10)) +
  
  ggtitle("Leaving reason by employment status") + theme_minimal()


differenceintime %>%
  
  ggplot(aes(weekinnumber)) + geom_bar(stat="count") +
  
  geom_text(stat='count', aes(label=..count..), vjust=-0.3) + scale_x_continuous(expand = c(0,0)) +
  
  ggtitle("Number of learners against number of weeks they enrolled in") + theme_minimal()





