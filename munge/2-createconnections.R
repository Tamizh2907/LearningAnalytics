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



