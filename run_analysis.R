#########################################################################################
### Step 0: downloading files, calling libraries, setting directories
#########################################################################################

### setup
library(dplyr)

projectRoot <- "C:/Users/Baerbel/Dropbox/Courses/Coursera/Getting_and_cleaning_data/Project/"
setwd(projectRoot)

### download zip file specified in course assignment and unzip, keep date of download in folder name
d <- date()
downloadDate <- paste(substr(d,9,10),substr(d,5,7),substr(d,21,24),substr(d,12,13),substr(d,15,16),substr(d,18,19),sep = "_")

url_zip <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
destfile_name <- paste0(projectRoot,"Data",downloadDate,".zip")
download.file(url = url_zip,destfile = destfile_name,mode = 'wb')

unzip(zipfile = destfile_name)

### read in unzipped data
setwd("UCI HAR Dataset")
subjects_test <- read.table("test/subject_test.txt")
test_x <- read.table("test/X_test.txt")
test_y <- read.table("test/Y_test.txt")


subjects_train <- read.table("train/subject_train.txt")
train_x <- read.table("train/X_train.txt")
train_y <- read.table("train/Y_train.txt")

# read in features, verify that second column is read in as character not as factor
features <- read.table("features.txt", stringsAsFactors = F)

# activity_labels <- read.table("activity_labels.txt")

#########################################################################################
### Step 1. Merges the training and the test sets to create one data set.
#########################################################################################

### merging using cbind and rbind
test <- cbind(subjects_test,test_y,test_x)
train <- cbind(subjects_train,train_y,train_x)
dataset1 <- rbind(test,train)

### give column names based on features, necessary step for code in step 2 to work
colnames(dataset1) <- c("subjectID","activity",features[,2])

#########################################################################################
### Step 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#########################################################################################

### find all columns with mean() in name, do not find columns with meanFreq() in name 
meanColumns <- which(grepl("mean()",colnames(dataset1)) & !(grepl("meanFreq()",colnames(dataset1))))

### find all columns with std() in name
stdColumns <- which(grepl("std()",colnames(dataset1)))

### bind the column IDs together
cols <- as.vector(rbind(meanColumns,stdColumns))

### choose the columns from dataset + first two columns
dataset2 <- dataset1[,c(1:2,cols)]

#########################################################################################
### Step 3. Uses descriptive activity names to name the activities in the data set
#########################################################################################

### naming of activies is based on file activity_label.txt
ActivityNamesData <- rep(NA,dim(dataset2)[1])

ActivityNamesData[which(dataset2$activity == 1)] <- "WALKING"
ActivityNamesData[which(dataset2$activity == 2)] <- "WALKING_UPSTAIRS"
ActivityNamesData[which(dataset2$activity == 3)] <- "WALKING_DOWNSTAIRS"
ActivityNamesData[which(dataset2$activity == 4)] <- "SITTING"
ActivityNamesData[which(dataset2$activity == 5)] <- "STANDING"
ActivityNamesData[which(dataset2$activity == 6)] <- "LAYING"

dataset3 <- dataset2
dataset3$activity <- ActivityNamesData

#########################################################################################
### Step 4. Appropriately labels the data set with descriptive variable names. 
#########################################################################################

# done in step 1

dataset4 <- dataset3

#########################################################################################
### Step 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
### for each activity and each subject.
#########################################################################################

### group the data by subjectID and activity
strata <- group_by(dataset4,subjectID,activity)

### get the average of each group for each variable
strata_summary <- summarise_each(strata, funs(mean),vars = 3:dim(dataset4)[2])
tidy_data <- strata_summary

### get tidy variable names
measurementNames <- sub("Acc","Accelerometer",colnames(dataset4)[-c(1:2)])
measurementNames <- sub("Gyro","Gyroscope",measurementNames)
measurementNames <- gsub("-","",measurementNames)
measurementNames <- gsub('\\(\\)',"",measurementNames)

measurementNames <- sub("mean","Mean",measurementNames)
measurementNames <- sub("std","Std",measurementNames)

colnames(tidy_data) <- c(colnames(tidy_data)[1:2],measurementNames)
write.table(tidy_data,paste0(projectRoot,"tidy_data.txt"),row.names=F,quote=F)
