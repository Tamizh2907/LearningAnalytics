# LearningAnalytics

## Background information about the scripts

In the munge folder, the preprocessing scripts are placed. The script "01-readcsv" contains the code to convert csv file to data frames and the script "02-createconnections" contains the code of two dimensions. One is to analyse the overall data of seven runs by combine them and another is to compare data of each run. 

In the src folder, the preprocessing script "01-createconnections-old-nottoconsider" contains the code to preprocess the overall data - some we do need for the project and some we don't. The script "02-analysis - we don't need" contains the code to analyse every aspect of data from various angles to different questions - some we need and some we don't need for the project. The script "03-analysis - we need" contains the code which are being used in 'RMarkdown' to generate report. 

## Steps to run this project:

1. Open RStudio.

2. Set the working directory to the path '/where/you/have/the/folder/LearningAnalytics'.

3. Open the markdown file 'LearningAnalytics.Rmd' from /LearningAnalytics/reports/ 

4. Knit the file to execute the project - This will munge your preprocessing script using ProjectTemplate and generate a report using the instructions given in markdown script.

5. The output report will be generated in pdf format in the 'reports' folder under the parent folder.