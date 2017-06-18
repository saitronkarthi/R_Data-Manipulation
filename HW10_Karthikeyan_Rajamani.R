#HW10
#Work with DemData_clean.txt. If you do not have it,
#generate it by running a script given as a solution to
#the first practice exercise in "Lesson21_22_PracticeSolutions"
#
#For each question provide a command (or a series of commands)
#that prints requested output to console(when appropriate). 
#Save this file as "HW10_YourFirstName_YourLastName.R" and run
#it with `source("HW10_YourFirstName_YourLastName.R")`.
#All information should be extracted from the original file
#using commands/functions. Do not hard-code any values into 
#your script.

#Q1 2pts
#Read "DemData_clean.txt" into R as `myDemData` object
myDemData<-read.csv("DemData_clean.txt", sep="\t")

#Q2 3pts
#Provide county and state names with the highest
#Infant_mortality value. Include Infant_mortality value
#in your output. Your output should be a data frame.
InfnatMortalitymax<- (myDemData[which(myDemData$Infant_Mortality==max(myDemData$Infant_Mortality, na.rm=TRUE )),c(1,2,5)])
#Q3 2pts
#How many counties have Infant_Mortality equal to 0?
#You should output a single number.
InfnatMortalityZero<-(nrow(myDemData[which(myDemData$Infant_Mortality==0),]))

#Q4  2pts
#Provide the names of counties with 0 Infant_Mortality.
#Your output should be a character vector.
InfnatMortalityZeroname<-as.character(myDemData[which(myDemData$Infant_Mortality==0),c(1)])
#Q5 2pts
#Generate `byState` data frame that records 
#average Total_Births and Total_Deaths for every state
byState<-aggregate(myDemData[7:8], myDemData[2],mean,na.rm=TRUE)
#Q6 3 pts
#Using `byState` dataframe from Q5, identify states that
#have higher Total_Deaths than Total_Births. Your output
#should be a character vector
as.character(byState[byState$Total_Deaths>byState$Total_Births,c(1)])

#Q7. 4pts
#Create a `StSummary` data frame that records mean
#and median values for Population_Density and Suicide rates for
#each state. Change column names to more informative names
#that describe information contained in each column.
v1<-aggregate(list(myDemData$Population_Density,myDemData$Suicide),myDemData[2],median,na.rm=TRUE)
colnames(v1)<-c("state","population_median", "Suicide_median")
v2<-aggregate(list(myDemData$Population_Density,myDemData$Suicide),myDemData[2],mean,na.rm=TRUE)
colnames(v2)<-c("state", "population_mean","suicide_mean")
StSummary<-merge(v1,v2)
#Q8. 2pts
#Save StSummary as tab-delimited "StateSummary.txt" file.
write.table(StSummary, file="StateSummary.txt", quote=FALSE, sep="\t", row.names=FALSE)
