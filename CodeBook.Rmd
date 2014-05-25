CodeBook
========


The script assumes that zip file containing data is downloaded from the url indicated in README.md file, and unzipped resulting data in a "UCI HAR Dataset" directory.


Data
----

Script uses the following files


- "./UCI HAR Dataset/train/subject_train.txt" 
- "./UCI HAR Dataset/train/X_train.txt"
- "./UCI HAR Dataset/train/y_train.txt"
- "./UCI HAR Dataset/test/subject_test.txt"
- "./UCI HAR Dataset/test/X_test.txt"
- "./UCI HAR Dataset/test/y_test.txt"
- "./UCI HAR Dataset/train/features.txt"
- "./UCI HAR Dataset/activity_labels.txt"

x files contains data about activity performed.

Variables used in script
------------------------
Following variables are used for extracting data from files:

- temp_train_sub 
- temp_train_x   
- temp_train_y
- temp_test_sub  
- temp_test_x    
- temp_test_y
- feat
- act

The following variables are used to merged train and test data in the x, y and subject categories:

- temp_sub 
- temp_x   
- temp_y 

Other variables used in the script:

- measur: stores result of filtering activities in feat variable. Filter applied is "mean" and "std" pattern in its measure attribute.
- x: is a working variable to subsetting measures filtered in *temp_x*. 
- y: is a working variable to subsetting data in *act*.
- tidy.data is a data set build with subject, x-data and y-data, binding columns.
- tidy.data.temp used to reorder columns in tidy.data
- tidy.data2 is used to aggregate data for each kind of activity in each subject.


Steps to transform data
-----------------------

* Loads data into variables.
* Merges the training and the test sets to create one data set.
* Extracts measurements matching with mean and standard deviation. 
* Renames activities.
* Labels data set with descriptive activity names. 
* Reorder columns in data set
* Aggregate data for subject and activity.
* Save processed data to a file named as "tidy_data.txt".


