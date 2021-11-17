#Enrollment connection

enrolment = rbind(cybersecurity1enrolments, cybersecurity2enrolments, cybersecurity3enrolments, cybersecurity4enrolments,
                  
                  cybersecurity5enrolments, cybersecurity6enrolments, cybersecurity7enrolments)

#archetype connection

archetype = rbind(cybersecurity1archetypesurveyresponses, cybersecurity2archetypesurveyresponses, cybersecurity3archetypesurveyresponses,
                  
                  cybersecurity4archetypesurveyresponses, cybersecurity5archetypesurveyresponses, cybersecurity6archetypesurveyresponses,
                  
                  cybersecurity7archetypesurveyresponses)

#leaving survey responses

leavingsurvey = rbind(cybersecurity1leavingsurveyresponses, cybersecurity2leavingsurveyresponses, cybersecurity3leavingsurveyresponses,
                      
                      cybersecurity4leavingsurveyresponses, cybersecurity5leavingsurveyresponses, cybersecurity6leavingsurveyresponses,
                      
                      cybersecurity7leavingsurveyresponses)

#question response

questionresponse = rbind(cybersecurity1questionresponse, cybersecurity2questionresponse, cybersecurity3questionresponse,
                         
                         cybersecurity4questionresponse, cybersecurity5questionresponse, cybersecurity6questionresponse,
                         
                         cybersecurity7questionresponse)

#step activity

stepactivity = rbind(cybersecurity1stepactivity, cybersecurity2stepactivity, cybersecurity3stepactivity,
                     
                     cybersecurity4stepactivity, cybersecurity5stepactivity, cybersecurity6stepactivity,
                     
                     cybersecurity7stepactivity)

#weekly sentiment survey

weeklysurvey = rbind(cybersecurity1weeklysentimentsurveyresponses, cybersecurity2weeklysentimentsurveyresponses,
                     
                     cybersecurity3weeklysentimentsurveyresponses, cybersecurity4weeklysentimentsurveyresponses,
                     
                     cybersecurity5weeklysentimentsurveyresponses, cybersecurity6weeklysentimentsurveyresponses,
                     
                     cybersecurity7weeklysentimentsurveyresponses)

#team members

teammembers = rbind(cybersecurity2teammembers, cybersecurity3teammembers, cybersecurity4teammembers, cybersecurity5teammembers,
                    
                    cybersecurity6teammembers, cybersecurity7teammembers)

#video stats

videostats = rbind(cybersecurity3videostats, cybersecurity4videostats, cybersecurity5videostats, cybersecurity6videostats,
                   
                   cybersecurity7videostats)

#sort based on a column

enrolment = enrolment[order(enrolment$learner_id),]

archetype = archetype[order(archetype$learner_id),]

leavingsurvey = leavingsurvey[order(leavingsurvey$learner_id),]

questionresponse = questionresponse[order(questionresponse$learner_id),]

stepactivity = stepactivity[order(stepactivity$learner_id),]

weeklysurvey = weeklysurvey[order(weeklysurvey$id),]

teammembers = teammembers[order(teammembers$id),]

videostats = videostats[order(videostats$step_position),]

#drop NA

questionresponse = questionresponse[!(questionresponse$learner_id == ""),]

#merge data frames

merge1 = unique(merge(enrolment, stepactivity, by.x = "learner_id", by.y = "learner_id", all.x = TRUE))

merge2 = unique(merge(enrolment, teammembers, by.x = "learner_id", by.y = "id"))

merge3 = unique(merge(merge1, questionresponse, by.x = c("learner_id", "week_number", "step_number"),
                      
                by.y = c("learner_id", "week_number", "step_number"), all.x = TRUE))

merge4 = unique(merge(merge3, archetype, by.x = "learner_id", by.y = "learner_id", all.x = TRUE))

merge5 = unique(merge(merge4, weeklysurvey, by.x = "id", by.y = "id", all.x = TRUE))

finalmerge = unique(merge(merge5, leavingsurvey, by.x = "learner_id", by.y = "learner_id", all.x = TRUE))


#compare enrollment of each run

enrolrun1 = c(run = 1, count = length(unique(cybersecurity1enrolments$learner_id)))

enrolrun2 = c(run = 2, count = length(unique(cybersecurity2enrolments$learner_id)))

enrolrun3 = c(run = 3, count = length(unique(cybersecurity3enrolments$learner_id)))

enrolrun4 = c(run = 4, count = length(unique(cybersecurity4enrolments$learner_id)))

enrolrun5 = c(run = 5, count = length(unique(cybersecurity5enrolments$learner_id)))

enrolrun6 = c(run = 6, count = length(unique(cybersecurity6enrolments$learner_id)))

enrolrun7 = c(run = 7, count = length(unique(cybersecurity7enrolments$learner_id)))

enrolcompile = data.frame(rbind(enrolrun1, enrolrun2, enrolrun3, enrolrun4, enrolrun5, enrolrun6, enrolrun7))


#compare step activity of each run

steprun11 = c(week = 1, run = 1, count = length(unique(cybersecurity1stepactivity$learner_id[cybersecurity1stepactivity$week_number == 1])))

steprun12 = c(week = 1, run = 2, count = length(unique(cybersecurity2stepactivity$learner_id[cybersecurity2stepactivity$week_number == 1])))

steprun13 = c(week = 1, run = 3, count = length(unique(cybersecurity3stepactivity$learner_id[cybersecurity3stepactivity$week_number == 1])))

steprun14 = c(week = 1, run = 4, count = length(unique(cybersecurity4stepactivity$learner_id[cybersecurity4stepactivity$week_number == 1])))

steprun15 = c(week = 1, run = 5, count = length(unique(cybersecurity5stepactivity$learner_id[cybersecurity5stepactivity$week_number == 1])))

steprun16 = c(week = 1, run = 6, count = length(unique(cybersecurity6stepactivity$learner_id[cybersecurity6stepactivity$week_number == 1])))

steprun17 = c(week = 1, run = 7, count = length(unique(cybersecurity1stepactivity$learner_id[cybersecurity7stepactivity$week_number == 1])))

steprun21 = c(week = 2, run = 1, count = length(unique(cybersecurity1stepactivity$learner_id[cybersecurity1stepactivity$week_number == 2])))

steprun22 = c(week = 2, run = 2, count = length(unique(cybersecurity2stepactivity$learner_id[cybersecurity2stepactivity$week_number == 2])))

steprun23 = c(week = 2, run = 3, count = length(unique(cybersecurity3stepactivity$learner_id[cybersecurity3stepactivity$week_number == 2])))

steprun24 = c(week = 2, run = 4, count = length(unique(cybersecurity4stepactivity$learner_id[cybersecurity4stepactivity$week_number == 2])))

steprun25 = c(week = 2, run = 5, count = length(unique(cybersecurity5stepactivity$learner_id[cybersecurity5stepactivity$week_number == 2])))

steprun26 = c(week = 2, run = 6, count = length(unique(cybersecurity6stepactivity$learner_id[cybersecurity6stepactivity$week_number == 2])))

steprun27 = c(week = 2, run = 7, count = length(unique(cybersecurity1stepactivity$learner_id[cybersecurity7stepactivity$week_number == 2])))

steprun31 = c(week = 3, run = 1, count = length(unique(cybersecurity1stepactivity$learner_id[cybersecurity1stepactivity$week_number == 3])))

steprun32 = c(week = 3, run = 2, count = length(unique(cybersecurity2stepactivity$learner_id[cybersecurity2stepactivity$week_number == 3])))

steprun33 = c(week = 3, run = 3, count = length(unique(cybersecurity3stepactivity$learner_id[cybersecurity3stepactivity$week_number == 3])))

steprun34 = c(week = 3, run = 4, count = length(unique(cybersecurity4stepactivity$learner_id[cybersecurity4stepactivity$week_number == 3])))

steprun35 = c(week = 3, run = 5, count = length(unique(cybersecurity5stepactivity$learner_id[cybersecurity5stepactivity$week_number == 3])))

steprun36 = c(week = 3, run = 6, count = length(unique(cybersecurity6stepactivity$learner_id[cybersecurity6stepactivity$week_number == 3])))

steprun37 = c(week = 3, run = 7, count = length(unique(cybersecurity1stepactivity$learner_id[cybersecurity7stepactivity$week_number == 3])))


stepruncompile = data.frame(rbind(steprun11, steprun12, steprun13, steprun14, steprun15, steprun16, steprun17,
                                  
                                  steprun21, steprun22, steprun23, steprun24, steprun25, steprun26, steprun27,
                                  
                                  steprun31, steprun32, steprun33, steprun34, steprun35, steprun36, steprun37))



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


#Compare weekly responses

weeklyresponse11 = c(week = 1, rating = 1, count = length(unique(weeklysurvey$id[weeklysurvey$week_number == 1 & weeklysurvey$experience_rating == 1])))

weeklyresponse12 = c(week = 1, rating = 2, count = length(unique(weeklysurvey$id[weeklysurvey$week_number == 1 & weeklysurvey$experience_rating == 2])))

weeklyresponse13 = c(week = 1, rating = 3, count = length(unique(weeklysurvey$id[weeklysurvey$week_number == 1 & weeklysurvey$experience_rating == 3])))

weeklyresponse21 = c(week = 2, rating = 1, count = length(unique(weeklysurvey$id[weeklysurvey$week_number == 2 & weeklysurvey$experience_rating == 1])))

weeklyresponse22 = c(week = 2, rating = 2, count = length(unique(weeklysurvey$id[weeklysurvey$week_number == 2 & weeklysurvey$experience_rating == 2])))

weeklyresponse23 = c(week = 2, rating = 3, count = length(unique(weeklysurvey$id[weeklysurvey$week_number == 2 & weeklysurvey$experience_rating == 3])))

weeklyresponse31 = c(week = 3, rating = 1, count = length(unique(weeklysurvey$id[weeklysurvey$week_number == 3 & weeklysurvey$experience_rating == 1])))

weeklyresponse32 = c(week = 3, rating = 2, count = length(unique(weeklysurvey$id[weeklysurvey$week_number == 3 & weeklysurvey$experience_rating == 2])))

weeklyresponse33 = c(week = 3, rating = 3, count = length(unique(weeklysurvey$id[weeklysurvey$week_number == 3 & weeklysurvey$experience_rating == 3])))

weeklycompile = data.frame(rbind(weeklyresponse11, weeklyresponse12, weeklyresponse13, weeklyresponse21, weeklyresponse22,
                                 
                                 weeklyresponse23, weeklyresponse31, weeklyresponse32, weeklyresponse33))

vectorinvideostats = c()

for (loop in 1:13){
  
  sequenceadd = seq(3,7,1)
  
  vectorinvideostats = append(vectorinvideostats, sequenceadd)
  
}

videostats$run_number = vectorinvideostats

videostatsaggregate = aggregate(videostats[, 3:28], list(videostats$step_position), mean)

colnames(videostatsaggregate)[1] = "step_position"

videostatsaggregaterun = aggregate(videostats[, 3:28], list(videostats$run_number), mean)

colnames(videostatsaggregaterun)[1] = "run_number"


