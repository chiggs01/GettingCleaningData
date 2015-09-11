run_analysis <- function() {
      ## Returns a tidy data set ...blah..blah..blah
      ##
      ##creates an independent tidy data set with the average of each variable for each activity and each subject.
      
      # Merge the training and test sets to create one data set
      myData<-rbind(read.table("train/X_train.txt", colClasses="numeric"),
                    read.table("test/X_test.txt", colClasses="numeric"))
      
      # Extract measurements relating to the mean and standard deviation 
      # from each measurement
      myColumns<-as.numeric(read.table("featureColumns.csv",sep=","))
      myData<-myData[,myColumns]
      
      # Label the data set with descriptive variable names 
      colTitles<-read.table("features.txt")
      names(myData)<-colTitles[myColumns,2]
      
      # Add Activities and Subjects to the data set using descriptive 
      # variable names
      myActivities<-rbind(read.table("train/y_train.txt", colClasses="numeric"),
                          read.table("test/y_test.txt", colClasses="numeric"))
      mySubjects<-rbind(read.table("train/subject_train.txt", colClasses="numeric"),
                        read.table("test/subject_test.txt", colClasses="numeric"))
      names(myActivities)[1]<-"Activity"
      names(mySubjects)[1]<-"Subject"
      myData<-cbind(mySubjects, myActivities,myData)
      
      
      # determine the average of each variable grouped around activity
      # and subject
      myData<-aggregate(myData, list(myData$Subject,myData$Activity), mean)
      myData<-myData[-c(1:2)]
      
      # Use descriptive activity names for activities in the data set 
      activityLabels<-read.table("activity_labels.txt")
      myData$Activity<-activityLabels[myData$Activity,2]
      
      # create an independent tidy data set 
}

