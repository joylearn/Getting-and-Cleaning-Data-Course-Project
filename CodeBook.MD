# Introduction

##Data source

The orignial data for this project is https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
 
Please read the README.txt and Features_info.txt of original dataset (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )
to learn more about the feature selection for this dataset.



## The Significant data files used by the codes - (run_analysis.R):

*  "X_train.txt" holds the values of 561 variables, where the names of these 561 variables are recorded in "features.txt"as observation.

*  "activity_labels.txt" is a master data file and it presents the 6 different levels of "Activity" variable in Y_train.txt.

*  "features.txt" is a master data file and it presents 561 columns in X_train.txt

*  "Subject_train.txt" has only 1 variable where the values will always be < or = 30 for only 30 volunteers are involved in the experiments.

### (The above 4 points holds true for test data)

*  The only output file "Tiny.txt" generated, captures the ave of each variable for each activity and each subject.



