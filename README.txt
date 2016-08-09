==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 2.0
==================================================================
The given data from version 1.0 was processed to extract useful measures.
data from train and test folders (x_test,y_test,subject_test, x_train,y_train,subject_train) were combined to produce the new data.
the subject_data contains the (subject_test,subject_train)
the y_test and y_train contains the activity codes they were combined in y_data and the codes were replaced by the names of the activities from the Activity_labels file.
the x_data combined (x_test, x_train) then a headed from the 561 features were add from the features file.
then it was processed to select only features with the word (mean or std) which narrowed the feateres to 86.
combining the subject with activity and x_data a new data set was produced
the new data was summarized to group by subject and activity and average all other features.
it yields 180 obs. of 88 variables


The dataset includes the following files:
=========================================

- 'README.txt'

- "myscript.r" : R script to produced new data

-"DATA DICTIONARY.pdf" : explains the new features produced by the script

- "summary_data.txt" : the new data