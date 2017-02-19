# Getting-and-Cleaning-Data-Course-Project
This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:
  
Download the dataset 
set the working directory to UCI HAR Dataset
read labels and features  and extract only the measurements on the mean and standard deviation
read x and y test dataset and combine columns
read x and y training dataset and combine columns
merge training and test dataframe and add labels
factor activities and subjects
melt the data with id as subject and activity
dcast the melted data according to subject,activity and summarizing mean of other variables
write the file as tidy.txt


