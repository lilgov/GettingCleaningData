Codebook
========
    Codebook generated on 2017-01-28.
    Script run_analysis() generates a text file, finalTable.txt, as output
    containing dataset summarizing the mean & std features reported by the Smartlab.
    
    Reading the text file in reveals the resulting dataset:
    > sd <- read.table("finalTable.txt", header = TRUE)
    
    

Variable list and descriptions
------------------------------

First 2 variables in sd (from finalTable.txt) are:
*  subjectid:  Integer ID of person who performed each activity (1:30).
*  activity:  One of six classes of acitivity (or movement) for which accelerometer data is taken.

> names(sd[1:2])
[1] "subjectid" "activity" 


The remaining variables are mean & std components of accelerometer or gyroscope data.
Smartlab reports (in their readme file) that units of acceleration are standard gravity,
and are normalized to [-1, 1].
Data preprocessed by Smartlab are contained in:
*  test/X_test.txt
*  test/y_test.txt
*  train/X_train.txt
*  train/y_train.txt

That preprocessed data is ingested by the current script, run_analysis(), which:
1.  isolates only those Smartlab features containing the strings "mean" and "std"
2.  averages those mean & std features for each combination of subjectid and activity

Those features summarized by run_analysis() are:

> names(sd)[-(1:2)]
 [1] "tBodyAcc.mean...X"               "tBodyAcc.mean...Y"              
 [3] "tBodyAcc.mean...Z"               "tBodyAcc.std...X"               
 [5] "tBodyAcc.std...Y"                "tBodyAcc.std...Z"               
 [7] "tGravityAcc.mean...X"            "tGravityAcc.mean...Y"           
 [9] "tGravityAcc.mean...Z"            "tGravityAcc.std...X"            
[11] "tGravityAcc.std...Y"             "tGravityAcc.std...Z"            
[13] "tBodyAccJerk.mean...X"           "tBodyAccJerk.mean...Y"          
[15] "tBodyAccJerk.mean...Z"           "tBodyAccJerk.std...X"           
[17] "tBodyAccJerk.std...Y"            "tBodyAccJerk.std...Z"           
[19] "tBodyGyro.mean...X"              "tBodyGyro.mean...Y"             
[21] "tBodyGyro.mean...Z"              "tBodyGyro.std...X"              
[23] "tBodyGyro.std...Y"               "tBodyGyro.std...Z"              
[25] "tBodyGyroJerk.mean...X"          "tBodyGyroJerk.mean...Y"         
[27] "tBodyGyroJerk.mean...Z"          "tBodyGyroJerk.std...X"          
[29] "tBodyGyroJerk.std...Y"           "tBodyGyroJerk.std...Z"          
[31] "tBodyAccMag.mean.."              "tBodyAccMag.std.."              
[33] "tGravityAccMag.mean.."           "tGravityAccMag.std.."           
[35] "tBodyAccJerkMag.mean.."          "tBodyAccJerkMag.std.."          
[37] "tBodyGyroMag.mean.."             "tBodyGyroMag.std.."             
[39] "tBodyGyroJerkMag.mean.."         "tBodyGyroJerkMag.std.."         
[41] "fBodyAcc.mean...X"               "fBodyAcc.mean...Y"              
[43] "fBodyAcc.mean...Z"               "fBodyAcc.std...X"               
[45] "fBodyAcc.std...Y"                "fBodyAcc.std...Z"               
[47] "fBodyAcc.meanFreq...X"           "fBodyAcc.meanFreq...Y"          
[49] "fBodyAcc.meanFreq...Z"           "fBodyAccJerk.mean...X"          
[51] "fBodyAccJerk.mean...Y"           "fBodyAccJerk.mean...Z"          
[53] "fBodyAccJerk.std...X"            "fBodyAccJerk.std...Y"           
[55] "fBodyAccJerk.std...Z"            "fBodyAccJerk.meanFreq...X"      
[57] "fBodyAccJerk.meanFreq...Y"       "fBodyAccJerk.meanFreq...Z"      
[59] "fBodyGyro.mean...X"              "fBodyGyro.mean...Y"             
[61] "fBodyGyro.mean...Z"              "fBodyGyro.std...X"              
[63] "fBodyGyro.std...Y"               "fBodyGyro.std...Z"              
[65] "fBodyGyro.meanFreq...X"          "fBodyGyro.meanFreq...Y"         
[67] "fBodyGyro.meanFreq...Z"          "fBodyAccMag.mean.."             
[69] "fBodyAccMag.std.."               "fBodyAccMag.meanFreq.."         
[71] "fBodyBodyAccJerkMag.mean.."      "fBodyBodyAccJerkMag.std.."      
[73] "fBodyBodyAccJerkMag.meanFreq.."  "fBodyBodyGyroMag.mean.."        
[75] "fBodyBodyGyroMag.std.."          "fBodyBodyGyroMag.meanFreq.."    
[77] "fBodyBodyGyroJerkMag.mean.."     "fBodyBodyGyroJerkMag.std.."     
[79] "fBodyBodyGyroJerkMag.meanFreq.."


Dataset structure
-----------------
    
    
    ```r
str(sd)
```

```
## 'data.frame':	180 obs. of  81 variables:
##  $ subjectid                      : int  1 1 1 1 1 1 2 2 2 2 ...
##  $ activity                       : Factor w/ 6 levels "LAYING","SITTING",..: 4 6 5 2 3 1 4 6 5 2 ...
##  $ tBodyAcc.mean...X              : num  0.277 0.255 0.289 0.261 0.279 ...
##  $ tBodyAcc.mean...Y              : num  -0.01738 -0.02395 -0.00992 -0.00131 -0.01614 ...
##  $ tBodyAcc.mean...Z              : num  -0.1111 -0.0973 -0.1076 -0.1045 -0.1106 ...
##  $ tBodyAcc.std...X               : num  -0.284 -0.355 0.03 -0.977 -0.996 ...
##  $ tBodyAcc.std...Y               : num  0.11446 -0.00232 -0.03194 -0.92262 -0.97319 ...
##  $ tBodyAcc.std...Z               : num  -0.26 -0.0195 -0.2304 -0.9396 -0.9798 ...
```


Activities performed by the subjects
----------------------------------------
    
> unique(sd$activity)
[1] WALKING            WALKING_UPSTAIRS   WALKING_DOWNSTAIRS SITTING            STANDING          
[6] LAYING            
Levels: LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS



A few sample rows of the dataset
------------------------------
    
    
    ```r
sd
```

```
##    subjectid           activity tBodyAcc.mean...X tBodyAcc.mean...Y tBodyAcc.mean...Z tBodyAcc.std...X
##  1         1            WALKING         0.2773308      -0.017383819        -0.1111481      -0.28374026
##  2         1   WALKING_UPSTAIRS         0.2554617      -0.023953149        -0.0973020      -0.35470803
##  3         1 WALKING_DOWNSTAIRS         0.2891883      -0.009918505        -0.1075662       0.03003534
##  4         1            SITTING         0.2612376      -0.001308288        -0.1045442      -0.97722901
##  5         1           STANDING         0.2789176      -0.016137590        -0.1106018      -0.99575990
##  6         1             LAYING         0.2215982      -0.040513953        -0.1132036      -0.92805647
##    tBodyAcc.std...Y tBodyAcc.std...Z tGravityAcc.mean...X tGravityAcc.mean...Y tGravityAcc.mean...Z
##  1      0.114461337      -0.26002790            0.9352232           -0.2821650          -0.06810286
##  2     -0.002320265      -0.01947924            0.8933511           -0.3621534          -0.07540294
##  3     -0.031935943      -0.23043421            0.9318744           -0.2666103          -0.06211996
##  4     -0.922618642      -0.93958629            0.8315099            0.2044116           0.33204370
##  5     -0.973190056      -0.97977588            0.9429520           -0.2729838           0.01349058
##  6     -0.836827406      -0.82606140           -0.2488818            0.7055498           0.44581772
```


Save to file
------------
    
    Save data table objects to text file `finalTable.txt`.
    Output directory for finalTable.txt is same directory that contains run_analysis.R.


```r
write.table(finalTable, file = "finalTable.txt", row.names = FALSE)
```
