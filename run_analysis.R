run_analysis <- function() {
      ## Returns a tidy data set ...blah..blah..blah
      ##
      ##creates an independent tidy data set with the average of each variable for each activity and each subject.
      
      ## Merge the training and test sets to create one data set
      myData<-rbind(read.table("train/X_train.txt", colClasses="numeric", nrows = 5),
                    read.table("test/X_test.txt", colClasses="numeric", nrows = 3))
      myActivities<-rbind(read.table("train/y_train.txt", colClasses="numeric", nrows = 5),
                          read.table("test/y_test.txt", colClasses="numeric", nrows = 3))
      mySubjects<-rbind(read.table("train/subject_train.txt", colClasses="numeric", nrows = 5),
                          read.table("test/subject_test.txt", colClasses="numeric", nrows = 3))

      ## Extract measurements of mean and standard deviation for 
      ## each measurement
      myColumns<-as.numeric(read.table("featureColumns.csv",sep=","))
      myData<-myData[,myColumns]
      
      ## Label the data set with descriptive variable names 
      colTitles<-read.table("features.txt")
      names(myData)<-colTitles[myColumns,2]

      ## Use descriptive activity names for activities in the data set 
      activityLabels<-read.table("activity_labels.txt")
      names(myActivities)[1]<-"Activity"
      myActivities$Activity<-activityLabels[myActivities$Activity,2]

      ## create an independent tidy data set with the average of each variable
      ## for each activity and each subject
      names(mySubjects)[1]<-"Subject"
      myData<-cbind(myData,mySubjects,myActivities)
      
      myData
}

