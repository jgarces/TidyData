---
title: "CodeBook"
author: "Jose Luis Garces"
date: "Monday, August 18, 2014"
output: html_document
---

## Codebook Summary

This code book details the steps used to create a tidy data set. The run_analysis.R executes the following steps to load and transform the raw data obtained from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> into a Tidy Data set (found in tidyData.txt) that can be used from further analysis and modelling

## Original Dataset

The data have been summarized from the following dataset:

<pre>
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit? degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
</pre>

Further information can be found at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data can be downloaded at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## Raw Data

The zip archive contains the following data files for which the script extracts data from:

* test/X_test.txt
* test/subject_test.txt
* test/y_test.txt
* train/X_train.txt
* train/subject_train.txt
* train/y_train.txt
* activity_labels.txt
* features.txt


## Description

A group of 30 volunteers within an age bracket of 19-48 years performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist.  The activities performed were:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

Using the embedded accelerometer and gyroscope, the project captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


## Processing

Preparation: 
1. Download and cach the zip archive.
2. Extract the raw data from zip archive.

Execution:
1. Load and Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set.
4. Appropriately label the data set with descriptive variable names.
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.


## List of Variables

List of variables in resulting tidy data set. Note Activity is a factor of the six activities and Subject is a integer respresenting the volunteer. The subsequent values are averages of the described measure for each Activity and for each Subject.

<pre>
Activity                                        
Subject                                         
TimeOfBodyAccMeanInXVector                      
TimeOfBodyAccMeanInYVector                      
TimeOfBodyAccMeanInZVector                      
TimeOfBodyAccStandardDeviationInXVector         
TimeOfBodyAccStandardDeviationInYVector         
TimeOfBodyAccStandardDeviationInZVector         
TimeOfGravityAccMeanInXVector                   
TimeOfGravityAccMeanInYVector                   
TimeOfGravityAccMeanInZVector                   
TimeOfGravityAccStandardDeviationInXVector      
TimeOfGravityAccStandardDeviationInYVector      
TimeOfGravityAccStandardDeviationInZVector      
TimeOfBodyAccJerkMeanInXVector                  
TimeOfBodyAccJerkMeanInYVector                  
TimeOfBodyAccJerkMeanInZVector                  
TimeOfBodyAccJerkStandardDeviationInXVector     
TimeOfBodyAccJerkStandardDeviationInYVector     
TimeOfBodyAccJerkStandardDeviationInZVector     
TimeOfBodyGyroMeanInXVector                     
TimeOfBodyGyroMeanInYVector                     
TimeOfBodyGyroMeanInZVector                     
TimeOfBodyGyroStandardDeviationInXVector        
TimeOfBodyGyroStandardDeviationInYVector        
TimeOfBodyGyroStandardDeviationInZVector        
TimeOfBodyGyroJerkMeanInXVector                 
TimeOfBodyGyroJerkMeanInYVector                 
TimeOfBodyGyroJerkMeanInZVector                 
TimeOfBodyGyroJerkStandardDeviationInXVector    
TimeOfBodyGyroJerkStandardDeviationInYVector    
TimeOfBodyGyroJerkStandardDeviationInZVector    
TimeOfBodyAccMagMean                            
TimeOfBodyAccMagStandardDeviation               
TimeOfGravityAccMagMean                         
TimeOfGravityAccMagStandardDeviation            
TimeOfBodyAccJerkMagMean                        
TimeOfBodyAccJerkMagStandardDeviation           
TimeOfBodyGyroMagMean                           
TimeOfBodyGyroMagStandardDeviation              
TimeOfBodyGyroJerkMagMean                       
TimeOfBodyGyroJerkMagStandardDeviation          
FrequencyOfBodyAccMeanInXVector                 
FrequencyOfBodyAccMeanInYVector                 
FrequencyOfBodyAccMeanInZVector                 
FrequencyOfBodyAccStandardDeviationInXVector    
FrequencyOfBodyAccStandardDeviationInYVector    
FrequencyOfBodyAccStandardDeviationInZVector    
FrequencyOfBodyAccJerkMeanInXVector             
FrequencyOfBodyAccJerkMeanInYVector             
FrequencyOfBodyAccJerkMeanInZVector             
FrequencyOfBodyAccJerkStandardDeviationInXVector
FrequencyOfBodyAccJerkStandardDeviationInYVector
FrequencyOfBodyAccJerkStandardDeviationInZVector
FrequencyOfBodyGyroMeanInXVector                
FrequencyOfBodyGyroMeanInYVector                
FrequencyOfBodyGyroMeanInZVector                
FrequencyOfBodyGyroStandardDeviationInXVector   
FrequencyOfBodyGyroStandardDeviationInYVector   
FrequencyOfBodyGyroStandardDeviationInZVector   
FrequencyOfBodyAccMagMean                       
FrequencyOfBodyAccMagStandardDeviation          
FrequencyOfBodyAccJerkMagMean                   
FrequencyOfBodyAccJerkMagStandardDeviation      
FrequencyOfBodyGyroMagMean                      
FrequencyOfBodyGyroMagStandardDeviation         
FrequencyOfBodyGyroJerkMagMean                  
FrequencyOfBodyGyroJerkMagStandardDeviation  
</pre>

