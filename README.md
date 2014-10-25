DataScience-TidyDataProject
===========================

Repo for Data Science Class Getting and Cleaning Data Course Project

The R script "run_analysis.r" submitted in this project repo 
is designed to transform relevant raw data files from the UCI
Machine Learning Repository study of Human Activity Recognition Using
Smartphones Data Set into a tidy data set with the average of the mean and
standard deviation for each measurment calculated over each variable for
each activity and each subject.

General Assumptions and Requirements:
1) The following raw data files will be saved in the users working directory:
	x_test.txt, y_test.txt, subject_test.txt, x_train.txt, y_train.txt,
	subject_train.txt, features.txt
2) In addition to the base R package the following packages are installed on
	the users computer:  "stringr", "reshape2"

Running the script will perform the following sequence of actions in order 
to produce the desired tidy data set:

Section 1: Merge the training and test data files to create one data set
1) the raw data files are read into R using read.table
2) the features data file are initially in the form of a data frame,
	therefore, the second column which contains the names of the data
	variables in the x_test and x_train files, is extracted into a
	character vector
3) the column variable names are then assigned to each of the six raw
	data files using this vector or a simple single character description
4) the three test group files are then bound together into a single data
	frame, and the three training group files similarly combined
5) the test and training data frames are then combined into a single
	data frame

Section 2: Subset the data file to extract only the measurements on the mean
and standard deviation for each measurement (see CodeBook for information on
the determination of the appropriate fields to be retained)
6) a logical vector is created identifying fields with the mean or standard
	deviation for each measurement assigning TRUE to variables to be retained
7) the logical vector is appended with two additional TRUE elements to
	indicate that the identifying variables "subject" and "activity" are
	also to be retained
8) the logical vector is then used to subset the data set retaining only
	the desired variables
	
Section 3: provide descriptive activity names to the data set
9) the variable column for "activity" is extracted from the data into a vector
10) a series of simple text substitution commands replaces the activity
	codes with descriptive names
11) the vector is then inserted into the data frame overlaying the descriptive
	names in the "activity" variable column
	
Section 4: Label the data set with descriptive variable names
12) a vector of the variable names is extracted from the data frame headers
13) a sequence of substitution or replace commands are used to expand
	abbreviations, capitalize to produce camelCase, correct typos (BodyBody},
	and eliminate punctuation (e.g. "-" or "()")
14) resulting vector of descriptive variable names is reinserted as the column
	headers of the data set
	
Section 5: Create an independent tidy data set with the average of each variable
for each activity and each subject
15) the melt command from the reshape2 package is used to reformat the data into
	narrow form across the id variables "subject" and "activity"
16) the mean function is then applied through the dcast command to produce the
	required calculations and recast the data into a wide but tidy format
