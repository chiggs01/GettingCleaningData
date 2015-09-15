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


run_analysis <- function() {
    
    # Load required libraries
    require(stringr)
    require(tidyr)
    
    # Download and uncompressed data from Internet 
    if(!file.exists("UCI HAR Dataset")) {
        temp <- tempfile()
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                    temp)
        unzip(temp, overwrite = TRUE)
        unlink(temp)
    }
    # Merge the training and test sets to create a unified data set
    myData <- rbind(read.table("UCI HAR Dataset/train/X_train.txt", 
                    colClasses = "numeric"), 
                    read.table("UCI HAR Dataset/test/X_test.txt", 
                    colClasses = "numeric"))
    myActivities <- rbind(read.table("UCI HAR Dataset/train/y_train.txt", 
                    colClasses = "numeric"), 
                    read.table("UCI HAR Dataset/test/y_test.txt", 
                    colClasses = "numeric"))
    mySubjects <- rbind(read.table("UCI HAR Dataset/train/subject_train.txt", 
                    colClasses = "numeric"),
                    read.table("UCI HAR Dataset/test/subject_test.txt", 
                    colClasses = "numeric"))
    
    # Extract only the selected measurements relating to the mean and standard  
    # deviation from each measurement
    colTitles<-read.table("UCI HAR Dataset/features.txt")
    myColumns <- grep("-(mean|std)\\(\\)", colTitles[, 2])
    myData <- myData[, myColumns]
    
    # Label the data set with descriptive variable names, adding Activities
    # and Subject variables
    names(mySubjects)[1] <- "Subject"
    names(myActivities)[1] <- "Activity"
    names(myData)<-colTitles[myColumns, 2]
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
    myTidyData <- gather(myData, key = measurement, value = result,  
                -c(Subject, Activity))
    myTidyData <- separate(myTidyData, measurement, into = c("Measurement", 
                "reading"), sep = "\\.")
    myTidyData <- spread(myTidyData, key = reading, value = result)
    
    # Use descriptive activity names for activities in the data set 
    # Note: Added after gather process to avoid error
    myLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
    myTidyData$Activity <- myLabels[myTidyData$Activity, 2]
    
    # Save independent tidy data set
    write.table(myTidyData, file = "TidySmartphoneData.txt",  
                row.names = FALSE, sep = "\t")
    
    #Return screen version
    myTidyData
}

