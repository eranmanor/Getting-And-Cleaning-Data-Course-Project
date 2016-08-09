# Introduction
This file provides additional information about the data, variables and transformation used in "Getting and Cleaning Data" course Final Project
## Source Data
[The source data for the project can be found here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

A full description is available at the site where the data was obtained [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Source Data Description
The data was gathered from experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
Using its embedded accelerometer and gyroscope, data captured included 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters
and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used.
From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Source Data files used
The files which are used for this assignment from he source data are:

1. **X_train.txt:** Training set

2. **y_train.txt:** Training labels

3. **X_test.txt:** Test set

4. **y_test.txt:** Test labels

Also avalaible for the train and test data. Their descriptions are equivalent:

5. **subject_train.txt:** Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30

## Measurments/Variables Description
in each of training and Test data sets there are 561 different measurments that are being acumulated, their description is provided in the file called: **features_info.txt**

The measurments come from the accelerometer and gyroscope 3-axial raw signals **tAcc-XYZ** and **tGyro-XYZ**.
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals **tBodyAcc-XYZ** and **tGravityAcc-XYZ**
 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals **tBodyAccJerk-XYZ** and **tBodyGyroJerk-XYZ**
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm **tBodyAccMag**, **tGravityAccMag**, **tBodyAccJerkMag**, **tBodyGyroMag**, **tBodyGyroJerkMag**.

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing **fBodyAcc-XYZ**, **fBodyAccJerk-XYZ**, **fBodyGyro-XYZ**, **fBodyAccJerkMag**, **fBodyGyroMag**, **fBodyGyroJerkMag**.
(Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

**tBodyAcc-XYZ**

**tGravityAcc-XYZ**

**tBodyAccJerk-XYZ**

**tBodyGyro-XYZ**

**tBodyGyroJerk-XYZ**

**tBodyAccMag**

**tGravityAccMag**

**tBodyAccJerkMag**

**tBodyGyroMag**

**tBodyGyroJerkMag**

**fBodyAcc-XYZ**

**fBodyAccJerk-XYZ**

**fBodyGyro-XYZ**

**fBodyAccMag**

**fBodyAccJerkMag**

**fBodyGyroMag**

**fBodyGyroJerkMag**

The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation

mad(): Median absolute deviation 

max(): Largest value in array

min(): Smallest value in array

sma(): Signal magnitude area

energy(): Energy measure. Sum of the squares divided by the number of values. 

iqr(): Interquartile range 

entropy(): Signal entropy

arCoeff(): Autorregresion coefficients with Burg order equal to 4

correlation(): correlation coefficient between two signals

maxInds(): index of the frequency component with largest magnitude

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

skewness(): skewness of the frequency domain signal 

kurtosis(): kurtosis of the frequency domain signal 

bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window

angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

**gravityMean**

**tBodyAccMean**

**tBodyAccJerkMean**

**tBodyGyroMean**

**tBodyGyroJerkMean**

## Data Transformation

### Step1: Merges the training and the test sets to create one data set
Read the test & train data files into a table structure:

1. Subject_test_data

2. x_test_data

3. y_test_data

4. Subject_train_data

5. x_train_data

6. y_train_data

Merge the Train and Test data using rbing function:

x_data <- rbind(x_test_data, x_train_data)

y_data <- rbind(y_test_data, y_train_data)

subject_data <- rbind(Subject_test_data, Subject_train_data)

### Step2: Extracts only the measurements on the mean and standard deviation for each measurement
Create a vector that hold only the number of the columns in each data set that have _mean_ or _std_ in he name of the feature (measurment)
and use this vector to subset the data in the merged data set and assign the relevant names to the column based on the feature list

### Step 3: Uses descriptive activity names to name the activities in the data set
Read the activities lables file into a table and substitute the activity number with the descriptive activity name

### Step 4: Appropriately labels the data set with descriptive variable names
Merge the measurments, activities and subject data sets into one data set using cbind with descriptive variable names

### Step 5: From above data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
WE create a data set with average of each variable for each activity and each subject using the plyr package and the ddply function.
Finally we write the data set out to afile called averages_data.txt
