## Code Book

This code book explains the steps taken in the analysis to produce the final results. The analysis has two primary steps: gathering the data set and creating an aggregate data set.

### Gathering the data set

The code doesn't perform the analysis steps in order specified in the README but the end results achieves all of them. The steps taken by the `run_analysis()` function are:

1. Read in the training data set,
2. Read in the test data set,
3. Combine the data sets,
4. Create the aggregate data set,
5. Return a list of both data sets.

The data are read in with the `assemble_data_set()` function in the `assemble_data_set.R` file. The function takes the string "test" or "train" as an argument and performs the following steps:

1. Reads the `UCI HAR Dataset/activity_labels.txt` file for activity names paired with an id,
2. Reads the `UCI HAR Dataset/features.txt` for the variable names of the data sets,
3. Selects only the mean and standard deviation colum numbers from the features,
4. Reads the appropriate columns of the data set from the `train/X_train.txt` or `test/X_test.txt` file using modified column names as explained in the README,
5. Reads the activity variable from either `train/y_train.txt` or `test/y_test.txt`,
6. Joins the activity variable with the activity labels to produce a new activity variable with factor values instead of numbers,
7. Reads the subject variable from either `train/subject_train.txt` or `test/subject_test.txt`,
8. Binds the columns of the activity and subject variables with the data set to produce the final test or train data set,
9. Returns the resulting data frame.

### Aggregate data set

Once the full data set has been gathered, the aggregate set is created with the help of dplyr functions. The means of all variables are computed, grouping by the subject and activity type. The result is a data frame with the same number of columns as the full data set.

## Resulting Data

The resulting full data set is the combination of the training and test data sets in which the subject and activity have been added to the table. The first and second columns of the resulting data arethe activity label (from `UCI HAR Dataset/activity_labels.txt`) and the subject number. The columns selected into the full data set are all the measurements of the mean and standard deviation (ones with `mean()` or `std()` in the name).  The values of the selected columns are the same as in the original data sets (`UCI HAR Dataset/train/X_train.txt` and `UCI HAR Dataset/test/X_test.txt`). The columns have been named according to the features (in `UCI HAR Dataset/features.txt`) with the following two changes:

1. paranthesis have been removed,
2. dashes have been replaced with dots.

The aggregate data set has the same columns as the full data set but the rows have been collapsed to form a mean value for each subject and each activity.

