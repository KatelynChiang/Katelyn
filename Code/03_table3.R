# Load packages
library(tidyverse)
library(rempsyc)

# Read in data
here::i_am("code/03_table3.R")
abs_filepath <- here::here("Raw_data/f75_interim.csv")
f75 <- read.csv(abs_filepath, header=TRUE)

# Filter the dataset based on conditions
filtered_f75 <- f75 %>%
  dplyr::filter(withdraw2 == "died", days_stable == 999)
  

# HTML-friendly T-test
t.test.results <- nice_t_test(
  data = filtered_f75,
  response = "agemons",
  group = "arm",
  warning = FALSE
)

# Formating agemons variable
t.test.results <- t.test.results %>% mutate(`Dependent Variable` = "Age in Months")

# Creating table3
table3 <- nice_table(t.test.results,
           title = "Table 3: T-test")

# Save table3 as an RDS file
saveRDS(
  table3, 
  file = here::here("Output/03_table3.rds")
)

