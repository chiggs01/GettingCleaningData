#Code Book
Human Activity Recognition Using Smartphones Data Set

##Fields
###Subject 
This field represents a group of 30 volunteers within an age bracket of 19-48 years
*	Unique (numeric) identifier 0..30

###Activity
This field lists six different activities performed by the volunteers
* WALKING	
* WALKING_UPSTAIRS   
* WALKING_DOWNSTAIRS
* SITTING           
* STANDING           
* LAYING

###Measurement
These measurements are best described in the original dataset documentation:
> These [measurements] come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

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
The grand mean of all readings for each subject performing each activity.
* numeric

###Standard_Deviation
The mean standard deviation for all readings for each subject performing each activity.
* numeric

##References:
* Anguita,D., Ghio,A., Oneto,L., Parra,X. and Reyes-Ortiz,J.L. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
* Leek,J., Peng,R.D. and Caffo.,B. Getting and Cleaning Data, John Hopkins Bloomberg School of Public Health, Coursera.