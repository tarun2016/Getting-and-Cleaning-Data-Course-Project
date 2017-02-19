# Getting-and-Cleaning-Data-Course-Project
This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:
  
1.Download the dataset 
2.Set the working directory to UCI HAR Dataset
3.Read labels and features  and extract only the measurements on the mean and standard deviation
4.Read x and y test dataset and combine columns
5.Read x and y training dataset and combine columns
6.Merge training and test dataframe and add labels
7.Factor activities and subjects
8.Melt the data with id as subject and activity
9.Dcast the melted data according to subject,activity and summarizing mean of other variables
10.Write the file as tidy.txt


