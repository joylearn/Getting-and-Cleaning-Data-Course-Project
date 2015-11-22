setwd("~/JH/C3 - Getting n Cleaning Data/CourseWork/data")

# STEP 1:
#Read & merge training and test sets while holding back the merging to create one big data set.
# will create the one big data set later in step 5.

# step 1a : Read the Value of "Feature" variables from the below files.  Then merge.
x_train <- read.table("train/X_train.txt", header = FALSE) 
x_test <- read.table("test/X_test.txt", header = FALSE) 
Feature_values <- rbind(x_train, x_test)  # 10299 obs of 561 variables

# step 1b : Read the Value of "Activity" variable from the below files. Then merge.
y_train <- read.table("train/y_train.txt", header = FALSE)
y_test <- read.table("test/y_test.txt", header = FALSE) 
Activity_values <- rbind(y_train, y_test)

# step 1c : Read the valvues of "Subject" variable from the below files.
subject_train <- read.table("train/subject_train.txt", header = FALSE)
subject_test <- read.table("test/subject_test.txt", header = FALSE) 
Subject_values <- rbind(subject_train, subject_test)

# we hold back the creation of the 1 big data set for now.


#STEP 2:
#Extracts only the measurement on the mean and standard deviation for each measurement.

FeaturesName <- read.table("./features.txt", header = FALSE)

# get only columns with mean() or std() in their names
# mean_and_std_features is a int vector shows the rows number that has mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", FeaturesName[, 2])

# The relationship between feature.txt and x_train.txt/x_test.txt can be simplied as :
# 1st row in feature.txt is the  1st column in x_train.txt/x_test.txt
# 28th row in feature.txt = 28th column in x_train.txt/x_test.txt

# FV_1's colunms is now reduced to 66, with 10299 rows unchanged. 
# FV_1 has only cloumns with mean & Std in their names.
Feature_values <- Feature_values[, mean_and_std_features]

# add meaningful columns name to Feature_values data frame.
 names(Feature_values) <- FeaturesName[mean_and_std_features, 2] 

#STEP 3:
#Uses descriptive activity names to name the activities in the data set.

# activity_labels.txt has 6 observations of 2 variables   
Activity_labels <- read.table("activity_labels.txt", header = FALSE)
 
# The relationship between activity_labels.txt and y_train.txt/y_test.txt can be simplied as :
# Column1 in activity_labels.txt is the secondary key in y_train.txt/y_test.txt

Activity_values[, 1] <- Activity_labels[Activity_values[,1],2]  

# add meaningful columns name to Activity_values data frame.
names(Activity_values) <- "activity"


#STEP 4:
#Appropriately labels the data set with descriptive variable names. 

# Features_values data set was assigned descriptive variable names in step 2.
# Activity_values data set was assigned descriptive variable names in step 3.
# now to complete by adding meaningful columns name to Subject_values data frame

names(Subject_values) <- "subject"


#STEP 4a: creating one big data set.
Big_data <- cbind(Feature_values, Activity_values, Subject_values)


#STEP 5:
# creates a second, independent tidy data set with
# the average of each variable for each activity and each subject

#library(plyr)
library(reshape2)

Big_data_Long <- melt(Big_data, id = c("subject", "activity")) 
Big_data_Wide.mean <- dcast(Big_data_Long, subject + activity ~ variable, mean) 


write.table(Big_data_Wide.mean, "tidy.txt", row.names = FALSE, quote = FALSE) 



 