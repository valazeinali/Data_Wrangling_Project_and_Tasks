# HW #2

#1
phoneCall_Encounter = read.csv("/Users/valazeinali/Desktop/Dartmouth/Fall 2020/Data Wrangle/PhoneCall_Encounter_202010211405.csv")

phoneCall_Encounter[phoneCall_Encounter$EncounterCode ==125060000,"EnrollmentGroup"]<-"Clinical Alert"
phoneCall_Encounter[phoneCall_Encounter$EncounterCode ==125060001,"EnrollmentGroup"]<-"Health Coaching"
phoneCall_Encounter[phoneCall_Encounter$EncounterCode ==125060002,"EnrollmentGroup"]<-"Technical Question"
phoneCall_Encounter[phoneCall_Encounter$EncounterCode ==125060003,"EnrollmentGroup"]<-"Administrative"
phoneCall_Encounter[phoneCall_Encounter$EncounterCode ==125060004,"EnrollmentGroup"]<-"Other"
phoneCall_Encounter[phoneCall_Encounter$EncounterCode ==125060005,"EnrollmentGroup"]<-"Lack of engagement"
phoneCall_Encounter[sample(nrow(phoneCall_Encounter), 10), ]

#2
as.data.frame(table(phoneCall_Encounter$EnrollmentGroup))

#3
callDuration = read.csv("/Users/valazeinali/Desktop/Dartmouth/Fall 2020/Data Wrangle/CallDuration_202010211405.csv")
#install.packages("sqldf") #able to do SQL stuff
#library(sqldf)

library(data.table)

dt1 <- data.table(phoneCall_Encounter, key = "CustomerId") 
dt2 <- data.table(callDuration, key = "tri_CustomerIDEntityReference")
joined.dt1.dt.2 <- dt1[dt2]
joined.dt1.dt.2[sample(nrow(joined.dt1.dt.2), 10), ]

#4
joined.dt1.dt.2[joined.dt1.dt.2$CallType ==1,"CallTypeLabel"]<-"Inbound"
joined.dt1.dt.2[joined.dt1.dt.2$CallType ==2,"CallTypeLabel"]<-"Outbound"
joined.dt1.dt.2[joined.dt1.dt.2$CallDuration ==1,"CallOutcomeLabel"]<-"No Response"
joined.dt1.dt.2[joined.dt1.dt.2$CallDuration ==2,"CallOutcomeLabel"]<-"Left voice mail"
joined.dt1.dt.2[joined.dt1.dt.2$CallDuration ==3,"CallOutcomeLabel"]<-"Successful"
as.data.frame(table(joined.dt1.dt.2$CallTypeLabel))
as.data.frame(table(joined.dt1.dt.2$CallOutcomeLabel))

library(dplyr)
joined.dt1.dt.2 %>% 
  group_by(CallOutcomeLabel) %>% 
  summarise(TotalCallDuration = sum(CallDuration))

#5
# join three tables

Demographics = read.csv("/Users/valazeinali/Desktop/Dartmouth/Fall 2020/Data Wrangle/Demographics_202010211514.csv")
Conditions = read.csv("/Users/valazeinali/Desktop/Dartmouth/Fall 2020/Data Wrangle/Conditions_202010211515.csv")
TextMessages =  read.csv("/Users/valazeinali/Desktop/Dartmouth/Fall 2020/Data Wrangle/_Text__202010211515.csv")
library(data.table)
library(sqldf)

dt1 <- data.table(TextMessages, key = "tri_contactId")
dt2 <- data.table(Demographics, key = "contactid")
temp <- dt1[dt2]
dt3 <- data.table(Conditions, key = "tri_patientid")
names(temp)[names(temp) == "tri_contactId"] <- "tri_patientid" #for the join
df_final <- sqldf("SELECT *
              FROM temp
              JOIN Conditions USING(tri_patientid)")
all <- as.data.frame(table(df_final$SenderName))
all$Freq = (all$Freq / 52) # 52 = total weeks
all # number of texts per week

#6
all1 <- as.data.frame(table(df_final$tri_name)) 
all1$Freq = (all1$Freq / 52) # 52 = total weeks
all1 # number of texts per week

