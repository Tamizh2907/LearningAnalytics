########################################################################################################
#                                     SCRIPT DESCRIPTION                                               #
########################################################################################################
#                                                                                                      #
#               This script contains the code to convert csv file to data frames                       #                                                #
########################################################################################################




#read all csv file to data frame

data_files = list.files("data/", pattern = "^c")  # Identify file names

#data_files # Print file names

for(i in 1:length(data_files)) { #for loop to convert csv to data frames
  
  readcsvfile = read.csv(paste0("data/", data_files[i]))
  
  substringdata = substr(data_files[i], 1, nchar(data_files[i])-4)
  
  substringdata = gsub("-", "", substringdata)
  
  substringdata = gsub("_", "", substringdata)
  
  assign(substringdata, readcsvfile)
  
}