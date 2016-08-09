run_analysis<-function(){
  library(dplyr)
  library(plyr)
## read the features names file
  path<-"./UCI HAR Dataset/features.txt"
  features<<-read.table(path,na.strings = "NA",header=F)

## Read the activity_labels file and assign the column names 
  path<-"./UCI HAR Dataset/activity_labels.txt"
  activity_labels<<-read.table(path,na.strings = "NA",header=F ,col.names=c("id","Activity"))

## Read the x_test & x_train  files 
## and assign the column names from the features vector read previously
## merge the two data into one data from called x_data
  
 path<-"./UCI HAR Dataset/test/X_test.txt"
  x_test<-read.table(path,na.strings = "NA",header=F,col.names = features[,2])
  path<-"./UCI HAR Dataset/train/X_train.txt"
  x_train<-read.table(path,na.strings = "NA",header=F,col.names = features[,2])
  x_data<<-rbind(x_test,x_train)
  
## Read the y_test file , The Activity types
 path<-"./UCI HAR Dataset/test/y_test.txt"
 y_test<-read.table(path,na.strings = "NA",header=F,col.names="Activity")
 path<-"./UCI HAR Dataset/train/y_train.txt"
 y_train<-read.table(path,na.strings = "NA",header=F,col.names="Activity")
 y_data<<-rbind(y_test,y_train)
 
#read the subject_test file for the people tested
 path<-"./UCI HAR Dataset/test/subject_test.txt"
 subject_test<-read.table(path,na.strings = "NA",header=F, col.names="Subjects")
 path<-"./UCI HAR Dataset/train/subject_train.txt"
 subject_train<-read.table(path,na.strings = "NA",header=F, col.names="Subjects")
 subject_data<<-rbind(subject_test,subject_train)

 ## create a new data frame which converts the activity code into activity Label name it "Activity"
 n1<-nrow(y_data)
 Activity<<-data.frame(Activity=rep(NA,n1))
 for(i in 1:n1)
 { l<-y_data[i,1]
   Activity[i,1]<<-as.character(activity_labels[l,2])}

 # Extract only the measurment on the (mean and standard deviation) from x_test
 
  M_f<<- data.frame(id=grep("mean",tolower(names(x_data))))
  SD_f<<- data.frame(id=grep("std",tolower(names(x_data))))
  All_f<<-rbind(M_f,SD_f)
 
  #combine the three vectors x_data, Activity, subject_data into one data.frame
  All_data<<- cbind(subject_data,Activity,x_data[,All_f[,1]])
  ## create a second dataset with average for each activity and subject
  summary_data<<-ddply(All_data,.(Subjects,Activity),numcolwise(mean,na.rm = TRUE))
  write.table(summary_data,"./projectc/summary_data.txt",row.name=FALSE)
  View(summary_data)
  ## To read data from file View(read.table("./projectc/summary_data.txt",na.strings = "NA",header=T))
##End of Script 
}