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
bodyAccXTestConn <- unz(localCacheOfRawDataFile, "UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
open(bodyAccXTestConn)
readLines(bodyAccXTestConn, n=1)
close(bodyAccXTestConn)
