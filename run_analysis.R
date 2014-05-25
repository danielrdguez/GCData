#### Getting and Cleaning Data ####
#### ========================= ####


### Merges the training and the test sets to create one data set.
  
temp_train_sub <- read.table("./UCI HAR Dataset/train/subject_train.txt") 
temp_train_x   <- read.table("./UCI HAR Dataset/train/X_train.txt")
temp_train_y   <- read.table("./UCI HAR Dataset/train/y_train.txt")

temp_test_sub  <- read.table("./UCI HAR Dataset/test/subject_test.txt")
temp_test_x    <- read.table("./UCI HAR Dataset/test/X_test.txt")
temp_test_y    <- read.table("./UCI HAR Dataset/test/y_test.txt")

temp_sub <- rbind(temp_train_sub, temp_test_sub)
temp_x   <- rbind(temp_train_x, temp_test_x)
temp_y   <- rbind(temp_train_y, temp_test_y)

# remove unused variables
rm(temp_train_sub)
rm(temp_train_x)
rm(temp_train_y)
rm(temp_test_sub)
rm(temp_test_x)
rm(temp_test_y)


### Extracts only the measurements on the mean and standard deviation for 
### each measurement, using regular expressions. 

feat <- read.table("./UCI HAR Dataset/features.txt")
colnames(feat) <- c("cod.","measure")

measur <- grep(pattern="mean\\(\\)|std\\(\\)",x=feat$measure,perl=T,value=F)

x <- temp_x[,feat[measur,1]]
colnames(x) <- feat[measur,2]


### Uses descriptive activity names to name the activities in the data set

act <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(act) <- c("cod_act","activity")
act$activity <- gsub(pattern=".*_",replacement="",x=act$activity)
act$activity <- tolower(act$activity)


### Appropriately labels the data set with descriptive activity names. 

y <- as.data.frame(act[temp_y[,1], 2])
colnames(y)<-"activity"

colnames(temp_sub) <- "subject"

tidy.data <-cbind(temp_sub,x,y)
tidy.data$subject <- as.factor(tidy.data$subject)

# reordering columns in tidy.data
tidy.data.temp <- tidy.data[,1]
tidy.data.temp <- cbind(tidy.data.temp, tidy.data[,68])
colnames(tidy.data.temp) <- c("subject","activity")
tidy.data.temp <- cbind(tidy.data.temp, tidy.data[,2:67])
tidy.data <- tidy.data.temp
rm(tidy.data.temp)

# removing unused variables
rm(feat)
rm(temp_x)
rm(temp_y)
rm(temp_sub)

### Creates a second, independent tidy data set with the average 
### of each variable for each activity and each subject.

tidy.data2 <- aggregate(tidy.data[,3] ~ subject+activity, data = tidy.data, FUN= "mean" )

for(i in 4:(ncol(tidy.data))){
  tidy.data2[,i] <- aggregate( tidy.data[,i] ~ subject+activity, data = tidy.data, FUN= "mean" )[,3]
}

# labels the tidy data
colnames(tidy.data2) <- colnames(tidy.data)

# save the tidy data to a file
write.table(x=tidy.data2,file="tidy_data.txt",sep=",",eol="\n")

