# Getting_and_Cleaning_Data_Assignment
Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare a tidy data that can be used for later analysis. The script "run_analysis.r" in this repo creates an independent tidy data set with the Average of each variable for each Activity and each Subject.  There were 30 subjects who volunteered to participate in this experiment. The Activity variable is a factor variable with the following 6 categories: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING. The 561 measurement variables taken during each activity are listed in the "CodeBook.md" file. The tidy data is an analysis of data originally from the "Human Activity Recognition Using Smartphones" Dataset by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, & Luca Oneto at Smartlab at the Università degli Studi di Genova: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The following zip file was downloaded and extracted to the working directory in R:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

My R script "run_analysis.R" performs the following 12 steps to generate the tidy data:

1) Set the working directory to where the UCI Human Activity Recognition Dataset was unzipped
2) Set the locations of data files based upon the working directory
3) Load the training data
4) Load the test data
5) Merge the training and the test sets using rbind()
6) Extract the mean and standard deviation for each measurement of X
7) Use the descriptive activity names to name the activities in the data set
8) Recognize the subject data as a factor
9) Appropriately label the data sets with descriptive variable names
10) Merge all data sets to create one master dataframe using cbind()
11) Create an independent tidy data set with the average of each variable for each activity and each subject
12) Write the output of the average of each variable for each activity and each subject

