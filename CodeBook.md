---
title: "CodeBook"
author: "Jose Luis Garces"
date: "Monday, August 18, 2014"
output: html_document
---

This code book details the steps used to create a tidy data. The run_analysis.R executes the following steps to load and transform the raw data obtained from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> into a Tidy Data set that can be used from further analysis and modelling

1. Download and extract the raw data.
2. Load and Merge the training and the test sets to create one data set.
3. Extract only the measurements on the mean and standard deviation for each measurement.
4. Use descriptive activity names to name the activities in the data set.
5. Appropriately label the data set with descriptive variable names.
6. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r}
summary(cars)
```

You can also embed plots, for example:

```{r, echo=FALSE}
plot(cars)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
