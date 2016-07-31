
# Set the working directory to where the UCI Human Activity Recognition Dataset was unzipped
setwd("C:/Users/jopapa/Documents/Coursera/UCI HAR Dataset/") 

# Set the locations of data files based upon the working directory
X_train_filename <- paste(getwd(),"/train/X_train.txt",sep="")
y_train_filename <- paste(getwd(),"/train/y_train.txt",sep="")
subject_train_filename <- paste(getwd(),"/train/subject_train.txt",sep="")
X_test_filename <- paste(getwd(),"/test/X_test.txt",sep="")
y_test_filename <- paste(getwd(),"/test/y_test.txt",sep="")
subject_test_filename <- paste(getwd(),"/test/subject_test.txt",sep="")

# Load the training data
X_train <- read.table(X_train_filename, sep="", header=FALSE)
y_train <- read.table(y_train_filename, sep="", header=FALSE)
subject_train <- read.table(subject_train_filename, sep="", header=FALSE)

# Load the test data
X_test <- read.table(X_test_filename, sep="", header=FALSE)
y_test <- read.table(y_test_filename, sep="", header=FALSE)
subject_test <- read.table(subject_test_filename, sep="", header=FALSE)

# Merge the training and the test sets using rbind()
X_all <- rbind(X_train, X_test)
y_all <- rbind(y_train, y_test)
subject_all <- rbind(subject_train, subject_test)

# Extract the mean and standard deviation for each measurement of X
sapply(X_all, mean)  # mean
sapply(X_all, sd)    # standard deviation

# Use the descriptive activity names to name the activities in the data set
y_all$V1 <- as.factor(y_all$V1)
levels(y_all$V1)
levels(y_all$V1)[levels(y_all$V1)=="1"] <- "WALKING"
levels(y_all$V1)[levels(y_all$V1)=="2"] <- "WALKING_UPSTAIRS"
levels(y_all$V1)[levels(y_all$V1)=="3"] <- "WALKING_DOWNSTAIRS"
levels(y_all$V1)[levels(y_all$V1)=="4"] <- "SITTING"
levels(y_all$V1)[levels(y_all$V1)=="5"] <- "STANDING"
levels(y_all$V1)[levels(y_all$V1)=="6"] <- "LAYING"
levels(y_all$V1)

# Recognize the subject data as a factor
subject_all$V1 <- as.factor(subject_all$V1)
levels(subject_all$V1)

# Appropriately label the data sets with descriptive variable names
features_filename <- paste(getwd(),"/features.txt",sep="")
features <- read.table(features_filename, sep="", header=FALSE)
names(X_all) <- features[,2]
names(y_all) <- "activity"
names(subject_all) <- "subject"

# Merge all data sets to create one master dataframe using cbind()
All_Data <- cbind(subject_all,y_all,X_all)

# Create an independent tidy data set with the average of each variable for each activity and each subject
tidy <- aggregate(All_Data[names(X_all)], by = All_Data[c("activity","subject")], FUN=mean)

# Write the output of the average of each variable for each activity and each subject
output_filename <- paste(getwd(),"/tidy.txt",sep="")
write.table(tidy, output_filename, sep="\t", row.names=FALSE)
