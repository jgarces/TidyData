###############################################################################

# Name: Run Analysis
# Description:  This R script is used to obtain raw data and transform the data into tidy data set

# Versions:
# JLG(18/08/14): Initial Creation

###############################################################################

#Load dependant packages


#Create local directories and download and extract data.
if (!file.exists("sourceData")){
  dir.create("sourceData")
}
if (!file.exists("tidyData")){
  dir.create("tidyData")
}
#Download raw data from source in local source directory
localCacheOfRawDataFile <- "./sourceData/UCI.HAR.Dataset.zip"
if (!file.exists(localCacheOfRawDataFile)){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, localCacheOfRawDataFile)
}
#Read raw test data from downloaded file
xTestConn <- unz(localCacheOfRawDataFile, "UCI HAR Dataset/test/X_test.txt")
test.RawData <- read.table(xTestConn)
yTestConn <- unz(localCacheOfRawDataFile, "UCI HAR Dataset/test/y_test.txt")
test.RawData[,562] <- read.table(yTestConn)
subjectTestConn <- unz(localCacheOfRawDataFile, "UCI HAR Dataset/test/subject_test.txt")
test.RawData[,563] <- read.table(subjectTestConn)
#Read raw training data from downloaded file
xTrainConn <- unz(localCacheOfRawDataFile, "UCI HAR Dataset/train/X_train.txt")
train.RawData <- read.table(xTestConn)
yTrainConn <- unz(localCacheOfRawDataFile, "UCI HAR Dataset/train/y_train.txt")
train.RawData[,562] <- read.table(yTestConn)
subjectTrainConn <- unz(localCacheOfRawDataFile, "UCI HAR Dataset/train/subject_train.txt")
train.RawData[,563] <- read.table(subjectTestConn)
#Step 1:Merge training and testing data
rawData <- rbind(test.RawData, train.RawData) 






