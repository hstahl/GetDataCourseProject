## Course Project

This is the course project for Getting and Cleaning Data. The project works with data from the UCI Machine Learning Library's [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The project includes the R functions for performing the analysis, this README and a code book explaining the steps of the analysis.

### Data

The metadata is found in the README.txt which is included with the data. The variable names are changed slightly during the analysis from the way they appear in the original data: all paranthesis have been removed and dashes have been replaced with dots.

### Analysis

The analysis performed in the project has five steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The analysis is run by sourcing the `run_analysis.R` file into R or running it with RScript. The file contains two functions, the first of which returns a list containing two elements: a tidy full data set and a tidy data set containing the averages of each variable for each activity and each subject. The `write_analysis()` function will create two csv files in the working directory containing the data sets. Sourcing the file will call the `write_analysis()` function and produce the result in two files names `full.csv` and `summ.csv`. The analysis function calls a helper function `assemble_data_set()` which is located in the `assemble_data_set.R` file.

To run the analysis, you should have the data extracted in a folder named "UCI HAR Dataset".

### Dependencies

* package `dplyr` version `0.4.3`

