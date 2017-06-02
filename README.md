# README

## Project Description

This piece of work is for peer-graded assignment on 'Getting and Cleaning Data Course Project' at Coursera. It uses ['Human Activity Recognition Using Smartphones Data Set'](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#) as input, transforms and summarizes it accordingly to the next steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Files
The repo contain the next files:
* `./CodeBook.md` - description of variables, produced in 'tidydata.txt'
* `./README.md` - this text file
* `./run_analysis.R` - a script to transform and summarize original body activity data set from 'data' folder
* `./tidydata.txt`  - a tidy data set as the result of 'run_analysis.R' script
* `./data/` - a folder with original unchanged data set, that is used by 'run_analysis.R' script

## Analysis notes

Please note that this repo doesn't contain 'data' folder, which is supposed to be there if you want to run the script by yourself. Download original data set by the link in the Project Description section and unpack it to 'data' directory in the root folder.

`./run_analysis.R` script contains comments to mark all taken steps. Please note that I decided to combine the 1st step with the 4th, assigning descriptive variable names from the original codebook right after loading data in R.

## Author
_Yaroslav Vasyunin,
Coursera student_

June 2, 2017
