trainData <- read.table("./train/X_train.txt")
trainLabel <- read.table("./train/y_train.txt")
trainSubject <- read.table("./train/subject_train.txt")
testData <- read.table("./test/X_test.txt")
testLabel <- read.table("./test/y_test.txt")
testSubject <- read.table("./test/subject_test.txt")
data <- rbind(trainData, testData)
joinLabel <- rbind(trainLabel, testLabel)
joinSubject <- rbind(trainSubject, testSubject)
features <- read.table("./features.txt")
colnames(data)=features[,2]
joindata=data[,grep("mean|std",names(data),value=TRUE)]
activity <- read.table("./activity_labels.txt")
activityLabel <- activity[joinLabel[, 1], 2]
joinLabel[, 1] <- activityLabel
names(joinLabel) <- "activity"
names(joinSubject) <- "subject"
cleanedData <- cbind(joinSubject, joinLabel, data)
names(cleanedData)=gsub("\\(\\)", "", names(cleanedData))
names(cleanedData)=gsub("std","Standard Deviation", names(cleanedData))
names(cleanedData)=gsub("mean","Mean", names(cleanedData))
write.table(cleanedData, "merged_data.txt")
library(reshape2)
melteddata=melt(cleanedData,id=c("subject","activity"))
data_with_means<- dcast(melteddata, subject + activity ~ variable, mean)
write.table(data_with_means, "data_with_means.txt",row.name=FALSE)


