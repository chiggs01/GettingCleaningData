#Code Book
This codebook analyses the Human Activity Recognition Using Smartphones Data Set (Anguita et al., 2013) to provide a tidy dataset for *Getting and Cleaning Data* (Leek et al., 2015).

##Study Design
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually (Reyes-Ortiz et al., 2012).  

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain (Reyes-Ortiz et al., 2012). 

##Data Dictionary
###Subject 
This field represents a group of 30 volunteers within an age bracket of 19-48 years
*	Unique (numeric/integer) identifier 0..30

###Activity
This character-based field lists six different activities performed by the volunteers
* WALKING	
* WALKING_UPSTAIRS   
* WALKING_DOWNSTAIRS
* SITTING           
* STANDING           
* LAYING

###Measurement
This character-based column describes the measurements used in this dataset.  These are best described in the original dataset documentation:
> [The measurements] come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)” (Anguita et al., 2013).

The names used in this dataset consist of:
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
The grand mean of all readings related to an individual measurement for each subject on a per activity basis.
* numeric/continuous data

###Standard_Deviation
The mean standard deviation for all readings related to an individual measurement for each subject on a per activity basis.
* numeric/continuous data

##References:
* Anguita,D., Ghio,A., Oneto,L., Parra,X. and Reyes-Ortiz,J.L. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
* Reyes-Ortiz,J.L., Anguita,D, Ghio,A. and Oneto,L. Human Activity Recognition Using Smartphones Dataset, Version 1.0. Smartlab - Non Linear Complex Systems Laboratory,DITEN - Università degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy. November 2012.
* Leek,J., Peng,R.D. and Caffo.,B. Getting and Cleaning Data, John Hopkins Bloomberg School of Public Health, Coursera.
