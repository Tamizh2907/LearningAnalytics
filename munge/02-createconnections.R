#Enrollment connection

enrolment = rbind(cybersecurity1enrolments, cybersecurity2enrolments, cybersecurity3enrolments, cybersecurity4enrolments,
                  
                  cybersecurity5enrolments, cybersecurity6enrolments, cybersecurity7enrolments)

#leaving survey responses

leavingsurvey = rbind(cybersecurity3leavingsurveyresponses, cybersecurity4leavingsurveyresponses, cybersecurity5leavingsurveyresponses,
                      
                      cybersecurity6leavingsurveyresponses, cybersecurity7leavingsurveyresponses)
                      

#question response

questionresponse = rbind(cybersecurity1questionresponse, cybersecurity2questionresponse, cybersecurity3questionresponse,
                         
                         cybersecurity4questionresponse, cybersecurity5questionresponse, cybersecurity6questionresponse,
                         
                         cybersecurity7questionresponse)



#sort based on a column

enrolment = enrolment[order(enrolment$learner_id),]

leavingsurvey = leavingsurvey[order(leavingsurvey$learner_id),]

questionresponse = questionresponse[order(questionresponse$learner_id),]

#clean leaving survey data

leavingsurvey$leaving_reason = iconv(leavingsurvey$leaving_reason, "latin1", "ASCII", sub="")

#drop NA

questionresponse = questionresponse[!(questionresponse$learner_id == ""),]

#run compile across enrollment, question response, leaving survey

question3unique = cybersecurity3questionresponse %>% group_by(learner_id) %>% filter(row_number() == 1)
  
leaving3unique = cybersecurity3leavingsurveyresponses %>% group_by(learner_id) %>% filter(row_number() == 1)
                          
merge1run3 = unique(merge(cybersecurity3enrolments, question3unique, by.x = "learner_id", by.y = "learner_id", all.x = TRUE))

finalmergerun3 = unique(merge(merge1run3, leaving3unique, by.x = "learner_id", by.y = "learner_id", all.x = TRUE))

finalmergerun3 = finalmergerun3[order(finalmergerun3$enrolled_at), ]


question4unique = cybersecurity4questionresponse %>% group_by(learner_id) %>% filter(row_number() == 1)

leaving4unique = cybersecurity4leavingsurveyresponses %>% group_by(learner_id) %>% filter(row_number() == 1)

merge1run4 = unique(merge(cybersecurity4enrolments, question4unique, by.x = "learner_id", by.y = "learner_id", all.x = TRUE))

finalmergerun4 = unique(merge(merge1run4, leaving4unique, by.x = "learner_id", by.y = "learner_id", all.x = TRUE))

finalmergerun4 = finalmergerun4[order(finalmergerun4$enrolled_at), ]


question5unique = cybersecurity5questionresponse %>% group_by(learner_id) %>% filter(row_number() == 1)

leaving5unique = cybersecurity5leavingsurveyresponses %>% group_by(learner_id) %>% filter(row_number() == 1)

merge1run5 = unique(merge(cybersecurity5enrolments, question5unique, by.x = "learner_id", by.y = "learner_id", all.x = TRUE))

finalmergerun5 = unique(merge(merge1run5, leaving5unique, by.x = "learner_id", by.y = "learner_id", all.x = TRUE))

finalmergerun5 = finalmergerun5[order(finalmergerun5$enrolled_at), ]


question6unique = cybersecurity6questionresponse %>% group_by(learner_id) %>% filter(row_number() == 1)

leaving6unique = cybersecurity6leavingsurveyresponses %>% group_by(learner_id) %>% filter(row_number() == 1)

merge1run6 = unique(merge(cybersecurity6enrolments, question6unique, by.x = "learner_id", by.y = "learner_id", all.x = TRUE))

finalmergerun6 = unique(merge(merge1run6, leaving6unique, by.x = "learner_id", by.y = "learner_id", all.x = TRUE))

finalmergerun6 = finalmergerun6[order(finalmergerun6$enrolled_at), ]


question7unique = cybersecurity7questionresponse %>% group_by(learner_id) %>% filter(row_number() == 1)

leaving7unique = cybersecurity7leavingsurveyresponses %>% group_by(learner_id) %>% filter(row_number() == 1)

merge1run7 = unique(merge(cybersecurity7enrolments, question7unique, by.x = "learner_id", by.y = "learner_id", all.x = TRUE))

finalmergerun7 = unique(merge(merge1run7, leaving7unique, by.x = "learner_id", by.y = "learner_id", all.x = TRUE))

finalmergerun7 = finalmergerun7[order(finalmergerun7$enrolled_at), ]



runcompilethreetoseven = rbind(finalmergerun3, finalmergerun4, finalmergerun5, finalmergerun6, finalmergerun7)

runcompilethreetoseven = runcompilethreetoseven[order(runcompilethreetoseven$learner_id),]

runcompilethreetoseven$leaving_reason = iconv(runcompilethreetoseven$leaving_reason, "latin1", "ASCII", sub="")

#to find count of learner_id and repetitions

tablefinalmergelearnerid = as.data.frame(table(enrolment$learner_id))


#compare enrollment of each run

enrolrun1 = c(run = 1, count = length(unique(cybersecurity1enrolments$learner_id)))

enrolrun2 = c(run = 2, count = length(unique(cybersecurity2enrolments$learner_id)))

enrolrun3 = c(run = 3, count = length(unique(cybersecurity3enrolments$learner_id)))

enrolrun4 = c(run = 4, count = length(unique(cybersecurity4enrolments$learner_id)))

enrolrun5 = c(run = 5, count = length(unique(cybersecurity5enrolments$learner_id)))

enrolrun6 = c(run = 6, count = length(unique(cybersecurity6enrolments$learner_id)))

enrolrun7 = c(run = 7, count = length(unique(cybersecurity7enrolments$learner_id)))

enrolcompile = data.frame(rbind(enrolrun1, enrolrun2, enrolrun3, enrolrun4, enrolrun5, enrolrun6, enrolrun7))


#compare by quiz responses

quizruntrue11 = c(week = 1, run = 1, count = length(unique(cybersecurity1questionresponse$learner_id[cybersecurity1questionresponse$week_number == 1 & cybersecurity1questionresponse$correct == "true"])))

quizruntrue12 = c(week = 1, run = 2, count = length(unique(cybersecurity2questionresponse$learner_id[cybersecurity2questionresponse$week_number == 1 & cybersecurity2questionresponse$correct == "true"])))

quizruntrue13 = c(week = 1, run = 3, count = length(unique(cybersecurity3questionresponse$learner_id[cybersecurity3questionresponse$week_number == 1 & cybersecurity3questionresponse$correct == "true"])))

quizruntrue14 = c(week = 1, run = 4, count = length(unique(cybersecurity4questionresponse$learner_id[cybersecurity4questionresponse$week_number == 1 & cybersecurity4questionresponse$correct == "true"])))

quizruntrue15 = c(week = 1, run = 5, count = length(unique(cybersecurity5questionresponse$learner_id[cybersecurity5questionresponse$week_number == 1 & cybersecurity5questionresponse$correct == "true"])))

quizruntrue16 = c(week = 1, run = 6, count = length(unique(cybersecurity6questionresponse$learner_id[cybersecurity6questionresponse$week_number == 1 & cybersecurity6questionresponse$correct == "true"])))

quizruntrue17 = c(week = 1, run = 7, count = length(unique(cybersecurity7questionresponse$learner_id[cybersecurity7questionresponse$week_number == 1 & cybersecurity7questionresponse$correct == "true"])))

quizruntrue21 = c(week = 2, run = 1, count = length(unique(cybersecurity1questionresponse$learner_id[cybersecurity1questionresponse$week_number == 2 & cybersecurity1questionresponse$correct == "true"])))

quizruntrue22 = c(week = 2, run = 2, count = length(unique(cybersecurity2questionresponse$learner_id[cybersecurity2questionresponse$week_number == 2 & cybersecurity2questionresponse$correct == "true"])))

quizruntrue23 = c(week = 2, run = 3, count = length(unique(cybersecurity3questionresponse$learner_id[cybersecurity3questionresponse$week_number == 2 & cybersecurity3questionresponse$correct == "true"])))

quizruntrue24 = c(week = 2, run = 4, count = length(unique(cybersecurity4questionresponse$learner_id[cybersecurity4questionresponse$week_number == 2 & cybersecurity4questionresponse$correct == "true"])))

quizruntrue25 = c(week = 2, run = 5, count = length(unique(cybersecurity5questionresponse$learner_id[cybersecurity5questionresponse$week_number == 2 & cybersecurity5questionresponse$correct == "true"])))

quizruntrue26 = c(week = 2, run = 6, count = length(unique(cybersecurity6questionresponse$learner_id[cybersecurity6questionresponse$week_number == 2 & cybersecurity6questionresponse$correct == "true"])))

quizruntrue27 = c(week = 2, run = 7, count = length(unique(cybersecurity7questionresponse$learner_id[cybersecurity7questionresponse$week_number == 2 & cybersecurity7questionresponse$correct == "true"])))

quizruntrue31 = c(week = 3, run = 1, count = length(unique(cybersecurity1questionresponse$learner_id[cybersecurity1questionresponse$week_number == 3 & cybersecurity1questionresponse$correct == "true"])))

quizruntrue32 = c(week = 3, run = 2, count = length(unique(cybersecurity2questionresponse$learner_id[cybersecurity2questionresponse$week_number == 3 & cybersecurity2questionresponse$correct == "true"])))

quizruntrue33 = c(week = 3, run = 3, count = length(unique(cybersecurity3questionresponse$learner_id[cybersecurity3questionresponse$week_number == 3 & cybersecurity3questionresponse$correct == "true"])))

quizruntrue34 = c(week = 3, run = 4, count = length(unique(cybersecurity4questionresponse$learner_id[cybersecurity4questionresponse$week_number == 3 & cybersecurity4questionresponse$correct == "true"])))

quizruntrue35 = c(week = 3, run = 5, count = length(unique(cybersecurity5questionresponse$learner_id[cybersecurity5questionresponse$week_number == 3 & cybersecurity5questionresponse$correct == "true"])))

quizruntrue36 = c(week = 3, run = 6, count = length(unique(cybersecurity6questionresponse$learner_id[cybersecurity6questionresponse$week_number == 3 & cybersecurity6questionresponse$correct == "true"])))

quizruntrue37 = c(week = 3, run = 7, count = length(unique(cybersecurity7questionresponse$learner_id[cybersecurity7questionresponse$week_number == 3 & cybersecurity7questionresponse$correct == "true"])))

quizrunfalse11 = c(week = 1, run = 1, count = length(unique(cybersecurity1questionresponse$learner_id[cybersecurity1questionresponse$week_number == 1 & cybersecurity1questionresponse$correct == "false"])))

quizrunfalse12 = c(week = 1, run = 2, count = length(unique(cybersecurity2questionresponse$learner_id[cybersecurity2questionresponse$week_number == 1 & cybersecurity2questionresponse$correct == "false"])))

quizrunfalse13 = c(week = 1, run = 3, count = length(unique(cybersecurity3questionresponse$learner_id[cybersecurity3questionresponse$week_number == 1 & cybersecurity3questionresponse$correct == "false"])))

quizrunfalse14 = c(week = 1, run = 4, count = length(unique(cybersecurity4questionresponse$learner_id[cybersecurity4questionresponse$week_number == 1 & cybersecurity4questionresponse$correct == "false"])))

quizrunfalse15 = c(week = 1, run = 5, count = length(unique(cybersecurity5questionresponse$learner_id[cybersecurity5questionresponse$week_number == 1 & cybersecurity5questionresponse$correct == "false"])))

quizrunfalse16 = c(week = 1, run = 6, count = length(unique(cybersecurity6questionresponse$learner_id[cybersecurity6questionresponse$week_number == 1 & cybersecurity6questionresponse$correct == "false"])))

quizrunfalse17 = c(week = 1, run = 7, count = length(unique(cybersecurity7questionresponse$learner_id[cybersecurity7questionresponse$week_number == 1 & cybersecurity7questionresponse$correct == "false"])))

quizrunfalse21 = c(week = 2, run = 1, count = length(unique(cybersecurity1questionresponse$learner_id[cybersecurity1questionresponse$week_number == 2 & cybersecurity1questionresponse$correct == "false"])))

quizrunfalse22 = c(week = 2, run = 2, count = length(unique(cybersecurity2questionresponse$learner_id[cybersecurity2questionresponse$week_number == 2 & cybersecurity2questionresponse$correct == "false"])))

quizrunfalse23 = c(week = 2, run = 3, count = length(unique(cybersecurity3questionresponse$learner_id[cybersecurity3questionresponse$week_number == 2 & cybersecurity3questionresponse$correct == "false"])))

quizrunfalse24 = c(week = 2, run = 4, count = length(unique(cybersecurity4questionresponse$learner_id[cybersecurity4questionresponse$week_number == 2 & cybersecurity4questionresponse$correct == "false"])))

quizrunfalse25 = c(week = 2, run = 5, count = length(unique(cybersecurity5questionresponse$learner_id[cybersecurity5questionresponse$week_number == 2 & cybersecurity5questionresponse$correct == "false"])))

quizrunfalse26 = c(week = 2, run = 6, count = length(unique(cybersecurity6questionresponse$learner_id[cybersecurity6questionresponse$week_number == 2 & cybersecurity6questionresponse$correct == "false"])))

quizrunfalse27 = c(week = 2, run = 7, count = length(unique(cybersecurity7questionresponse$learner_id[cybersecurity7questionresponse$week_number == 2 & cybersecurity7questionresponse$correct == "false"])))

quizrunfalse31 = c(week = 3, run = 1, count = length(unique(cybersecurity1questionresponse$learner_id[cybersecurity1questionresponse$week_number == 3 & cybersecurity1questionresponse$correct == "false"])))

quizrunfalse32 = c(week = 3, run = 2, count = length(unique(cybersecurity2questionresponse$learner_id[cybersecurity2questionresponse$week_number == 3 & cybersecurity2questionresponse$correct == "false"])))

quizrunfalse33 = c(week = 3, run = 3, count = length(unique(cybersecurity3questionresponse$learner_id[cybersecurity3questionresponse$week_number == 3 & cybersecurity3questionresponse$correct == "false"])))

quizrunfalse34 = c(week = 3, run = 4, count = length(unique(cybersecurity4questionresponse$learner_id[cybersecurity4questionresponse$week_number == 3 & cybersecurity4questionresponse$correct == "false"])))

quizrunfalse35 = c(week = 3, run = 5, count = length(unique(cybersecurity5questionresponse$learner_id[cybersecurity5questionresponse$week_number == 3 & cybersecurity5questionresponse$correct == "false"])))

quizrunfalse36 = c(week = 3, run = 6, count = length(unique(cybersecurity6questionresponse$learner_id[cybersecurity6questionresponse$week_number == 3 & cybersecurity6questionresponse$correct == "false"])))

quizrunfalse37 = c(week = 3, run = 7, count = length(unique(cybersecurity7questionresponse$learner_id[cybersecurity7questionresponse$week_number == 3 & cybersecurity7questionresponse$correct == "false"])))

quizruntruecompile = data.frame(rbind(quizruntrue11, quizruntrue12, quizruntrue13, quizruntrue14, quizruntrue15, quizruntrue16, quizruntrue17,
                                      
                                      quizruntrue21, quizruntrue22, quizruntrue23, quizruntrue24, quizruntrue25, quizruntrue26, quizruntrue27,
                                      
                                      quizruntrue31, quizruntrue32, quizruntrue33, quizruntrue34, quizruntrue35, quizruntrue36, quizruntrue37))

quizrunfalsecompile = data.frame(rbind(quizrunfalse11, quizrunfalse12, quizrunfalse13, quizrunfalse14, quizrunfalse15, quizrunfalse16, quizrunfalse17,
                                       
                                       quizrunfalse21, quizrunfalse22, quizrunfalse23, quizrunfalse24, quizrunfalse25, quizrunfalse26, quizrunfalse27,
                                       
                                       quizrunfalse31, quizrunfalse32, quizrunfalse33, quizrunfalse34, quizrunfalse35, quizrunfalse36, quizrunfalse37))


#compare leaving surveys

leavingrun1 = c(run = 1, count = length(unique(cybersecurity1leavingsurveyresponses$learner_id)))

leavingrun2 = c(run = 2, count = length(unique(cybersecurity2leavingsurveyresponses$learner_id)))

leavingrun3 = c(run = 3, count = length(unique(cybersecurity3leavingsurveyresponses$learner_id)))

leavingrun4 = c(run = 4, count = length(unique(cybersecurity4leavingsurveyresponses$learner_id)))

leavingrun5 = c(run = 5, count = length(unique(cybersecurity5leavingsurveyresponses$learner_id)))

leavingrun6 = c(run = 6, count = length(unique(cybersecurity6leavingsurveyresponses$learner_id)))

leavingrun7 = c(run = 7, count = length(unique(cybersecurity7leavingsurveyresponses$learner_id)))

leavingruncompile = data.frame(rbind(leavingrun1, leavingrun2, leavingrun3, leavingrun4,
                                     
                                     leavingrun5, leavingrun6, leavingrun7))


#working on final merge

enrolledwithoutboth = c(group = "Did not attempt the quiz and stayed in the course",
                        
                        count = length(runcompilethreetoseven$learner_id[is.na(runcompilethreetoseven$quiz_question) == TRUE & is.na(runcompilethreetoseven$left_at) == TRUE]))

enrolledwithoutleft = c(group = "Attempted the quiz and stayed in the course",
                        
                        count = length(runcompilethreetoseven$learner_id[is.na(runcompilethreetoseven$quiz_question) == FALSE & is.na(runcompilethreetoseven$left_at) == TRUE]))

enrolledwithoutquestion = c(group = "Did not attempt the quiz but left the course",
                            
                            count = length(runcompilethreetoseven$learner_id[is.na(runcompilethreetoseven$quiz_question) == TRUE & is.na(runcompilethreetoseven$left_at) == FALSE]))

enrolledwithboth = c(group = "Attempted the quiz but left the course",
                     
                     count = length(runcompilethreetoseven$learner_id[is.na(runcompilethreetoseven$quiz_question) == FALSE & is.na(runcompilethreetoseven$left_at) == FALSE]))


finalmergeuniquecompile = data.frame(rbind(enrolledwithoutboth, enrolledwithoutleft, enrolledwithoutquestion, enrolledwithboth))



leavingsteptop10 = data.frame(runcompilethreetoseven %>% 
  
  filter(is.na(last_completed_step_number) == FALSE) %>%
  
  group_by(last_completed_step) %>% tally())



leavingreasongroupbyeducation = data.frame(runcompilethreetoseven %>% 
  
  filter(is.na(leaving_reason) == FALSE) %>%
  
  group_by(leaving_reason, highest_education_level) %>% tally())


leavingreasongroupbyemployment = data.frame(runcompilethreetoseven %>% 
                                             
  filter(is.na(leaving_reason) == FALSE) %>%
                                             
  group_by(leaving_reason, employment_status) %>% tally())


leavingreasongroupbygender = data.frame(runcompilethreetoseven %>% 
                                       
  filter(is.na(leaving_reason) == FALSE) %>%
                                       
  group_by(leaving_reason, gender) %>% tally())


runcompilethreetosevenwithoutna = data.frame(runcompilethreetoseven %>%
                               
  filter(is.na(leaving_reason) == FALSE))


differenceintime = data.frame(ceiling(difftime(runcompilethreetosevenwithoutna$left_at, runcompilethreetosevenwithoutna$enrolled_at, units = "weeks")))

colnames(differenceintime)[1] = "weekinnumber"
