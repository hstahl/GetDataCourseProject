## Assembles the complete tidy data set from the distributed txt files.
## Returns the data as a single data frame.
assemble_data_set <- function(set) {
    folder <- "UCI HAR Dataset/"
    activity_labels <- read.table(paste(folder,"activity_labels.txt",sep=""),
                                  sep = " ",
                                  col.names = c("id", "activity"))
    features <- read.table(paste(folder,"features.txt",sep=""),
                           sep = " ",
                           col.names = c("id", "feature"))
    selected_features <- grep("-(mean|std)\\(\\)",features$feature)
    selected_cols <- rep("NULL",length(features$feature))
    selected_cols[selected_features] <- "numeric"
    col_names <- features$feature
    col_names <- gsub("\\(\\)", "", col_names)
    data_set <- read.table(paste(folder,set,"/X_",set,".txt",sep=""),
                           col.names = col_names,
                           colClasses = selected_cols)
    activity <- read.table(paste(folder,set,"/y_",set,".txt",sep=""),
                           col.names = "id",
                           colClasses = "integer")
    activity <- left_join(activity,activity_labels,by="id")
    subject <- read.table(paste(folder,set,"/subject_",set,".txt",sep=""),
                          col.names = "subject",
                          colClasses = "integer")
    cbind(activity=activity[,"activity"],subject,data_set)
}