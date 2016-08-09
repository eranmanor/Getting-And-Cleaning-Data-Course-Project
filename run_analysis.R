# Read the tet & train data files into a table structure
########################################################

Subject_test_data <- read.table("test/subject_test.txt")
x_test_data <- read.table("test/X_test.txt")
y_test_data <- read.table("test/y_test.txt")

Subject_train_data <- read.table("train/subject_train.txt")
x_train_data <- read.table("train/X_train.txt")
y_train_data <- read.table("train/y_train.txt")

# 1. Merges the training and the test sets to create one data set.
########################################################

x_data <- rbind(x_test_data, x_train_data)
y_data <- rbind(y_test_data, y_train_data)
subject_data <- rbind(Subject_test_data, Subject_train_data)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement
########################################################

# Read the features list from feature.txt file into a table
features_list <- read.table("features.txt")

# get only the features (= column names of he x and y data sets) that include mean or std in their names
# these features include not only ones that include mean() and std() at the end of the feature name, but also 
# features that have 'Mean' in their name, e.g meanFreq, gravityMean etc. 
# based on the fetures description in the feature_info.txt file

mean_or_std_feature <- grep("[Mm]ean|[Ss]td", features_list[,2])

# subset x_data to get only the measurements on the mean and standard deviation for each measurement (= column)
x_mean_std_data <- x_data[,mean_or_std_feature]

# assign the relevant names to the column based on the feature list
names(x_mean_std_data) <- features_list[mean_or_std_feature,2]

# 3. Uses descriptive activity names to name the activities in the data set
########################################################

# read the activities list from activity_labels.txt file into a table
activities <- read.table("activity_labels.txt")

# update value name and values in the activities data set (y_data)
names(y_data) <- "Activity"
y_data[,1] <- activities[y_data[,1],2]

# 4. Appropriately labels the data set with descriptive variable names
########################################################

# Update value name in the subject data set (subject_data)
names(subject_data) <- "Subject"

# merge the measurments, activities and subject data sets into one data set with descriptive variable names
all_mean_or_std_data <- cbind(subject_data, y_data,x_mean_std_data)

# 5. From above data set in step 4, creates a second, 
# independent tidy data set with the average of each variable for each activity and each subject
########################################################

# calculate the average of each of the variables for subject and activity (using ddply function from plyr package)
library(plyr)
averages_data_set <- ddply(all_mean_or_std_data, .(Subject, Activity), function(x) colMeans(x[, 3:88]))

# write the dataset into a text file
write.table(averages_data_set, "averages_data.txt", row.name=FALSE)

