# Step 0. Load necessary libraries
library(data.table) # it helps to load fast large text files
library(dplyr)

# Step 1 and Step 4. Merge the training and the test sets to create one data set
# and appropriately label the data set with descriptive variable names

# Load original data
activityLabels <- tbl_df(read.table("data/activity_labels.txt", header = FALSE, sep = " "))
names(activityLabels) <- c("actCode","actName")

variableLabels <- tbl_df(read.table("data/features.txt", stringsAsFactors=FALSE, header = FALSE, sep = " "))
names(variableLabels) <- c("varCode","varName")

trainSet <- tbl_df(fread("data/train/X_train.txt"))
trainLabels <- tbl_df(read.table("data/train/y_train.txt", header = FALSE, sep = " "))
names(trainLabels) <- "actCode"
trainSubject <- tbl_df(read.table("data/train/subject_train.txt", header = FALSE, sep = " "))
names(trainSubject) <- "subjectCode"

testSet <- tbl_df(fread("data/test/X_test.txt"))
testLabels <- tbl_df(read.table("data/test/y_test.txt", header = FALSE, sep = " "))
names(testLabels) <- "actCode"
testSubject <- tbl_df(read.table("data/test/subject_test.txt", header = FALSE, sep = " "))
names(testSubject) <- "subjectCode"

# Use dplyr for easy merging
train <- cbind(trainLabels,trainSubject,trainSet)
test <- cbind(testLabels,testSubject,testSet)
data1 <- rbind(train, test)
names(data1)[3:ncol(data1)] <- combine(select(variableLabels, varName)) # set descriptive column names

# Step 2. Extract only the measurements on the mean and standard deviation for each measurement.
selectedColumns <- grep("actCode|subjectCode|-mean()|-std()", names(data1))
data2 <- data1[selectedColumns]

# Step 3. Use descriptive activity names in the data set
data3 <- select(left_join(data2, activityLabels, c("actCode", "actCode")), -actCode, -contains('Freq'))

# Step 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject
tidydata <- data3 %>% group_by(actName, subjectCode) %>% summarise_each(funs(mean)) %>% arrange(subjectCode)
write.table(tidydata, file="tidydata.txt", row.names=FALSE)