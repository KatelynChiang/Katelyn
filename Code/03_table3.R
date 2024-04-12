# Load packages
library(tidyverse)
library(rempsyc)
library(here)
library(effectsize)
pacman::p_load(flextable)

# Read in data
here::i_am("code/03_table3.R")
abs_filepath <- here::here("Raw_data/f75_interim.csv")
f75 <- read.csv(abs_filepath, header=TRUE)

# Setting Config
WHICH_CONFIG <- Sys.getenv("WHICH_CONFIG")
config <- config::get(
  config = WHICH_CONFIG
)

# Filter the dataset based on conditions
filtered_f75 <- f75 %>%
  dplyr::filter(withdraw2 == "died", 
                days_stable == 999,
                agemons > config$cutpoint)
  

# HTML-friendly T-test
t.test.results <- rempsyc::nice_t_test(
  data = filtered_f75,
  response = "agemons",
  group = "arm",
  warning = FALSE
)

# Formatting agemons variable
t.test.results <- t.test.results %>% mutate(`Dependent Variable` = "Age in Months")

# Creating table3
table3 <- nice_table(t.test.results,
           title = "Table 3: T-test")

# Save table3 as an RDS file
saveRDS(
  t.test.results, 
  file = here::here("Output/table3.rds")
)

