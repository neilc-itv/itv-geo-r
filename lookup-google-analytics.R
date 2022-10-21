library(googleAnalyticsR)
library(tidyverse)
library(lubridate)
library(googlesheets4)
library(sf)

#Interactive Google auth flow
ga_auth()

#List accounts (to assist finding view_id)
account_list <- ga_account_list()

#Get traffic for the past 30 days (replace date_range with your owm requirements)
web_traffic <- google_analytics(ga_id,
                               date_range = c(today()-31, today()-1),
                               metrics = "sessions",
                               dimensions = c("date", "city"),
                               max = -1,
                               anti_sample = TRUE)

region_lookup <- read_sheet("https://docs.google.com/spreadsheets/d/1IrXvpobPZaq_EvHSTsPUkqxWwOn6aCEgWsD6ENR5CFA",
                            "GA Lookup")

web_traffic_regional <- web_traffic %>% 
  left_join(region_lookup, by = c("city" = "City")) %>% 
  group_by(date, Macro) %>% 
  summarise(sessions = sum(sessions)) %>% 
  filter(!is.na(Macro))