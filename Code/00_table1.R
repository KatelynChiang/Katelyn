library(dplyr)
library(gtsummary)
library(here)

here::i_am("Code/00_table1.R")
absolute_path <- here::here('Raw_data/f75_interim.csv')
data <- read.csv(absolute_path, header = TRUE)

# Setting Config
WHICH_CONFIG <- Sys.getenv("WHICH_CONFIG")
config <- config::get(
  config = WHICH_CONFIG
)

# Generating Table 1
table1 <- data %>%
  filter(agemons > config$cutpoint) %>% 
  select(agemons, sex, weight, arm, muac) %>%
  rename("Age (months)" = agemons,
         Sex = sex,
         "Weight (kg)" = weight,
         Arm = arm,
         MUAC = muac) %>%
  gtsummary::tbl_summary(by = Arm,
                         statistic = list("Age (months)"  ~ "{mean} ({sd})",
                                          "Weight (kg)" ~ "{mean} ({sd})",
                                          MUAC ~ "{mean} ({sd})"),
                         missing = "no") %>%
  bold_labels() %>% 
  italicize_levels() %>% 
  add_n() %>% 
  add_overall() %>% 
  add_p() %>% 
  bold_p(t=0.8) %>% 
  modify_caption("**Table 1. Patient Characteristics**")


# Save table1 as an RDS file
saveRDS(
  table1, 
  file = here::here("Output/table1.rds")
)
