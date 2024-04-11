pacman::p_load(tidyverse, here)

here::i_am("Code/01_histogram.R")
absolute_path <- here::here('Raw_data/f75_interim.csv')
data <- read.csv(absolute_path, header = TRUE)

# Setting Config
WHICH_CONFIG <- Sys.getenv("WHICH_CONFIG")
config <- config::get(
  config = WHICH_CONFIG
)

# Filtering based on config$cutpoint
data <- data %>% filter(agemons > config$cutpoint)

# Generating and Histogram as a .jpeg in Output folder
agemons <- data$agemons

png(file="Output/Histogram.png")

hist(agemons, 
     main="Distribution of Age (in months)",
     xlab="Age (in months)",
     ylim = c(0, 200),
     xlim = c(0,200),
     col = 'blue')

dev.off()