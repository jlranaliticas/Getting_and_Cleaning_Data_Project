---
title: 'README: Course_Project-Getting_and_Cleaning_Data'
author: "JLR"
date: "1/7/2021"
output:
  html_document:
    df_print: paged
  pdf_document: default
---

### OVERVIEW
This document describes background and operating instructions for the _'run_analysis()'_ R function which prepares a tidy dataset of inertial sensing data for further analysis. 

### BACKGROUND
In 2012 the University of California Irvine campus (UCI) conducted an experiment to track movements of individuals performing "daily living activities" while wearing a waist-mounted smartphone with embedded initial sensors.  The data captured from the smartphones was in a "Human Activity Recognition" database. More background on the project and database can be found at the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

###  ABOUT UCI Human Activity Recognition Using Smartphones Data Set
The data to be analyzed will be downloaded from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  The data is stored in a .zip file which includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all 516 features (sensor observations captured).

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set of sensor observations

- 'train/y_train.txt': Training activity indices which are mapped to 'activity_labels.txt'.

- 'test/X_test.txt': Test set of sensor observations

- 'test/y_test.txt': Test activity indices which are mapped to 'activity_labels.txt'.

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

The /train and /test folders provide the data to be analyzed.  Each row in the files provides:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Numeric index to the daily activities (indexed in the 'activity_labels.txt' dataset). 
- A numeric identifier of the subject who carried out the experiment.

### HOW TO RUN _'run_analysis()'_ FUNCTION


1. Download the **experiment datasets** (which are collected into a .zip file) to your R working directory

   a. The data can be located at this link: [UCI Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
        
   b.  Open the .zip file and navigate to the contents of UCI HAR Dataset
   ![Zip_file download](https://user-images.githubusercontent.com/75954319/104103449-28d82200-5270-11eb-96c3-08840d71f4c7.png)
        
   c.  Copy/move the contents to your working directory.
   
2. If necessary, open the _'run_analysis.R'_ file in R Studio and **modify the "setwd()" ** line to point to your working directory

3. From the console, **execute the _'run_analysis.R'_** program as shown below.  

   * During execution a progress log is printed to the console (see below)
   * The function returns a dataframe with cleansed data.  No parameters are required.

       > tidydata <- run_analysis()
       
       [1] "STARTING TIDYDATA PREPARATION @  2021-01-08 16:04:20"
       
       [1] "1. Observation, Activity and Test Subject Files combined"
       
       [1] "2. Column names assigned and formatted to standard"
       
       [1] "3. Column reduced to 'mean' and 'std' only"
       
       [1] "4. Observation ACTIVITIES index number added to observation details"
       
       [1] "5. Activity label names added to observation table for each observation "
       
       [1] "6. Reordered columns in observation tidy table"
       
       [1] "--- Observation table has  10299 rows and 90 columns"
       
       `summarise()` regrouping output by 'subject' (override with `.groups` argument)
       
       [1] "7. tidy dataset created with  180 rows."
       
       [1] "TIDY DATA GENERATION COMPLETE @  2021-01-08 16:04:27"
       
        
4. Execution is complete. The cleaned data is stored in the "tidydata" dataframe.

![tidydata_output](https://user-images.githubusercontent.com/75954319/104103264-21fcdf80-526f-11eb-9ee7-d8be6a0d7ea6.png)
        

### HOW THE PROGRAM WORKS  
The experiment generated observations captured into a datasets that have been randomly partitioned into two sets:

* where 70% of the volunteers was selected for generating the training data(X_train.txt, Y_train.txt)  
* 30% the test data (X_test.txt, Y_test.txt)

The "X_...txt" dataset contains accelerometer and gyroscope measurements.  The "Y_...txt" dataset has numeric codes which identify the type of activity which was being performed at the time of measurements.  These codes will be transformed into descriptive names by the 'run_analysis()' function.

        
The _'run_analysis()'_ function performs the following steps:
        
1.  Read the X_test.txt and Y_train.txt files and **combine these observation datasets** into a single data frame (obstbl).
2.  Read the test and training activity tables and **combine these activity datasets** into a single data frame (acttbl).
3.  Read the subject_test and subject_train.txt files and ** combine these test subject file** s into a single data frame (strain)
4.  Read the feature master list (features.txt) and use it to **set the obstbl column names** to the features names in the feature master list.
5.  Column names 
6.  Modify the obstbl observation dataset to **keep only the feature column names which include "mean" and "std" in the column name**.
7.  For easier use and analysis, add the **activity name**s from the acttbl data frame to the main observation data frame (obstbl).
8.  **Summarize the detailed observation data into a tidy data frame**:  group by subject, activity with an detailed measurements data averaged.
6.  **Return the tidy data frame as output** from the function


        
