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
if (!file.exists("./sourceData/UCI.HAR.Dataset.zip")){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileurl, destfile="./sourceData/UCI.HAR.Dataset.zip")
}
#Extact the files from the compress archive.


