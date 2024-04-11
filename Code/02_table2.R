pacman::p_load(dplyr, gtsummary, here, tidyverse)

here::i_am("Code/02_table2.R")
absolute_path <- here::here('Raw_data/f75_interim.csv')
data <- read.csv(absolute_path, header = TRUE)

# Setting Config
WHICH_CONFIG <- Sys.getenv("WHICH_CONFIG")
config <- config::get(
  config = WHICH_CONFIG
)

# Cleaning Data
data_clean <- data %>%
  filter(agemons > config$cutpoint) %>% 
  mutate(days_stable_clean = case_when(
    days_stable == 999 ~ NA,
    TRUE ~ days_stable)) %>%
  
  mutate(death = case_when(
    days_stable == 999 ~ 1,
    TRUE ~ 0))

# Generating Table 2
table2 <- data_clean %>%
  select(arm, days_stable_clean, weight1, muac1, death) %>%
  tbl_summary(
    label = list(
      days_stable_clean ~ "Days to stabilization",
      weight1 ~ "Weight at stabilization",
      muac1 ~ "MUAC at stabilization",
      death ~ "Children who died before stabilization"),
    by = arm,
    statistic = list(
      days_stable_clean ~ "{mean} ({sd})",
      weight1 ~ "{mean} ({sd})",
      muac1 ~ "{mean} ({sd})",
      death ~"{n} ({p}%)"),
    missing = "no")%>%
  bold_labels() %>% 
  italicize_levels() %>% 
  add_n() %>% 
  add_overall() %>% 
  add_p() %>% 
  bold_p(t=0.8) %>% 
  modify_caption("**Table 2. Primary and Secondary Outcomes by Treatment Arm**")

# Save table2 as an RDS file
saveRDS(
  table2, 
  file = here::here("Output/table2.rds")
)