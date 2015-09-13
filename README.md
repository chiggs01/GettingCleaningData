#README.md
##Course Project: Getting and Cleaning Data: 
This codebook analyses the Human Activity Recognition Using Smartphones Data Set (Anguita et al., 2013) to provide a tidy dataset for the course project in *Getting and Cleaning Data* (Leek et al., 2015).

##Contents
This repository includes the following files:
*	**CodeBook.md** - A description of the measurements and data fields within *TidySmartphoneData.txt* 
*	**featureColumns.csv** - A list of data measurements selected from the  Human Activity Recognition Using Smartphones Data Set.  This file can be edited to add additional measurements to the selection.
* **Readme.md** - this file, information relating to the repository.
* **run_analysis.R** - the R script used to produce the dataset contained in TidySmartphoneData.txt
*	**TidySmartphoneData.txt** - a tab delimited version of the tidy dataset

##Tidy Data
Leek et al. (2015) state that either *wide* or *long* versions of a tidy dataset are acceptable.  The wide version considers the long list of different measurements as variables which can be placed within a "Measurements" category.  
Data measurements are often summarised using both the mean (as a measure of central tendency) and the standard deviation (as a measure of the spread of the data) - or as a scientist may say "accuracy and reproducibility".  These aspects are linked, and not independent.
The script used in this repository recognises the relationship between mean and standard deviation within these grouped measurements as a potential non-tidy form and spreads the mean and standard deviation into separate columns, thus creating a true tidy data set.

##Loading the script
instructions for loading file, Required libraries, Data in directories

##How the script works


##References:
* Anguita,D., Ghio,A., Oneto,L., Parra,X. and Reyes-Ortiz,J.L. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
* Reyes-Ortiz,J.L., Anguita,D, Ghio,A. and Oneto,L. Human Activity Recognition Using Smartphones Dataset, Version 1.0. Smartlab - Non Linear Complex Systems Laboratory,DITEN - Università degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy. November 2012.
* Leek,J., Peng,R.D. and Caffo.,B. Getting and Cleaning Data, John Hopkins Bloomberg School of Public Health, Coursera.
