###############################################################################

# Name: Run Analysis
# Description:  This R script is used to obtain raw data and transform the data into tidy data set

# Versions:
# JLG(18/08/14): Initial Creation

###############################################################################

#Load dependant packages


#Step 1: Create local directories and download and extract data.
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
#Read raw data from downloaded file
subjectTestConn <- unz(localCacheOfRawDataFile, "UCI HAR Dataset/test/subject_test.txt")
open(subjectTestConn)
readLines(subjectTestConn, n=10)
close(subjectTestConn)

yTestConn <- unz(localCacheOfRawDataFile, "UCI HAR Dataset/test/y_test.txt")
open(yTestConn)
readLines(yTestConn, n=10)
close(yTestConn)

xTestConn <- unz(localCacheOfRawDataFile, "UCI HAR Dataset/test/X_test.txt")
open(xTestConn)
readLines(xTestConn, n=10)
close(xTestConn)
