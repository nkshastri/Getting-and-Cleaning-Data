##Getting and Cleaning Data Course Project

This file describes how run_analysis.R script works:
1) First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and keep it in your working directory along with run_analysis.R script.
2) Use source("run_analysis.R") command in RStudio to execute the script.
3) There will be two output files generated in the current working directory:
	merged_data.txt  ---it contains a data frame called cleanedData with 10299*68 dimension.
	data_with_means.txt --- it contains a data frame called data_with_means with 180*68 dimension.

A brief description of the script:
1) Script loads the following files required for analysis using read.table function:
	-X_train.txt stored in trainData variable
	-y_train.txt stored in trainLabel variable
	-subject_train.txt stored in trainSubject variable
	-X_test.txt stored in testData variable
	-y_test.txt stored in testLabel variable
	-subject_test.txt stored in testSubject variable
2) Data, Label and Subject variables for train and test data created in above steps get combined using rbind function. For example trainData conbined with testData and so on resulting in three varibales named data, joinLabel, joinSubject.
3)Using read.table function script loads the features.txt file and assigned to variable named features.
4)Data frame data created in step 2 will be assigned column names as per features variable.
5)Subset data variable from above step with column names std or mean and assigned to variable called joindata.
6)Using read.table function script loads the activity_labels.txt file and assigned to variable named activity.
7)Using activity variable joinLable data created in step 2 is populated according to numbering corrosponding to activity varible index.
8)Provide column name as "activity" to joinLabel 
9)Provide column name as "subject" to joinSubject
10) Using cbind function combine joinSubject, joinLabel and data varibale and assigned it to new variable named cleanedData.
11) Clean cleanedData by removing "()" , and proper nominclature for column names
12) Using write.table prepare a file called merged_data.txt in current working directory.
13) Using library(reshape2) load reshape2 package
14) Melt data by subject and activity
15) Cast data for creating a second, independent tidy data set with the average of each variable for each activity and each subject
16) Write it to current working directory by data_with_means.txt name.