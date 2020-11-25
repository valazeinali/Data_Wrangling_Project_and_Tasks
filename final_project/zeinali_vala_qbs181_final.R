# Load in libraries
library(tidyr)
library(dplyr)
library(data.table)
library(sqldf)
library(lubridate)

# Load in data
df <- read.csv("/Users/valazeinali/Desktop/Dartmouth/Fall 2020/Data Wrangle/IC_BP_v2.csv")
head(df)

#1.a)
names(df)[names(df) == "BPAlerts"] <- "BP status"

# 10 random rows
df[sample(nrow(df), 10), ]

#1.b)
# First convert
df[df$`BP status` == "Hypo1","Group"]<-"Controlled blood pressure"
df[df$`BP status` == "Normal","Group"]<-"Controlled blood pressure"

df[df$`BP status` == "Hypo2","Group"]<-"Uncontrolled blood pressure"
df[df$`BP status` == "HTN1","Group"]<-"Uncontrolled blood pressure"
df[df$`BP status` == "HTN2","Group"]<-"Uncontrolled blood pressure"
df[df$`BP status` == "HTN3","Group"]<-"Uncontrolled blood pressure"
df[df$`BP status` == "NULL","Group"]<-"Unknown"

df_final <- df # copy data frame to do next convert
# Binary Convert
df[df_final$Group == "Controlled blood pressure","Binary Group"] <- 1
df[df_final$Group == "Uncontrolled blood pressure","Binary Group"] <- 0

# 10 random rows
df[sample(nrow(df), 10), ]

#1.c)
demo <- read.csv("/Users/valazeinali/Desktop/Dartmouth/Fall 2020/Data Wrangle/Demographics_202011241557.csv")

dt1 <- data.table(demo, key = "contactid")
dt2 <- data.table(df, key = "ID")
df_join <- dt1[dt2]

df_join[sample(nrow(df_join), 10), ]
length(df_join$contactid)

#1.d)

ans <- sqldf("SELECT contactid, avg(SystolicValue) as twelve_week_average_systolic, avg(Diastolicvalue) as twelve_week_average_diastolic
              FROM df_join
             GROUP BY contactid")
ans[sample(nrow(ans), 10), ]



#1.e)

#1 week value
ans1 <- sqldf("SELECT contactid, avg(SystolicValue) as one_week_average_systolic, avg(Diastolicvalue) as one_week_average_diastolic, min(tri_enrollmentcompletedate)
              FROM df_join
              GROUP BY contactid")
ans1[sample(nrow(ans1), 10), ]

#12 week value
ans12 <- sqldf("SELECT contactid, avg(SystolicValue) as twelve_week_average_systolic, avg(Diastolicvalue) as twelve_week_average_diastolic, max(tri_enrollmentcompletedate)
              FROM df_join
              GROUP BY contactid")
ans12[sample(nrow(ans12), 10), ]














#2 
# Done in DbBeaver

#3
# Load in joined table from CSV 
data <- read.csv("/Users/valazeinali/Desktop/Dartmouth/Fall 2020/Data Wrangle/finaldb_202011242039.csv")

output<-setDT(data)[,.SD[which.max(TextSentDate)],keyby=contactid]
output[sample(nrow(output), 10), ]











