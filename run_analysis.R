#***********************************************************************************************************
#******************************** Getting and cleaning data Project ****************************************
#***********************************************************************************************************
# Download files ####

DataDir<-"UCI HAR Dataset"
filename<-"getdata_dataset.zip"

if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename)
}  
if (!file.exists(DataDir)) { 
  unzip(filename) 
}

# Load data ####
features<-read.table("./UCI HAR Dataset/features.txt")
activities<-read.table("./UCI HAR Dataset/activity_labels.txt")
names(activities)<-c("codeAct", "Activity")

X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
names(X_train)<-features[,2]
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
names(y_train)<-c("codeAct")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
names(subject_train)<-"subject"
train<-cbind(y_train,subject_train,X_train)

X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
names(X_test)<-features[,2]
rm(features)
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
names(y_test)<-c("codeAct")
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
names(subject_test)<-"subject"
test<-cbind(y_test,subject_test,X_test)


# 1. Merges data set ####
mergeData<-rbind(train,test)


# 2.Extracts mean and std ####
colsWanted<-grepl(".*subject.*|.*codeAct.*|.*[Mm]ean.*|.*[Ss]td.*",names(mergeData))
mergeData<-mergeData[,colsWanted]


# 3.Descriptive activity names ####
mergeData<-merge(activities,mergeData, by.x = "codeAct", by.y="codeAct")
rm(y_train,X_train,y_test,X_test,activities,colsWanted,subject_test,subject_train)


# 4.Appropriately labels ####
fixesNames<-function(x){
  y<-gsub("-mean\\(\\)-"," Mean ",x)
  gsub("-std\\(\\)-"," Std ",y)
}

newnames<-as.vector(sapply(as.list(names(mergeData)), fixesNames)) 
names(mergeData)<-newnames

# 5.Tidy data ####
tidydata<-aggregate(.~ subject + Activity, data=mergeData, mean)
write.table(tidydata,file = "tidy.csv", sep=",", row.names = F)



