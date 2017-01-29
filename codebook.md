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

> str(sd)

'data.frame':	180 obs. of  81 variables:
 $ subjectid                      : int  1 1 1 1 1 1 2 2 2 2 ...
 $ activity                       : Factor w/ 6 levels "LAYING","SITTING",..: 4 6 5 2 3 1 4 6 5 2 ...
 $ tBodyAcc.mean...X              : num  0.277 0.255 0.289 0.261 0.279 ...
 $ tBodyAcc.mean...Y              : num  -0.01738 -0.02395 -0.00992 -0.00131 -0.01614 ...
 $ tBodyAcc.mean...Z              : num  -0.1111 -0.0973 -0.1076 -0.1045 -0.1106 ...
 $ tBodyAcc.std...X               : num  -0.284 -0.355 0.03 -0.977 -0.996 ...
 $ tBodyAcc.std...Y               : num  0.11446 -0.00232 -0.03194 -0.92262 -0.97319 ...
 $ tBodyAcc.std...Z               : num  -0.26 -0.0195 -0.2304 -0.9396 -0.9798 ...
 $ tGravityAcc.mean...X           : num  0.935 0.893 0.932 0.832 0.943 ...
 $ tGravityAcc.mean...Y           : num  -0.282 -0.362 -0.267 0.204 -0.273 ...
 $ tGravityAcc.mean...Z           : num  -0.0681 -0.0754 -0.0621 0.332 0.0135 ...
 $ tGravityAcc.std...X            : num  -0.977 -0.956 -0.951 -0.968 -0.994 ...
 $ tGravityAcc.std...Y            : num  -0.971 -0.953 -0.937 -0.936 -0.981 ...
 $ tGravityAcc.std...Z            : num  -0.948 -0.912 -0.896 -0.949 -0.976 ...
>


Activities performed by the subjects
----------------------------------------
    
> unique(sd$activity)
[1] WALKING            WALKING_UPSTAIRS   WALKING_DOWNSTAIRS SITTING            STANDING          
[6] LAYING            
Levels: LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS



A few sample rows of the dataset
------------------------------
    
> sd

    subjectid           activity tBodyAcc.mean...X tBodyAcc.mean...Y tBodyAcc.mean...Z tBodyAcc.std...X
1           1            WALKING         0.2773308      -0.017383819       -0.11114810     -0.283740259
2           1   WALKING_UPSTAIRS         0.2554617      -0.023953149       -0.09730200     -0.354708025
3           1 WALKING_DOWNSTAIRS         0.2891883      -0.009918505       -0.10756619      0.030035338
4           1            SITTING         0.2612376      -0.001308288       -0.10454418     -0.977229008
5           1           STANDING         0.2789176      -0.016137590       -0.11060182     -0.995759902
6           1             LAYING         0.2215982      -0.040513953       -0.11320355     -0.928056469
7           2            WALKING         0.2764266      -0.018594920       -0.10550036     -0.423642838
8           2   WALKING_UPSTAIRS         0.2471648      -0.021412113       -0.15251390     -0.304376406
9           2 WALKING_DOWNSTAIRS         0.2776153      -0.022661416       -0.11681294      0.046366681
10          2            SITTING         0.2770874      -0.015687994       -0.10921827     -0.986822280
11          2           STANDING         0.2779115      -0.018420827       -0.10590854     -0.987271889
12          2             LAYING         0.2813734      -0.018158740       -0.10724561     -0.974059465
    tBodyAcc.std...Y tBodyAcc.std...Z tGravityAcc.mean...X tGravityAcc.mean...Y tGravityAcc.mean...Z
1        0.114461337      -0.26002790            0.9352232         -0.282165021         -0.068102864
2       -0.002320265      -0.01947924            0.8933511         -0.362153364         -0.075402940
3       -0.031935943      -0.23043421            0.9318744         -0.266610339         -0.062119959
4       -0.922618642      -0.93958629            0.8315099          0.204411593          0.332043703
5       -0.973190056      -0.97977588            0.9429520         -0.272983832          0.013490582
6       -0.836827406      -0.82606140           -0.2488818          0.705549773          0.445817720
7       -0.078091253      -0.42525752            0.9130173         -0.346607090          0.084727087
8        0.108027280      -0.11212102            0.7907174         -0.416214890         -0.195888239
9        0.262881789      -0.10283791            0.8618313         -0.325780101         -0.043889016
10      -0.950704499      -0.95982817            0.9404773         -0.105630024          0.198726769
11      -0.957304989      -0.94974185            0.8969286         -0.370062697          0.129747161
12      -0.980277399      -0.98423330           -0.5097542          0.752536639          0.646834880
>


Save to file
------------
    
    Save data table objects to text file `finalTable.txt`.
    Output directory for finalTable.txt is same directory that contains run_analysis.R.


```r
write.table(finalTable, file = "finalTable.txt", row.names = FALSE)
```
