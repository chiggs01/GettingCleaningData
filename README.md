#README.md
##Course Project: Getting and Cleaning Data: 
This file provides a information relating to the analysis the Human Activity Recognition Using Smartphones Data Set (Anguita et al., 2013) to provide a tidy data set satisfying the Course requirements of *Getting and Cleaning Data* (Leek et al., 2015).

This file contains the following sections:
* Contents of the GettingCleaningData repository
* About the tidy data 
* Looking at the data
* Verifying the data
* How the run_analysis() script works

##Contents of repository
This repository includes the following files:
* **Readme.md** - this file, containing information relating to the repository. It describes the tidy data set and explains the setps used to derive it.
* **TidySmartphoneData.txt** - a tab delimited version of the tidy dataset. Instructions on how to read this file are provided below.
* **CodeBook.md** - Details of the study design and raw data processing together with a description of the data measurements and data dictionary describing the structure and fields within *TidySmartphoneData.txt* 
* **run_analysis.R** - the R script containing the function used to produce the dataset contained in TidySmartphoneData.txt.  Instructions on how to run this are given below.

##Tidy Data
Leek et al. (2015) state that either *wide* or *long* versions of a tidy dataset are acceptable solutions for the Course Project.  The wide version contains each measurement as a category, while the long version treats these categories as variables which can be placed within a "Measurements" category.  There is, however, a third form which could best be described as a *short long* version.

Data measurements are generally summarised using both the mean (as a measure of central tendency) and the standard deviation (as a measure of the spread of the data from the centre) - or as a scientist may say "accuracy and reproducibility". It is important to note that these aspects of data measurement are linked, and not independent.  Thus the long version could be perceived as a non-tidy data form because the structure contains variables of mean and standard deviation mixed together in a *results* category.

The tidy data set in this repository recognises the relationship between mean and standard deviation within these grouped measurements and separates the results into two distinct columns.  The result is a true tidy data set which pairs the mean and standard deviation with the reading for each subject and activity.

##Looking at the data
The tidy dataset is a tab-delimited text file which can be loaded by many programs.  Within an R scripting environment it can be loaded using the command:
`read.table(file="myTidyData.txt", header=TRUE, sep=" ")`

##Verifying the data conversion
The file *run_analysis.R* contains code describing the function *run_analysis()*.  Executing this function will download the data, convert it to a tidy version and save the result in a file called *TidySmartphoneData*.

##How the run_analysis() script works
The run_analysis() function performs the following basic steps:
1. Download the compressed [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to a temporary file, uncompress the data and delete the temporary file.
2. Load and merge elements from the training and test subsets to create unified versions of the data (*myData*), as well as subject (*mySubjects*) and activity (*myActivities*) indexes.
3. Load the index of data recordings and parse these to identify measurements relating to mean and standard deviation. Use this information to extract the relevant columns from the data set.
4. Merge this data with the subject and activity indexes along with descriptive labels for each category.
5. Aggregate the data to provide an average response for each measurement grouped by activity and subject.
6. Modify category names to clearly differentiate records containing a mean or standard deviation and remove "mean()" and "std()" from the middle of measurement labels. 
7. Gather all the measurement variables into a single column to create a tidy data set (*myTidyData*) using the long format.
8. Separate the measurement name from the data method (ie. mean or std) using the tags developed in step 6.
9  Use the data method column to spread the measurement values across separate columns of "Mean"" and "Standard_Deviation"" for each combination of subject and activity.
10. Substitute descriptive activity names for activities in the data set.
11. Write the tidy data set to a separate file (*TidySmartphoneData.txt*)


##References:
* Anguita,D., Ghio,A., Oneto,L., Parra,X. and Reyes-Ortiz,J.L. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
* Reyes-Ortiz,J.L., Anguita,D, Ghio,A. and Oneto,L. Human Activity Recognition Using Smartphones Dataset, Version 1.0. Smartlab - Non Linear Complex Systems Laboratory,DITEN - Università degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy. November 2012.
* Leek,J., Peng,R.D. and Caffo.,B. Getting and Cleaning Data, John Hopkins Bloomberg School of Public Health, Coursera.
