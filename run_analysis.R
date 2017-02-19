#Download and unzip the dataset file
file_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(file_url,"dataset.zip", method="curl")
unzip(dataset.zip)

#set the working directory to UCI HAR Dataset
setwd("UCI HAR Dataset")

#read labels and features  and extract only the measurements on the mean and standard deviation
activity_labels <- read.table("activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])
features <- read.table("features.txt")
features[,2] <- as.character(features[,2])
feature_req <- grep(".*mean.*|.*std.*", features[,2])
feature_req_name <- features[feature_req,2]
feature_req_name = gsub('-mean', 'Mean', feature_req_name)
feature_req_name = gsub('-std', 'Std', feature_req_name)
feature_req_name <- gsub('[-()]', '', feature_req_name)

#read x and y test dataset and combine columns
test <- read.table("test/X_test.txt")
test_activities <- read.table("test/Y_test.txt")
test_subjects <- read.table("test/subject_test.txt")
test <- cbind(test_subjects, test_activities, test)

#read x and y training dataset and combine columns
train <- read.table("train/X_train.txt")
train_activities <- read.table("train/Y_train.txt")
train_subjects <- read.table("train/subject_train.txt")
train <- cbind(train_subjects, train_activities, train)

#merge training and test dataframe and add labels
data <- rbind(train, test)
colnames(data) <- c("subject", "activity", feature_req_name)

#factor activities and subjects
data$activity <- factor(data$activity, levels = activity_labels[,1], labels = activity_labels[,2])
data$subject <- as.factor(data$subject)

#melt the data with id as subject and activity
data.melted <- melt(data, id = c("subject", "activity"))

#dcast the melted data according to subject,activity and summarizing mean of other variables
data.mean <- dcast(data.melted, subject + activity ~ variable, mean)

#write the file as tidy.txt
write.table(data.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
