here::i_am("Code/01_histogram.R")
absolute_path <- here::here('Raw_data/f75_interim.csv')
data <- read.csv(absolute_path, header = TRUE)

# Generating and Histogram as a .jpeg in Output folder
agemons <- data$agemons

png(file="Output/Histogram.png")

hist(agemons, ylim = c(0, 200),xlim = c(0,200), col = 'violet')

dev.off()