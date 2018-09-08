# Getting and Cleaning_Data_Project

The code file run_analysis.R contains the following parts:
## 1. Download files into R - 
The archived directory contains the following data required for the analysis:
activity_labels.txt - 6 kinds of activity and an index (1-6) to it;
features.txt - vector of measurement names (561) performed during the experiment;
X_test.txt and X_train - data frames of measurements (testing set and training set, resp.);
y_test and y_train - activity indexes for those measurements (testing set and training set, resp.);
subject_test.txt and subject_train.txt - indexes (1-30) of individuals participating in the experiment
testing set and training set, resp.)
## 2. Combine training and testing sets - 
links all of the above data in a single data frame
## 3. Naming the variables - 
names the columns of the data frame from the "features.txt" vector
## 4. View the data to check everything looks OK - 
views parts of the table and classes of variables
## 5. Labeling activity column - 
a line of code to name the activities in the data set
## 6. Extracting mean and std for each measurement - 
extracts only columns with mean and standard deviation for each measurement (total 66)
## 7. Making variable names more descriptive and clear - 
replaces "t" and "f" with "time" and "freq" (frequency) and removing brackets
## 8. Making groups and calcuclating average values of each variable for each activity and each subject -
groups the data set by activity and subject and calculates a mean for each column:
the calculated value is for each activity (1-6) for each subject (1-30) - total: 180 observations
## 9. Saving the "tidy.csv" table 
