---
title: "Codebook for Getting and Cleaning Data Course Project"
author: "Aleksandr Stadnitskiy"
date: "10/15/2020"
output:
  html_document:
    df_print: paged
---

## Data source
*Emphasize* _The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:<br />_

[Project data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "Project data").<br />
[Data description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones "Data description").<br />

## Following action set is executed in R script attached [^1]
[^1]: Libraries required to run the script in full: dplyr, reshape2** <br />

Step 1: project organization, creation of project folders <br />
Step 2: download data from the web, unzip files into relevant directory (data) and clean<br />
Step 3: load/merge feature, activity, train and test data sets<br />
Step 4: finding standart deviation and mean values required to assess in the project<br />
Step 5: tidying up data and creating a required dataset<br />
Step 6 generate additional tidy data file with the average of each variable for each activity and each subject<br />

#### List of variables (script)
Variable | Description
------------ | -------------
source_url | contains a link to the data for analysis
x/y/subject train/test | reads data from txt for analysis on subject activities
x/y/subject data | newly created dataset that binds together data acquired on subject activities
activity | contains a link between code and activity
features | reads features from the file
data  | bind together subject/x/y data
melted_data | melts newly created tidy set to prepare for the cast of second tidy set required by the assignment
tidy_data | average of each variable for each activity and each subject

#### List of variables (tidy data sets)
Variable | Description
------------ | -------------
"subject" | ID of subject, int (1-30)
"activity" | Label of activity, Factor w/ 6 levels

## Deliverables: 2 files

* Tidyset.txt 
* Tidyset_2.txt 

#### Descriptive of data sets variables
Variable | Description
------------ | -------------
tBodyAcc-mean()-X	| the average value for this feature, num (range: -1:1)
tBodyAcc-mean()-Y		| the average value for this feature, num (range: -1:1)
tBodyAcc-mean()-Z	| the average value for this feature, num (range: -1:1)
tBodyAcc-std()-X		| the average value for this feature, num (range: -1:1)
tBodyAcc-std()-Y		| the average value for this feature, num (range: -1:1)
tBodyAcc-std()-Z	| 	the average value for this feature, num (range: -1:1)
tGravityAcc-mean()-X	| 	the average value for this feature, num (range: -1:1)
tGravityAcc-mean()-Y	| 	the average value for this feature, num (range: -1:1)
tGravityAcc-mean()-Z	| 	the average value for this feature, num (range: -1:1)
tGravityAcc-std()-X	| 	the average value for this feature, num (range: -1:1)
tGravityAcc-std()-Y	| 	the average value for this feature, num (range: -1:1)
tGravityAcc-std()-Z		| the average value for this feature, num (range: -1:1)
tBodyAccJerk-mean()-X		| the average value for this feature, num (range: -1:1)
tBodyAccJerk-mean()-Y		| the average value for this feature, num (range: -1:1)
tBodyAccJerk-mean()-Z		| the average value for this feature, num (range: -1:1)
tBodyAccJerk-std()-X	| 	the average value for this feature, num (range: -1:1)
tBodyAccJerk-std()-Y	| 	the average value for this feature, num (range: -1:1)
tBodyAccJerk-std()-Z	| 	the average value for this feature, num (range: -1:1)
tBodyGyro-mean()-X	| 	the average value for this feature, num (range: -1:1)
tBodyGyro-mean()-Y	| 	the average value for this feature, num (range: -1:1)
tBodyGyro-mean()-Z	| 	the average value for this feature, num (range: -1:1)
tBodyGyro-std()-X	| 	the average value for this feature, num (range: -1:1)
tBodyGyro-std()-Y	| 	the average value for this feature, num (range: -1:1)
tBodyGyro-std()-Z	| 	the average value for this feature, num (range: -1:1)
tBodyGyroJerk-mean()-X	| 	the average value for this feature, num (range: -1:1)
tBodyGyroJerk-mean()-Y	| 	the average value for this feature, num (range: -1:1)
tBodyGyroJerk-mean()-Z	| 	the average value for this feature, num (range: -1:1)
tBodyGyroJerk-std()-X		| the average value for this feature, num (range: -1:1)
tBodyGyroJerk-std()-Y	| 	the average value for this feature, num (range: -1:1)
tBodyGyroJerk-std()-Z	| 	the average value for this feature, num (range: -1:1)
tBodyAccMag-mean()	| 	the average value for this feature, num (range: -1:1)
tBodyAccMag-std()		| the average value for this feature, num (range: -1:1)
tGravityAccMag-mean()		| the average value for this feature, num (range: -1:1)
tGravityAccMag-std()	| 	the average value for this feature, num (range: -1:1)
tBodyAccJerkMag-mean()	| 	the average value for this feature, num (range: -1:1)
tBodyAccJerkMag-std()	| 	the average value for this feature, num (range: -1:1)
tBodyGyroMag-mean()	| 	the average value for this feature, num (range: -1:1)
tBodyGyroMag-std()	| 	the average value for this feature, num (range: -1:1)
tBodyGyroJerkMag-mean()	| 	the average value for this feature, num (range: -1:1)
tBodyGyroJerkMag-std()	| 	the average value for this feature, num (range: -1:1)
fBodyAcc-mean()-X	| 	the average value for this feature, num (range: -1:1)
fBodyAcc-mean()-Y		| the average value for this feature, num (range: -1:1)
fBodyAcc-mean()-Z		| the average value for this feature, num (range: -1:1)
fBodyAcc-std()-X		| the average value for this feature, num (range: -1:1)
fBodyAcc-std()-Y	| 	the average value for this feature, num (range: -1:1)
fBodyAcc-std()-Z	| 	the average value for this feature, num (range: -1:1)
fBodyAccJerk-mean()-X	| 	the average value for this feature, num (range: -1:1)
fBodyAccJerk-mean()-Y	| 	the average value for this feature, num (range: -1:1)
fBodyAccJerk-mean()-Z		| the average value for this feature, num (range: -1:1)
fBodyAccJerk-std()-X	| 	the average value for this feature, num (range: -1:1)
fBodyAccJerk-std()-Y	| 	the average value for this feature, num (range: -1:1)
fBodyAccJerk-std()-Z	| 	the average value for this feature, num (range: -1:1)
fBodyGyro-mean()-X	| 	the average value for this feature, num (range: -1:1)
fBodyGyro-mean()-Y	| 	the average value for this feature, num (range: -1:1)
fBodyGyro-mean()-Z	| 	the average value for this feature, num (range: -1:1)
fBodyGyro-std()-X		| the average value for this feature, num (range: -1:1)
fBodyGyro-std()-Y	| 	the average value for this feature, num (range: -1:1)
fBodyGyro-std()-Z	| 	the average value for this feature, num (range: -1:1)
fBodyAccMag-mean()	| 	the average value for this feature, num (range: -1:1)
fBodyAccMag-std()	| 	the average value for this feature, num (range: -1:1)
fBodyBodyAccJerkMag-mean()	| 	the average value for this feature, num (range: -1:1)
fBodyBodyAccJerkMag-std()	| 	the average value for this feature, num (range: -1:1)
fBodyBodyGyroMag-mean()	| 	the average value for this feature, num (range: -1:1)
fBodyBodyGyroMag-std()	| 	the average value for this feature, num (range: -1:1)
fBodyBodyGyroJerkMag-mean()	| 	the average value for this feature, num (range: -1:1)
fBodyBodyGyroJerkMag-std()	| 	the average value for this feature, num (range: -1:1)

