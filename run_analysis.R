# Getting and cleaning data assignment

# Download files into R
acts <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#Combine training and testing sets
X_all <- rbind(X_test,X_train)
y_all <- rbind(y_test,y_train)
subject_all <- rbind(subject_test,subject_train)
xy_all <- cbind(subject_all,y_all,X_all)

# Naming the variables
names(xy_all) <- c("subject","activity",as.character(features$V2))

# View the data to check everything looks OK
xy_all[1:5,1:5]
xy_all[1,2]
str(features)
is.data.frame(features)
class(acts$V2)

# Labeling activity column
for (i in acts$V1) xy_all$activity <- gsub(i,as.character(acts[i,2]),xy_all$activity)

# Extracting mean and std for each measurement
mean_std_ind <- grep("-mean\\()|-std\\()",names(xy_all))
xy_sel <- xy_all[,c(1,2,mean_std_ind)]
xy_sel[1:100,1:5]
str(xy_sel)

# Making variable names more descriptive and clear
names(xy_sel) <- gsub("^t","time",names(xy_sel))
names(xy_sel) <- gsub("^f","freq",names(xy_sel))
names(xy_sel) <- gsub("\\()","",names(xy_sel))

# Making groups and calcuclating average values of each variable for each activity and each subject
groups <- xy_sel %>% group_by(subject,activity)
means <- groups %>% summarize_all(mean)
means[1:20,1:5]

# Saving table with the results
write.table(means,"tidy.txt",row.names = FALSE)

