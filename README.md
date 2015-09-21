#README.md
##Course Project: Getting and Cleaning Data: 
This file provides a information relating to process of converting the Human Activity Recognition Using Smartphones Data Set (Anguita et al., 2013) into a tidy data set which satisfies the course requirements of *Getting and Cleaning Data* Course Project (Leek et al., 2015).

This file contains the following sections:
* [Contents of this repository](#contents-of-this-repository)
* [About the tidy data set](#about-the-tidy-data-set)
* [Looking at the data](#looking-at-the-data)
* [Verifying the data conversion](#verifying-the-data-conversion)
* [How the run_analysis() script works](#how-the-run_analysis()-script-works)

##Contents of this repository
This repository includes the following files:
* **Readme.md** - this file, containing information relating to the repository. It describes the tidy data set and explains the setps used to derive it.
* **TidySmartphoneData.txt** - a tab delimited version of the tidy dataset. Instructions on how to read this file are provided below.
* **CodeBook.md** - Details of the study design and raw data processing together with a description of the data measurements and data dictionary describing the structure and fields within *TidySmartphoneData.txt* 
* **run_analysis.R** - the R script containing the function used to produce the dataset contained in TidySmartphoneData.txt.  Instructions on how to run this are given below.

##About the tidy data set
Leek et al. (2015) state that either *wide* or *long* versions of a tidy dataset are acceptable solutions for the Course Project.  The wide version contains each measurement as a category, while the long version treats these categories as variables which can be placed within a "Measurements" category.  There is, however, a third form which could best be described as a *short long* version.

Data measurements are generally summarised using both the mean (as a measure of central tendency) and the standard deviation (as a measure of the spread of the data from the centre) - or as a scientist may say "accuracy and reproducibility". It is important to note that these aspects of data measurement are linked, and not independent.  Thus the long version could be perceived as a non-tidy data form because the structure contains variables of mean and standard deviation mixed together in a *results* category.

The tidy data set in this repository recognises the relationship between mean and standard deviation within these grouped measurements and separates the results into two distinct columns.  The result is a true tidy data set which pairs the mean and standard deviation with the reading for each subject and activity.

Further details about the measurements taken are contained in [Codebook.md](CodeBook.md)

##Looking at the data
The tidy data set is a tab-delimited text file which can be loaded by many programs.  Within an R scripting environment it can be loaded using the command:
`read.table(file="myTidyData.txt", header=TRUE, sep=" ")`

##Verifying the data conversion
The file *run_analysis.R* contains code describing the function *run_analysis()*.  Executing this function will download the data, convert it to a tidy version and save the result in a file called *TidySmartphoneData*.

##How the run_analysis() script works
The run_analysis() function performs the following basic steps:

1.  Load the *stringr* and *tidyr* libraries
2.  Check to see if the data is available for transforming.  If not available, download the compressed [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to a temporary file (*myTemp*), uncompress/extract the data to the current working directory, and delete the temporary file.
3.  Load and merge elements from the training and test subsets to create unified versions of the experimental data (*myData*), as well as subject (*mySubjects*) and activity (*myActivities*) indexes.
4.  Load the measurements features used in the experiment and parse these to identify which measurements relate to records of mean and standard deviation. Use this information to extract only the relevant columns from the data set.
5.  Provide  descriptive labels for all columns, and merge this data with the subject and activity indexes.
6.  Aggregate the data to provide an average response for each measurement grouped by activity and subject.
7.  Modify category names to clearly differentiate records identifying a mean or standard deviation result and remove "mean()" and "std()" from the middle of measurement labels. 
8.  Gather all the measurement variables into a single column to create a tidy data set (*myTidyData*) using the long format.
9.  Separate the measurement name from the data method (ie. mean or std) using the tags developed in step 7.
10.  Use the newly created "data method" to spread the measurement values across separate columns of "Mean" and "Standard_Deviation" for each combination of subject and activity.
11.  Substitute descriptive activity names for activities within the data set.
12.  Write the tidy data set to a separate file (*TidySmartphoneData.txt*)


##References:
* Anguita,D., Ghio,A., Oneto,L., Parra,X. and Reyes-Ortiz,J.L. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
* Reyes-Ortiz,J.L., Anguita,D, Ghio,A. and Oneto,L. Human Activity Recognition Using Smartphones Dataset, Version 1.0. Smartlab - Non Linear Complex Systems Laboratory,DITEN - Università degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy. November 2012.
* Leek,J., Peng,R.D. and Caffo.,B. Getting and Cleaning Data, John Hopkins Bloomberg School of Public Health, Coursera.
