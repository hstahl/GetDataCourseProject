#!/usr/bin/RScript
source("assemble_data_set.R")
library(dplyr)

## Performs the analysis described in the README.
## Returns a list containing the combined full
## data set and the aggregate data set the means
## of each variable for each subject and activity.
run_analysis <- function() {
    training_set <- assemble_data_set("train")
    testing_set <- assemble_data_set("test")
    full_set <- rbind(training_set, testing_set)
    agg_set <- full_set %>%
        group_by(subject,activity) %>%
        summarize_each(funs(mean))
    list(full=full_set,summary=agg_set)
}

## Writes the analyses to two files.
## Calling write_analyses(run_analysis()) is a
## fast way to get the processed data sets.
write_analyses <- function(analyses, destfiles = c("full.csv","summ.csv")) {
    write.csv(analyses$full, file = destfiles[1], row.names = FALSE)
    write.csv(analyses$summary, file = destfiles[2], row.names = FALSE)
}

write_analyses(run_analysis())