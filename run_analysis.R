#' Summarizes the mean and std entries from the UCI HAR smartphone acceleration dataset.
#'
#' \code{run_analysis} writes a summary table of the accelerometer and gyroscope data
#' to an output text file (finalTable.txt).
#'
#' This function is not generic.  It is suited to analyzing one particular dataset,
#' namely a collection of accelerometer and gyroscope data compiled by the
#' Smartlab - Non Linear Complex Systems Laboratory, retrieved from the
#' UCI Machine Learning Repository.
#' http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#' Test and training data (predictors, X, and classified responses, Y) are
#' located in the "test" and "train" subdirectories, in text files "X_test.txt"
#' and "X_train.txt", as well as "y_test.txt" and "y_train.txt".
#' The X data is accelerometer and gyroscope data collected from a Samsung Galaxy S II
#' smartphone while  30 individuals (subjects) engaged in 6 different activities.
#' The Y data is the activity class being performed by the subject as the accelerometer
#' and gyroscope data was being recorded.
#' A list of the activities and associated integer ID #s is kept in the text file
#' activity_labels.txt.
#' A list of the many accelerometer and gyroscope measurements (the columns of the X datasets)
#' is recorded in the text file features.txt.
#' A list of the subjects who performed the various activities corresponding to rows
#' in the X and y datasets is recorded in the text files
#' subject_test.txt and subject_train.txt.
#' The function run_analysis() does not use any of the "raw" accelerometer or gyro data
#' (in their own subdirectories "Inertial Signals"), but rather data that has already
#' been pre-processed by the Smartlab.
#' The function run_analysis() performs the following operations on the data sets:
#' 1)  Reads text file  activity_labels.txt  containing names and ID #s of each
#' of the 6 activities.
#' 2)  Reads the text file  features.txt  containing descriptive names of each of the
#' accelerometer &/or gyro measurements.  These correspond to the
#' columns/variables of the X data files.
#' 3)  Identifies the indices in the list of features for variables of interest, namely
#' those containing either "mean" or "std" in their names.
#' 4)  Reads the train X data file.
#' 5)  Retains only those columns in X which correspond to features for "mean" and "std".
#' 6)  Places feature names on the retained columns.
#' 7)  Reads the subject ID corresponding to each row of X for the training data.
#' 8)  Reads the assigned activity label for each row of X for the training data.
#' 9)  Completes the training data set by prepending columns for subject ID and activity label
#' onto the table of X training data.
#' 10)  Repeats steps (4-9), but applied to the test data set's X, y, subject ID and
#' activity labels.
#' 11)  "Merge"s the training and test data sets by binding together the rows from the
#' two data sets.
#' 12)  In a nested pair of for-loops, systematically steps through all combinations of
#' subject IDs and activity labels;  at each loop, the function filters the merged data set
#' from step (11) for the current particular pair (subject ID, activity label), and takes
#' the column means of all features/variables.
#' 13)  Row-by-row, in each pass through the nested for-loop, records a new row in the final
#' output table containing the subject ID, activity label, and means for all of the
#' corresponding "mean" and "std" features in the X data.
#' 14)  Writes a text file, finalTable.txt, containing this newly-constructed summary table
#' of averages of the "mean" and "std" accelerometer and gyro data on a per subject ID and
#' activity label basis.
#' 
#'
#' @param  none.
#' @return  No return value;  but an output text file finalTable.txt.
run_analysis <- function() {
    library(dplyr)
    library(tibble)
    
    ## Read activity labels and recorded features from their respective text files
    activitylabels <- read.table("activity_labels.txt", header = FALSE)
    activitylabels <- activitylabels$V2
    
    features <- tbl_df( read.table("features.txt", header = FALSE))
    indices.mean <- grep("-mean", features$V2, value = FALSE)
    indices.std <- grep("-std", features$V2, value = FALSE)
    indices.desired <- sort( union(indices.mean, indices.std) )
    rm(indices.mean, indices.std)
    
    
    
    ## Read the extracted feature data for the training set from text file
    train.x <- tbl_df( read.table("train/X_train.txt", header = FALSE) )
    ## Subset the columns/variables from the training features to include only those marked mean or std
    train.x <- train.x[, indices.desired]
    ## Label the columns of the training data with the appropriate feature names
    names(train.x) <- features$V2[indices.desired]
    
    ## Read the subject IDs for the people who performed each of the observations in the training set
    train.subject <- tbl_df( read.table("train/subject_train.txt", header = FALSE) )
    train.subject <- select( train.subject, subjectid = V1 )
    
    ## Read the activity classifications associated with each observation in the training data
    train.y <- tbl_df( read.table("train/y_train.txt", header = FALSE) )
    train.y <- select(train.y, activityid = V1)
    
    ## Add columns at the beginning for activity label and subject ID to the training data table
    train.complete <- add_column(train.x, activity = activitylabels[train.y$activityid], .before = 1)
    train.complete <- add_column(train.complete, subjectid = train.subject$subjectid, .before = 1)
    
    
    
    
    ## Read the extracted feature data for the test set from text file
    test.x <- tbl_df( read.table("test/X_test.txt", header = FALSE) )
    ## Subset the columns/variables from the test features to include only those marked mean or std
    test.x <- test.x[, indices.desired]
    ## Label the columns of the test data with the appropriate feature names
    names(test.x) <- features$V2[indices.desired]
    
    
    ## Read the subject IDs for the people who performed each of the observations in the test set
    test.subject <- tbl_df( read.table("test/subject_test.txt", header = FALSE) )
    test.subject <- select( test.subject, subjectid = V1 )
    
    ## Read the activity classifications associated with each observation in the test data
    test.y <- tbl_df( read.table("test/y_test.txt", header = FALSE) )
    test.y <- select(test.y, activityid = V1)
    
    ## Add columns at the beginning for activity label and subject ID to the test data table
    test.complete <- add_column(test.x, activity = activitylabels[test.y$activityid], .before = 1)
    test.complete <- add_column(test.complete, subjectid = test.subject$subjectid, .before = 1)
    
    rm(test.subject, test.x, test.y)
    rm(train.subject, train.x, train.y)
    
    ## "Merge" the training and test data sets by binding the rows of the two tables together
    md <- bind_rows(train.complete, test.complete)
    
    
    
    ##  Use first row of merged data set, md, as a template for each new row in the summary table
    summaryRow <- md[1, ]
    finalTable <- summaryRow[-1, ]
    
    indices.SubjectIDs <- sort( unique(md$subjectid) )
    indices.ActivityLabels <- seq_along(activitylabels)
    
    for (i in indices.SubjectIDs) {
        for (j in indices.ActivityLabels) {
            temp <- filter(md, subjectid == i, activity == activitylabels[j])
            summaryRow[1, 1:2] <- temp[1, 1:2]
            summaryRow[, -2:-1] <- colMeans( temp[, c(-1, -2)] )
            
            finalTable <- bind_rows(finalTable, summaryRow)
        }
    }
    
    ## Output the resulting final table to a text file in the working directory
    write.table(finalTable, file = "finalTable.txt", row.names = FALSE)
    
}

