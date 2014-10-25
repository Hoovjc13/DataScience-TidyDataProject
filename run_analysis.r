## This R script is designed to transform relevant raw data files from the UCI
## Machine Learning Repository study of Human Activity Recognition Using
## Smartphones Data Set into a tidy data set with the average of the mean and
## standard deviation for each measurment calculated over each variable for
## each activity and each subject

## Load library packages used in the script
library(stringr)
library(reshape2)

## STEP#1: Merge the training and test data sets to create one data set

## Read the raw data files into R data frames
x_test <- read.table("x_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")
x_train <- read.table("x_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")
features <- read.table("features.txt")
## Convert features to a character vector and assign column names to data frames
features_vector <- as.character(features[ , 2])
colnames(subject_test) <- "subject"
colnames(y_test) <- "activity"
colnames(x_test) <- features_vector
colnames(subject_train) <- "subject"
colnames(y_train) <- "activity"
colnames(x_train) <- features_vector
## Combine into a single data frame
test <- cbind(subject_test, y_test, x_test)
train <- cbind(subject_train, y_train, x_train)
all_data <- rbind(test, train)

## STEP#2: Subset the data file to extract only the measurements on the mean
##         and standard deviation for each measurement.

## Create logical vector of columns to be retained
mean_columns <- grepl("mean()", features_vector, fixed=TRUE)
std_columns <- grepl("std()", features_vector, fixed=TRUE)
## Combine and add 2 TRUEs to retain subject and activity as well
retained_columns <- c(TRUE, TRUE, mean_columns | std_columns)
mean_and_std_data <- all_data[ , retained_columns]

## STEP#3: provide descriptive activity names to the data set

activity_vector <- mean_and_std_data$activity
activity_vector <- as.character(activity_vector)
activity_vector <- gsub("1","walking",activity_vector)
activity_vector <- gsub("2","walkingupsatirs",activity_vector)
activity_vector <- gsub("3","walkingdownstairs",activity_vector)
activity_vector <- gsub("4","sitting",activity_vector)
activity_vector <- gsub("5","standing",activity_vector)
activity_vector <- gsub("6","laying",activity_vector)
mean_and_std_data$activity <- activity_vector

## STEP#4: Label the data set with descriptive variable names

var_names <- names(mean_and_std_data)
var_names <- sub("^t", "time", var_names)
var_names <- sub("^f", "frequency", var_names)
var_names <- sub("Acc", "Acceleration", var_names)
var_names <- sub("Gyro", "Gyroscope", var_names)
var_names <- sub("Mag", "Magnitude", var_names)
var_names <- sub("mean", "Mean", var_names)
var_names <- sub("std", "StandardDeviation", var_names)
var_names <- sub("BodyBody", "Body", var_names)
var_names <- str_replace_all(var_names, "[[:punct:]]", "")
names(mean_and_std_data) <- var_names

## STEP5: Create an independent tidy data set with the avdrage of each variable
##        for each activity and each subject

data_melt <- melt(mean_and_std_data, id=c("subject","activity"))
tidy_mean_data <- dcast(data_melt, subject + activity ~ variable, mean)
