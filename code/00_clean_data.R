#Set working directory 

#libs and global settings 
library(tidyverse)
library(gtsummary)
library(knitr)
library(janitor)

#code location 
here::i_am("code/00_clean_data.R")


## Load data
#Data loaded from data.cdc.gov via url.

ww_data <- read_csv("data/raw/ga_sars_cov2_wastewater.csv")
glimpse(ww_data)



#Clean data from loaded raw data 
wastewater_clean <- ww_data %>%
  select(
    record_id, 
    sample_collect_date, 
    site, 
    state_territory, 
    source, 
    counties_served, 
    population_served, 
    pcr_target, 
    sample_location, 
    pcr_target_detect,
    sample_matrix
  )


write_csv(
  clean_data,
  file = here::here( "Data", "clean", "wastewater_clean.csv")
)

saveRDS(
  clean_data,
  file = here::here("data/clean/wastewater_clean.rds")
)

print("00_clean worked.")
