## This script returns a tidy data set showing the average and 
## standard deviation for each measurement taken on a number of subjects
## performing a range of activities.  The data was initially collected  
## from the accelerometers from the Samsung Galaxy S smartphone. A full  
## description is available at the site where the data was obtained:
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## The data extracted from this archive should be placed in the same directory
## as the script, along with the file "featureColumns.csv" which identifies the
## selected measurements.  This file can be edited to alter the measurements 
## analysed.

## The Run_Analysis function requires access to the following files with the 
## designated paths relative to this script 
##  * features.txt
##  * featureColumns.csv
##  * train/X_train.txt
##  * train/y_train.txt
##  * test/X_test.txt
##  * test/y_test.txt
##  * train/subject_train.txt
##  * test/subject_test.txt
##  * activity_labels.txt
## It also requires the libraries "stringr" and "tidyr"

#  Load required libraries
    require(stringr)
    require(tidyr)

Run_Analysis <- function() {
    
    # Merge the training and test sets to create a unified data set
    myData <- rbind(read.table("train/X_train.txt", colClasses = "numeric"),
                read.table("test/X_test.txt", colClasses = "numeric"))
    myActivities <- rbind(read.table("train/y_train.txt", colClasses = "numeric"),
                read.table("test/y_test.txt", colClasses = "numeric"))
    mySubjects <- rbind(read.table("train/subject_train.txt", colClasses = "numeric"),
                read.table("test/subject_test.txt", colClasses = "numeric"))
    
    # Extract only the selected measurements relating to the mean and standard  
    # deviation from each measurement
    myColumns <- as.numeric(read.table("featureColumns.csv", sep = ","))
    myData <- myData[,myColumns]
    
    # Label the data set with descriptive variable names, adding Activities
    # and Subject variables
    names(mySubjects)[1] <- "Subject"
    names(myActivities)[1] <- "Activity"
    colTitles<-read.table("features.txt")
    names(myData)<-colTitles[myColumns,2]
    myData <- cbind(mySubjects, myActivities, myData)
    
    # Determine the average of each variable grouped by activity and
    # subject, deleting duplicate columns
    myData <- aggregate(myData, list(myData$Subject, myData$Activity), mean)
    myData <- myData[-c(1:2)]
    
    # Tag measurements as either mean or standard deviation for tidying
    colTitles <- names(myData)
    for (i in 1:length(colTitles)) {
        if (str_detect(colTitles[i], "mean()")) {
            colTitles[i] <- paste(sub("-mean()", "", colTitles[i],  
                        fixed = TRUE), ".Mean", sep = "")
        } else if (str_detect(colTitles[i], "std()")) {
            colTitles[i] <- paste(sub("-std()", "", colTitles[i],  
                        fixed = TRUE), ".Standard_Deviation", sep = "")
        }     
    }
    names(myData) <- colTitles
    
    # create an independent tidy data set 
    myTidyData <- gather(myData, key = measurement, value = result, -Subject, 
                -Activity)
    myTidyData <- separate(myTidyData, measurement, into = c("Measurement", 
                "reading"), sep = "\\.")
    myTidyData <- spread(myTidyData, key = reading, value = result)
    
    # Use descriptive activity names for activities in the data set 
    # Note: Added after gather process to avoid error
    myLabels <- read.table("activity_labels.txt")
    myTidyData$Activity <- myLabels[myTidyData$Activity, 2]
    
    # Save independent tidy data set
    write.table(myTidyData, file = "TidySmartphoneData.txt", row.names = FALSE, 
                sep = "\t")
    
    #Return screen version
    myTidyData
}

