---
title: "Codebook.md"
output: html_document
---
<!---
according to lecture notes, the code book should contain:
1. Information about the variables (including units!) in the dataset not contained in the dity data
2. Information about the summary choices you made
3. Information about the experimental study design you used

A code book describing each variable and its values in the tidy data set.

    CodeBook section:
        Info about each variable, including units.
        Info about the summary choices you made.
    Study Design section:
        Info about the experimental study design you used, with a thorough description of how you collected the data and how you made decisions on which variables to include.
        
    Generally word/txt file, or markup file.

--->

# Study design

The study included 30 subjects who were asked to perform activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors. Subjects were volunteers and within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). The data was collected by using by using the accelerometers from the Samsung Galaxy S II  smartphone. The purpose of this study was to use the collected data to enable human activity recognition.    

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

More details about the study can be found here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Raw data

## Data files
The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

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
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'


# Codebook

I would like to refer here to the README.md file for the description of the code. It was unclear to me what to add here which has not been described already in the README.md file. I think that the assignment was not very clear in this point. README.md gives a detailed description of the summary choices which I made and the code.

# Information about the variables in the tidy dataset

* subjectID: gives the subject identifier (number)
* activity: gives the activity (character with six entries)
    * WALKING
    * WALKING_UPSTAIRS
    * WALKING_DOWNSTAIRS
    * SITTING
    * STANDING
    * LAYING
* tBodyAccelerometerMeanX 
* tBodyAccelerometerStdX 
* tBodyAccelerometerMeanY 
* tBodyAccelerometerStdY 
* tBodyAccelerometerMeanZ 
* tBodyAccelerometerStdZ 
* tGravityAccelerometerMeanX 
* tGravityAccelerometerStdX 
* tGravityAccelerometerMeanY 
* tGravityAccelerometerStdY 
* tGravityAccelerometerMeanZ 
* tGravityAccelerometerStdZ 
* tBodyAccelerometerJerkMeanX 
* tBodyAccelerometerJerkStdX 
* tBodyAccelerometerJerkMeanY 
* tBodyAccelerometerJerkStdY 
* tBodyAccelerometerJerkMeanZ 
* tBodyAccelerometerJerkStdZ 
* tBodyGyroscopeMeanX 
* tBodyGyroscopeStdX 
* tBodyGyroscopeMeanY 
* tBodyGyroscopeStdY 
* tBodyGyroscopeMeanZ 
* tBodyGyroscopeStdZ 
* tBodyGyroscopeJerkMeanX 
* tBodyGyroscopeJerkStdX 
* tBodyGyroscopeJerkMeanY 
* tBodyGyroscopeJerkStdY 
* tBodyGyroscopeJerkMeanZ 
* tBodyGyroscopeJerkStdZ 
* tBodyAccelerometerMagMean 
* tBodyAccelerometerMagStd 
* tGravityAccelerometerMagMean 
* tGravityAccelerometerMagStd 
* tBodyAccelerometerJerkMagMean 
* tBodyAccelerometerJerkMagStd 
* tBodyGyroscopeMagMean 
* tBodyGyroscopeMagStd 
* tBodyGyroscopeJerkMagMean 
* tBodyGyroscopeJerkMagStd 
* fBodyAccelerometerMeanX 
* fBodyAccelerometerStdX 
* fBodyAccelerometerMeanY 
* fBodyAccelerometerStdY 
* fBodyAccelerometerMeanZ 
* fBodyAccelerometerStdZ 
* fBodyAccelerometerJerkMeanX 
* fBodyAccelerometerJerkStdX 
* fBodyAccelerometerJerkMeanY 
* fBodyAccelerometerJerkStdY 
* fBodyAccelerometerJerkMeanZ 
* fBodyAccelerometerJerkStdZ 
* fBodyGyroscopeMeanX 
* fBodyGyroscopeStdX 
* fBodyGyroscopeMeanY 
* fBodyGyroscopeStdY 
* fBodyGyroscopeMeanZ 
* fBodyGyroscopeStdZ 
* fBodyAccelerometerMagMean 
* fBodyAccelerometerMagStd 
* fBodyBodyAccelerometerJerkMagMean 
* fBodyBodyAccelerometerJerkMagStd 
* fBodyBodyGyroscopeMagMean 
* fBodyBodyGyroscopeMagStd 
* fBodyBodyGyroscopeJerkMagMean 
* fBodyBodyGyroscopeJerkMagStd

Prefix t denotes time while prefix f denotes frequency. Suffix Mean denotes mean of the measurement while suffix Std denotes standard deviation. Prefix X denotes the X-axis, Y the Y-axis, Z the Z-axis. Accelerometer in the variable name means that the accelerometer of the Smartphone was used to obtain the measurement. Gyroscope in the variable name means that the gyroscope of the smartphone was used. The acceleration signal was separated into body and gravity signals (see variables names with body and variable names with Gravity). Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccelerometerJerk-XYZ and tBodyGyrocopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccelerometerMag, tGravityAccMag, tBodyAccelerometerJerkMag, tBodyGyroscopeMag, tBodyGyroscopeJerkMag). 

