## FUNCTION: run_analysis()
## PURPOSE : Prepares a tidy dataset of inertial sensing data for further analysis.
##           Only variables identified as "mean" and "std" variables are selected.
##           The observation dataset is standardized
##           Input:   training and the test sets, along with meta-data datasets
##           Output:  tidy data set with the average of each variable for each activity and each subject. 
##

library(plyr)
library(dplyr)
library(tibble)

setwd("~/")

## IMPORTANT:  CHANGE THE WORKING DIRECTORY TO LOCATION OF DOWNLOADED DATA
setwd("./TRAINING/DataScienceSpecialization/3. Clean Data/Course Project/Raw Data")


run_analysis <- function() {

##
        starttime <- Sys.time()
        print(paste("STARTING TIDYDATA PREPARATION @ ", starttime))

## COMBINE TEST AND TRAINING OBSERVATION TABLES INTO A SINGLE DATAFRAME (obstbl)
        xtest <- read.table("./test/X_test.txt")
        xtrain <- read.table("./train/X_train.txt")
        obstbl <- rbind(xtest,xtrain)
## COMBINE TEST AND TRAINING ACTIVITY TABLES INTO A SINGLE DATAFRAME (acttbl)
        atest <- read.table("./test/Y_test.txt")
        atrain <- read.table("./train/Y_train.txt")
        acttbl <- rbind(atest,atrain)
## COMBINE TEST SUBJECT TABLES INTO A SINGLE DATAFRAM(subjtbl)
        stest <- read.table("./test/subject_test.txt")
        strain <- read.table("./train/subject_train.txt")
        subjtbl <- rbind(stest,strain)

        print("1. Observation, Activity and Test Subject Files combined")        
        
## SET OBSERVATION (obstbl) COLUMN NAMES TO THE FEATURE NAMES FROM FEATURE LIST (fl)

        fl <- read.table("./features.txt")                                    
        for(i in 1:nrow(fl)) { 
                colnames(obstbl)[i] <- fl[i,"V2"] }          ## Update column names from the features.txt file

        
        colnames(obstbl) <- tolower(names(obstbl))           ## Format column names to lowercase
        colnames(obstbl) <- sub("\\()","", names(obstbl),)   ## Remove "()" from column names
        colnames(obstbl) <- gsub("\\-","", names(obstbl),)   ## Remove "-" from column names
        
        print("2. Column names assigned and formatted to standard")
        

## KEEP ONLY THE OBSERVATION TABLE COLUMNS WHICH INCLUDE "mean" and "std" in the COLUMN NAME

        keepcol <- grep("mean|std", colnames(obstbl))        ## Identify columns with "mean" and "std" to be kept
        obstbl <- select(obstbl,keepcol)                     ## Remove all columns except for those with "mean" and "std" in column name
        
        print("3. Column reduced to 'mean' and 'std' only")
        
## ADD TEST SUBJECT IDENTIFIERS
        obstbl <- obstbl %>% mutate(subject=subjtbl$V1)

## ADD ACTIVITIES (acttbl) TO OBSERVATIONS DATA FRAME(obstbl)      
        obstbl <- obstbl %>% mutate(obsnum=seq.int(1:nrow(obstbl)))      ## Add sequence number to beginning of observations to match to name
        obstbl <- add_column(obstbl, actnum=NA, .after = "obsnum")
        obstbl$actnum <- acttbl$V1                                     ## Add activity number from observation to detailed observation table
        
        print("4. Observation ACTIVITIES index number added to observation details")

        actlabels <- read.table("./activity_labels.txt")
        colnames(actlabels) <- c("actnum", "activity")                    ## SET 
        
        obstbl$activity <- actlabels[findInterval(x=obstbl$actnum, vec=actlabels$actnum),2]   ## LOOKUP ACTIVITY NAME & UPDATE OBSERVATIONS TABLE
        
        print("5. Activity label names added to observation table for each observation ")
        
        obstbl <- select(obstbl, obsnum, subject, activity, everything())        ## MOVE ORDER TO PUT "Activity" IN FRONT
        
        print("6. Reordered columns in observation tidy table")
        print(paste("--- Observation table has ", nrow(obstbl), "rows and", ncol(obstbl), "columns"))
        
        tidydata <- select(obstbl, -obsnum)
        tidydata <- tidydata %>% group_by(subject, activity) %>% summarize(across(everything(),mean))
        print(paste("7. tidy dataset created with ", nrow(tidydata), "rows."))

        endtime <- Sys.time()
        print(paste("TIDY DATA GENERATION COMPLETE @ ", endtime))

        return(tidydata)

}



