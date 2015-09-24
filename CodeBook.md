#Code Book
This file provides a codebook for converting the Human Activity Recognition Using Smartphones Data Set (Anguita et al., 2013) into a tidy data set which satisfies the course requirements of *Getting and Cleaning Data* Course Project (Leek et al., 2015).

This file contains the following sections:
* [Study design and data processing](#study-design-and-data-processing)
* [Accessing the tidy data](#accessing-the-tidy-data) 
    * Viewing the tidy data file
    * Verifying the data conversion
    * Steps in creating the tidy data set
* [Data dictionary](#data-dictionary)

##Study Design and Data Processing
Experiments were conducted using a group of 30 volunteers between the ages of 19-48. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Its embedded accelerometer and gyroscope were used to capture 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz (Reyes-Ortiz et al., 2012).  

Accelerometer and gyroscope signals were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force was assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain (Reyes-Ortiz et al., 2012). 

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). The magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)” (Anguita et al., 2013).

##Accessing the tidy data
###Viewing the tidy data file
The tidy data set is a tab-delimited text file which can be loaded by many programs.  Within an R scripting environment it can be loaded using the command:
`read.table(file="myTidyData.txt", header=TRUE, sep=" ")`

###Verifying the data conversion
The file *run_analysis.R* contains code describing the function *run_analysis()*.  Executing this function will download the data, convert it to a tidy version and save the result in a file called *TidySmartphoneData.txt*. This can be compared the the [TidySmartphoneData.txt](TidySmartphoneData.txt) in this repository.

###Steps in creating the tidy data set
The *run_analysis()* function detailed in the run_analysis.R file undertakes the following basic steps: 

1.  Downloads and extracts the [data repository](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2.  Merges the training and test subsets to create a unified data set, and extracts only results for mean and standard deviation.
3.  Summarises this data in a tidy format and saves the output in a separate file (*TidySmartphoneData.txt*)

More detailed instructions on the transformation process are contained in [README.md](README.md).

##Data Dictionary
###Subject 
This numeric/integer field is used to identify participants from of a group of 30 volunteers within an age bracket of 19-48 years
*	Unique identifier 0..30

###Activity
This character/ordinal field describes the type of activity undertaken by the subject.  Six different activities were performed:
* WALKING	
* WALKING_UPSTAIRS   
* WALKING_DOWNSTAIRS
* SITTING           
* STANDING           
* LAYING

###Measurement
This character-based field identifies the type of data obtained from the Smartphone's internal gyroscope and accelerometer.  The list was derived from the measurements types within the raw data containing either a mean and standard deviation. No units were provided for the measurements.
The values contained in this data set are:
* fBodyAcc-X
* fBodyAcc-Y
* fBodyAcc-Z
* fBodyAccJerk-X
* fBodyAccJerk-Y
* fBodyAccJerk-Z
* fBodyAccMag
* fBodyBodyAccJerkMag
* fBodyBodyGyroJerkMag
* fBodyBodyGyroMag
* fBodyGyro-X
* fBodyGyro-Y
* fBodyGyro-Z
* tBodyAcc-X
* tBodyAcc-Y
* tBodyAcc-Z
* tBodyAccJerk-X
* tBodyAccJerk-Y
* tBodyAccJerk-Z
* tBodyAccJerkMag
* tBodyAccMag
* tBodyGyro-X
* tBodyGyro-Y
* tBodyGyro-Z
* tBodyGyroJerk-X
* tBodyGyroJerk-Y
* tBodyGyroJerk-Z
* tBodyGyroJerkMag
* tBodyGyroMag
* tGravityAcc-X
* tGravityAcc-Y
* tGravityAcc-Z
* tGravityAccMag

###Mean 
The average mean of all data readings corresponding to a particular measurement, subject, and activity.
* numeric/continuous data

###Standard_Deviation
The average standard deviation of all data readings corresponding to a particular measurement, subject, and activity.
* numeric/continuous data

##References:
* Anguita,D., Ghio,A., Oneto,L., Parra,X. and Reyes-Ortiz,J.L. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
* Leek,J., Peng,R.D. and Caffo.,B. Getting and Cleaning Data, John Hopkins Bloomberg School of Public Health, Coursera.
* Reyes-Ortiz,J.L., Anguita,D, Ghio,A. and Oneto,L. Human Activity Recognition Using Smartphones Dataset, Version 1.0. Smartlab - Non Linear Complex Systems Laboratory,DITEN - Università degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy. November 2012.

