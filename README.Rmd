run_analysis.R
==============

Getting and Cleaning Data Course Project
----------------------------------------

This repo contains one R script, which requires thet previously you take the following actions:

* Download the source data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Unzip data in your working directory

The R script run_analysis.R, will execute the following:

* Merges the training and the test sets to create one data set.
  * Remove unused variables
* Extracts only the measurements on the mean and standard deviation for 
each measurement, using regular expressions. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names. 
* Reorder columns in data set
  * Remove unused variables
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Labels the tidy data
* Save the tidy data to a file named as "tidy_data.txt".


