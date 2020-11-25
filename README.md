# Data_Wrangling_Project_and_Tasks
This is a repo for my course work for QBS181 at Dartmouth College. I have been granted permission to make my work public.

## Project 1

Had to rename all the columns for eg.,calculate the time (in days) to complete enrollment and create a new column to have this data. Create a new column “Enrollment Status" based off certain codes. Create a new Column “Gender” based off certain codes. Create a new column “Age group” and create age groups with an interval of 25 yrs. for example 0-25 years as ‘0-25’, 26-50 as “26-50” and so on...

## Project 2

Create a new column “Enrollment group” in the table Phonecall_encounter based off certain codes. Obtain the # of records for each enrollment group. Merge the Phone call encounter table with Call duration table. Findout the # of records for different call outcomes and call type. Use 1-Inbound and 2-Outbound,for call types; use 1-No response,2-Left voice mail and 3 successful. Pleasealso find the call duration for each of the enrollment groups. Merge the tables Demographics, Conditions and TextMessages. Find the # of texts/per week, by the type of sender. Obtain the countof texts based on the chronic condition over a period of time (say per week). 

## Midterm

Supplied messy data set.  List the data-related issues you see in this data set. How will you address each data-related issue? Give justification for why you chose a particular way to address each issue. For example, if you decide to address missing values by removing rows or filling empty data cells, justify your decision or if you want to create a PHI field like year of Birth. Clean the data by addressing each point listed in 1. Verify that whether the counts of each code or value for various variables are correct as mentioned in the website.

## Project 3

Compute the rate for table2, and table4a+table4b and perform the four operationa. Extract the number of TB cases per country per year. Extract the matching population per country per year. Divide cases by population, and multiply by 10,000. Store back in appropriate place. Answer why a piece if code fails to work. Use the flights dataset in the nycflights13 library and answer the following. How does the distribution of flights times within a day change over the course of the year, Compare dep_time,sched_dep_time, and dep_delay. Are they consistent. Explain your findings, and Confirm my hypothesis that the early departures of flights in minutes 20-30 and 50-60 are caused by scheduled flights that leave early. Hint:create a binary variable that tells whether or not a flight was delayed. 

## Final

Consider the following blood pressure dataset (IC_BP_v2.csv). Perform the following operations: Convert BP alerts to BP status,	Define Hypo-1 & Normal as Controlled blood pressure; Hypo-2, HTN1, HTN2 & HTN3 as Uncontrolled blood pressure: Controlled & Uncontrolled blood pressure as 1 or 0 (Dichotomous Outcomes), merge this table with demographics (SQL table) to obtain their enrollment dates, create a 12-week interval of averaged scores of each customer, compare the scores from baseline (first week) to follow-up scores (12 weeks), and how many customers were brought from uncontrolled regime to controlled regime after 12 weeks of intervention? 2)	Merge the tables Demographics, Conditions and TextMessages. Obtain the final dataset such that we have 1 Row per ID by choosing on the latest date when the text was sent (if sent on multiple days) (do this in both R and SQL). Lastly, set up a GitHub repo with all your code in their proper subdirectories with project task descriptions. 
