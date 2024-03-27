library(dplyr)
library(gtsummary)
library(here)

here::i_am("Code/00_table1.R")
absolute_path <- here::here('Raw_data/f75_interim.csv')
data <- read.csv(absolute_path, header = TRUE)

# Generating Table 1
table1 <- data %>%
  select(agemons, sex, weight, arm, muac) %>%
  rename(Age = agemons,
         Sex = sex,
         Weight = weight,
         Arm = arm,
         MUAC = muac) %>%
  gtsummary::tbl_summary(by = Arm,
                         statistic = list(Age ~ "{mean} ({sd})",
                                          Weight ~ "{mean} ({sd})",
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
  data, 
  file = here::here("Output/table1.rds")
)
