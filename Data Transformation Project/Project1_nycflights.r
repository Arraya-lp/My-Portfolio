## Project - ask 5 questions from flights dataset
library(nycflights13)
library(tidyverse)

glimpse(flights)

## 01 - Which carrier had the least flights? - OO
flights %>%
  count(carrier) %>%
  arrange(n) %>%
  head(3) %>%
  left_join(airlines, by="carrier")

## 02 - Which carrier had the most flights fly to LAX in Q2? - UA
flights %>%
  filter(month %in% c(4,5,6) & dest == "LAX") %>%
  group_by(carrier) %>%
  summarise(n = n()) %>%
  arrange(-n) %>%
  left_join(airlines, by="carrier")


## 03 - Which carrier had the longest air time (Hr.)? - UA
flights %>%
  drop_na() %>%
  group_by(carrier)%>%
  summarise(max_air_time = max(air_time)) %>%
  mutate(max_air_time = max_air_time/60) %>%
  arrange(-max_air_time) %>%
  head(5)

## 04 - Top 3 carriers that have the longest distance flight - HA, UA, AA
flights %>%
  group_by(carrier) %>%
  summarise(max_distance = max(distance))%>%
  arrange(-max_distance) %>%
  head(3)
   
## 05 - Which carrier and flight number had the longest departure delay flight on Christmas day?- EV flight no.3261 
flights %>%
  filter(month == 12 & day == 25) %>%
  select(month, day, carrier, flight, dep_delay) %>%
  arrange(-dep_delay) %>%
  head(5)
