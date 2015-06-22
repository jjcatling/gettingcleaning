# gettingcleaning

This repo contains my attempt at the Coursera Getting and Cleaning data course project (details below).

run_analysis.R converts the Samsung dataset into tidy data as specified.

It does this by:

Merging the training and the test sets to create one data set:
- Reading both the training and test datasets
- Merging those datasets

Extracting only the measurements on the mean and standard deviation for each measurement, and appropriately labelling the data set with descriptive variable names
- Reading the variable names from features.txt
- Making the variable names valid and ensuring uniqueness
- Renaming the variables of the merged dataset with the variable names
- Finding only the mean and standard deviation variables
- Creating a vector of the applicable column indices
- Subsetting the data by columns using those indices

Using descriptive activity names to name the activities in the data set:
- Reading the respondent and activity numbers for the training and test data
- Merging this data, naming its columns, and merging with the full dataset
- Reading the activity labels doc and adding activity names in our respondent and activity dataset
- Merging the respondents and activities with the larger dataset

From the data set in step 4, creating a second, independent tidy data set with the average of each variable for each activity and each subject.
- Grouping data and creating a tidy dataset



More details on the data and challenge:

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 





