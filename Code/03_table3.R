# Load packages
library(dplyr)

# Read in data
here::i_am("code/03_table3.R")
abs_filepath <- here::here("Raw_data/f75_interim.csv")
f75 <- read.csv(abs_filepath, header=TRUE)

# Filter the dataset based on conditions
filtered_f75 <- f75 %>%
  dplyr::filter(withdraw2 == "died", days_stable == 999)

# Perform t-test
t_test_result <- t.test(agemons ~ arm, data = filtered_f75, var.equal = FALSE)

# Display the t-test results
t_test_result