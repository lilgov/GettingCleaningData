# Summary of Smartlab Human Activity Recognition Dataset

The analysis contained here is to summarize accelerometer and gyroscope data taken
while 30 human subjects engaged in each of six different activities.  The point of
the work by Smartlab was to see how well the various activities could be identified
by extracting features from the raw data.  The purpose of the current analysis was
simply to average mean and standard deviation features from the raw data per
(subject, activity) combination.  Given the 30 human subjects, and the 6 different
activities performed by each subject, there are a total of 30*6 = 180 different
combinations reported in the dataset output by run_analysis().


### Prerequisites

To reproduce the results of the current analysis, you will need the following:
1.  the Smartlab HAR Dataset available from the UCI Machine Learning Repository
2.  the current R analysis script, run_analysis.R

run_analysis() will utilize the following R libraries, which must be installed:
*  dplyr
*  tibble


### Installing

1.  Download the Smartlab HAR dataset from the UCI repository:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
2.  Place the current R script, run_analysis.R, in the same directory as the HAR dataset


## Running the tests

Once the HAR dataset and run_analysis.R are resident in the same directory, simply set the
working directory in your R session to the directory containing the dataset and script,
source the run_analysis script, and issue the command:

> run_analysis()

No dataset is returned to the workspace.  Rather, the results of the analysis are written
to a space-delimited text file, finalTable.txt, in the same directory where the script resides.

To examine the resulting dataset in the R workspace, simply read the results from the text file
as follows:
> sd <- read.table("finalTable.txt", header = TRUE)


## What the code does

The function run_analysis() performs the following operations on the data sets:
1.  Reads text file  activity_labels.txt  containing names and ID #s of each of the 6 activities.
2.  Reads the text file  features.txt  containing descriptive names of each of the accelerometer &/or gyro measurements.  These correspond to the columns/variables of the X data files.
3.  Identifies the indices in the list of features for variables of interest, namely those containing either "mean" or "std" in their names.
4.  Reads the train X data file.
5.  Retains only those columns in X which correspond to features for "mean" and "std".
6.  Places feature names on the retained columns.
7.  Reads the subject ID corresponding to each row of X for the training data.
8.  Reads the assigned activity label for each row of X for the training data.
9.  Completes the training data set by prepending columns for subject ID and activity label onto the table of X training data.
10.  Repeats steps (4-9), but applied to the test data set's X, y, subject ID and activity labels.
11.  "Merge"s the training and test data sets by binding together the rows from the two data sets.
12.  Constructs a nested pair of for-loops, which systematically steps through all combinations of subject IDs and activity labels; at each loop, the function filters the merged data set from step (11) for the current particular (subject ID, activity label) pair, and takes the column means of all features/variables.
13.  Row-by-row, in each pass through the nested for-loop, records a new row in the final output table containing the subject ID, activity label, and means for all of the corresponding "mean" and "std" features in the X data.
14.  Writes a text file, finalTable.txt, containing this newly-constructed summary table of averages of the "mean" and "std" accelerometer and gyro data on a per subject ID and activity label basis.


## Authors

* **Andrew Miller** - [lilgov](https://github.com/lilgov)


## License

none

## Acknowledgments

* Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy
