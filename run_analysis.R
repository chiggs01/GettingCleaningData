run_analysis <- function() {
      ## This function returns a tidy data set showing the average and 
      ## standard deviation for each measurement taken on a number of subjects
      ## performing a range of activities.  The data was initially collected  
      ## from the accelerometers from the Samsung Galaxy S smartphone. A full  
      ## description is available at the site where the data was obtained:
      ## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

      # Merge the training and test sets to create a unified data set
      myData<-rbind(read.table("train/X_train.txt", colClasses="numeric"),
                    read.table("test/X_test.txt", colClasses="numeric"))
      myActivities<-rbind(read.table("train/y_train.txt", colClasses="numeric"),
                          read.table("test/y_test.txt", colClasses="numeric"))
      mySubjects<-rbind(read.table("train/subject_train.txt", colClasses="numeric"),
                        read.table("test/subject_test.txt", colClasses="numeric"))
      
      # Extract only measurements relating to the mean and standard deviation 
      # from each measurement
      myColumns<-as.numeric(read.table("featureColumns.csv",sep=","))
      myData<-myData[,myColumns]
      
      # Label the data set with descriptive variable names, adding Activities
      # and variable names
      colTitles<-read.table("features.txt")
      names(myData)<-colTitles[myColumns,2]
      names(myActivities)[1]<-"Activity"
      names(mySubjects)[1]<-"Subject"
      myData<-cbind(mySubjects, myActivities,myData)
      
      # determine the average of each variable grouped by activity and
      # subject, deleting duplicate columns
      myData<-aggregate(myData, list(myData$Subject,myData$Activity), mean)
      myData<-myData[-c(1:2)]
      
      # tag variables as either mean or standard deviation
      x<-names(myData)
      for (i in 1:length(x)) {
            if (str_detect(x[i], "mean()")) {
                  x[i]<-paste(sub("-mean()","",x[i],fixed=TRUE),".Mean",sep="")
            } else if (str_detect(x[i], "std()")) {
                  x[i]<-paste(sub("-std()","",x[i],fixed=TRUE),".Standard_Deviation",sep="")
            }     
            
      }
      names(myData)<-x
      
      # create an independent tidy data set 
      myTidyData<-gather(myData,key=measurement,value=result,-Subject,-Activity)
      myTidyData<-separate(myTidyData,measurement, into=c("Measurement","reading"),sep="\\.")
      myTidyData<-spread(myTidyData,key=reading,value = result)
      
      # Use descriptive activity names for activities in the data set 
      activityLabels<-read.table("activity_labels.txt")
      myTidyData$Activity<-activityLabels[myTidyData$Activity,2]
      
      # Save tidy dataset
      myTidyData
}

