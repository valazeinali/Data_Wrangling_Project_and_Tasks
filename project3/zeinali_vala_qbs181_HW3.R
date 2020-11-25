# HW 3
# -------

#1

library(dplyr)
library(tidyverse)
library(magrittr)
library(nycflights13)
library(tidyr)

table2

table2_cases <- filter(table2, type == "cases") %>%
  rename(cases = count) %>%
  arrange(country, year)

table2_cases

t2_population <- filter(table2, type == "population") %>%
  rename(population = count) %>%
  arrange(country, year)

table2_cases_per_cap <- tibble(
  year = table2_cases$year,
  country = table2_cases$country,
  cases = table2_cases$cases,
  pop = table2_population$population
) %>%
  mutate(cases_per_cap = (cases / pop) * 10000) %>%
  select(country, year, cases_per_cap)

table2_cases_per_cap <- table2_cases_per_cap %>%
  mutate(type = "cases_per_cap") %>%
  rename(count = cases_per_cap)

bind_rows(table2, table2_cases_per_cap) %>%
  arrange(country, year, type, count)

table4combo <-
  tibble(
    country = table4a$country,
    `1999` = table4a[["1999"]] / table4b[["1999"]] * 10000,
    `2000` = table4a[["2000"]] / table4b[["2000"]] * 10000
  )
table4combo


#2
table4a
table4a%>%gather(1999,2000,key="year",value="cases")

#3
df <- nycflights13::flights

tail(df)

hist.default(df$air_time)

hist(df$dep_delay,
     main="Distribution of Flight dep_delay in 2013 (NYC)",
     xlab="Air Time",
     xlim=c(-30,400),
     col="magenta",
     freq=FALSE
)

summary(df$dep_time)
summary(df$sched_dep_time)
summary(df$dep_delay)

res <- t.test(df$dep_time , df$sched_dep_time, data = df, var.equal = FALSE)
res

df$delayed_or_not <- ifelse(df$dep_delay>0, 1, 0)

df %>%
  select(dep_delay, carrier, flight, delayed_or_not)
library(ggplot2)

df %>%
  mutate(minute = (dep_time), early = dep_delay < 0) %>%
  group_by(minute) %>%
  summarise(early = mean(early,na.rm = TRUE), n = n()) %>%
  ggplot(aes(minute,early)) + geom_line()


# data viz scrap sheet

df1 <- read.csv("/Users/valazeinali/Desktop/Dartmouth/Fall 2020/Data Viz/neighborhoods_ny.csv")

df1

df2 <- read.csv("/Users/valazeinali/Desktop/Dartmouth/Fall 2020/Data Viz/NewYork_Listing.csv")

df2

df3 <- read.csv("/Users/valazeinali/Desktop/Dartmouth/Fall 2020/Data Viz/reviews_NY.csv")

df3
