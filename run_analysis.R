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
train.RawData <- read.table(xTrainConn)
yTrainConn <- unz(localCacheOfRawDataFile, "UCI HAR Dataset/train/y_train.txt")
train.RawData[,562] <- read.table(yTrainConn)
subjectTrainConn <- unz(localCacheOfRawDataFile, "UCI HAR Dataset/train/subject_train.txt")
train.RawData[,563] <- read.table(subjectTrainConn)
#Step 1: Merge training and testing data
rawData <- rbind(test.RawData, train.RawData) 
#Step 2: Extract the mean and standard deviation of the measures
featuresConn <- unz(localCacheOfRawDataFile, "UCI HAR Dataset/features.txt")
rawData.features <- read.table(featuresConn, stringsAsFactors=FALSE)
featuresOfInterest <- grep("*-mean*\\(|*-std*\\(", rawData.features[,2])
tidyData <- rawData[c(featuresOfInterest,562,563)]
featuresOfInterestNames = rawData.features[featuresOfInterest,]$V2
colnames(tidyData) <- c(featuresOfInterestNames, "Activity", "Subject")
#Step 3: Change Activity to descriptive names
tidyData$ReplacementActivity <- ""
tidyData$ReplacementActivity[tidyData$Activity == 1] <- "WALKING" 
tidyData$ReplacementActivity[tidyData$Activity == 2] <- "WALKING_UPSTAIRS" 
tidyData$ReplacementActivity[tidyData$Activity == 3] <- "WALKING_DOWNSTAIRS" 
tidyData$ReplacementActivity[tidyData$Activity == 4] <- "SITTING" 
tidyData$ReplacementActivity[tidyData$Activity == 5] <- "STANDING" 
tidyData$ReplacementActivity[tidyData$Activity == 6] <- "LAYING" 
tidyData <- tidyData[c(seq(1,66),69,68)]
colnames(tidyData) <- c(featuresOfInterestNames, "Activity", "Subject")                     
tidyData$Activity <- as.factor(tidyData$Activity)
#Step 4: Change variable/column names to descriptive names
colnames(tidyData) <- gsub("^t", "TimeOf", colnames(tidyData))
colnames(tidyData) <- gsub("^f", "FrequencyOf", colnames(tidyData))
colnames(tidyData) <- gsub("-mean\\(\\)", "Mean", colnames(tidyData))
colnames(tidyData) <- gsub("-std\\(\\)", "StandardDeviation", colnames(tidyData))
colnames(tidyData) <- gsub("-X", "InXVector", colnames(tidyData))
colnames(tidyData) <- gsub("-Y", "InYVector", colnames(tidyData))
colnames(tidyData) <- gsub("-Z", "InZVector", colnames(tidyData))
colnames(tidyData) <- gsub("BodyBody", "Body", colnames(tidyData))
#Step 5: Create Average Summary for each Activity for each Subject
tidyDataMeans <- aggregate(tidyData[,1:66], list(Activity = tidyData$Activity, Subject = tidyData$Subject), FUN = mean)
write.table(tidyDataMeans, "tidyData\\tidyData.txt", row.names=FALSE, sep="\t")
