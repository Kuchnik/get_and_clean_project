# Getting and Cleaning Data Project - The Code Book
This document describes variables used in the run_analysis.R script
The script is devided into sections (commented within the R file):
## Download files into R
### acts
the data frame with the activity lablels
### features
the vector with variable names
### X_test
data frame of measurements (testing set)
### y_test
data frame of activity indexes (testing set)
### X_train
data frame of measurements (training set)
### y_train
data frame of activity indexes (training set)
### subject_test
data frame of subject indexes (testing set)
### subject_train
data frame of subject indexes (training set)

## Combine training and testing sets
Rows of **X_test** and <X_train> were combined into X_all
Rows of **y_test** and **y_train** were combined into y_all
Rows of subject_test and subject_train were combined into subject_all
Columns of subject_all, X_all, y_all were combined into xy_all

## Naming the variables
A vector names(xy_all) was created to name all columns in the data set

## Labeling activity column
Column xy_all$activity was modified to replace activity indeces with activity names from the features vector

## Extracting mean and std for each measurement
xy_sel is a new data set with "subject", "activity" and  mean and standard deviation values extracted with the mean_std_ind character vector 

## Making variable names more descriptive and clear
The column names names(xy_sel) were modified to be more descriptive

## Making groups and calcuclating average values of each variable for each activity and each subject
The data set was groupped by subject and activity to result in the new table '/igroups' 
groups was transformed to means, in which averages of all the values for each activity (6) for each subject (30) were calculated (total 180)

## Saving table with the results
THe results were saved as "tidy.csv" file
