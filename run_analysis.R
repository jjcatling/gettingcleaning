## Merges the training and the test sets to create one data set.

## Reads both datasets
trainData <- read.table("./train/X_train.txt")
testData <- read.table("./test/X_test.txt")

## Merges the datasets
comboData <- rbind(trainData, testData)





## Extracts only the measurements on the mean and standard
## deviation for each measurement.

## Reads the variable names from column 2 of features.txt
Features <- read.table("./features.txt")
varNamesOriginal <- Features[,2]

## Makes the variable names valid and ensures uniqueness
varNames <- make.names(varNamesOriginal, unique=TRUE)

## Renames the variables of the merged dataset with the variable names
colnames(comboData) <- varNames

## Finds only the mean and standard deviation variables
## I've interpreted this as meaning those with 'mean' or 'std' somewhere
## in the variable name
meanCols <- grep("mean", varNames)
MeanCols <- grep("Mean", varNames)
stdCols <- grep("std", varNames)

## Create a vector of the applicable column indices
useCols <- sort(c(meanCols, MeanCols, stdCols))

## Subsets the data by column using these indices
reducedData <- comboData[, useCols]





## Uses descriptive activity names to name the activities in the data set

## Reads the respondent and activity numbers for the training and test data
trainResps <- read.table("./train/subject_train.txt")
testResps <- read.table("./test/subject_test.txt")
trainActs <- read.table("./train/y_train.txt")
testActs <- read.table("./test/y_test.txt")

## Merges this data, names its columns, and merges with the full dataset
comboResps <- rbind(trainResps, testResps)
comboActs <- rbind(trainActs, testActs)
comboAR <- cbind(comboResps, comboActs)
colnames(comboAR) <- c("subject", "activityno")

## Reads the activity labels doc and adds activity names in our respondent
## and activity dataset
actLabels <- read.table("./activity_labels.txt")
colnames(actLabels) <- c("activityno", "activity")
library(plyr)
comboAR2 <- join(comboAR, actLabels, by = "activityno")

## Merges the respondents and activities with the larger dataset
comboFull <- cbind(comboAR2, comboData)





## Appropriately labels the data set with descriptive variable names. 
## This is already done





## From the data set in step 4, creates a second, independent tidy data
## set with the average of each variable for each activity and each subject.

## Groups data and creates tidy dataset
library(dplyr)
groupedData <- group_by(comboFull, subject, activity)
tidyData <- dplyr::summarise_each(groupedData, funs(mean))

