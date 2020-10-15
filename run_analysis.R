# Peer-graded Assignment: Getting and Cleaning Data Course Project

#Step 1: load required library

library (dplyr)
library (reshape2)
library (codebook)

#Step 2: data organization
#Lets assume you are going to run the project for the first time, thus we create a directory for the project
#...working dir
#......course project (created)
#.........data
#.........script
#.........output

if(!dir.exists("course_project")) {
  dir.create("course_project")
  project_folder_directories = c("course_project/data","course_project/script","course_project/output")
  lapply(project_folder_directories,dir.create)
  message ("Step 1: folders created")
} else message ("Folder exists")

setwd("course_project")

#Step 3: download data from the web, unzip files into relevant directory (data) and clean
source_url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(source_url,"data/dataset.zip")
unzip("data/dataset.zip",exdir = "data")
file.remove("data/dataset.zip")

#Step 4: load/merge feature, activity, train and test data sets

#train data
x_train = read.table("data/UCI HAR Dataset/train/X_train.txt")
y_train = read.table("data/UCI HAR Dataset/train/Y_train.txt")
subject_train= read.table("data/UCI HAR Dataset/train/subject_train.txt")

#test data
x_test = read.table("data/UCI HAR Dataset/test/X_test.txt")
y_test = read.table("data/UCI HAR Dataset/test/Y_test.txt")
subject_test = read.table("data/UCI HAR Dataset/test/subject_test.txt")

#merge train+test, using row binding
x_data = rbind (x_train, x_test)
y_data = rbind (y_train, y_test)
subject_data = rbind (subject_train, subject_test)

#load activity and features
activity <- read.table("data/UCI HAR Dataset/activity_labels.txt",col.names=c("index","activity"))
feature = read.table("data/UCI HAR Dataset/features.txt",col.names=c("index","feature"))

#Step 5
#Only std and mean attributes are required. we are going to appropriate data
requiredFeatures.columns = grep ("mean|std",feature$feature)
requiredFeature.names = feature [requiredFeatures.columns,2]

#merged dataset then reduced to show only relevant values (std, mean)
x_data = x_data[requiredFeatures.columns]

#Step 6
#We use descriptive activity names to name the activities in the data set
data = cbind(subject_data, y_data, x_data)
colnames(data)=c("subject", "activity", requiredFeature.names)

#Same way activities are renamed to be comprehensive
data$activity = factor (data$activity, levels = activity$index, labels = activity$activity)
data$subject = as.factor (data$subject)
write.table(data, "output/tidy.txt")

#creating a second, independent tidy data set with the average of each variable for each activity and each subject.
melted_data = melt(data, id = c("subject", "activity"))
tidy_data = dcast(melted_data, subject+activity~variable,mean)
write.table(tidy_data, "output/tidy_aggregated.txt")