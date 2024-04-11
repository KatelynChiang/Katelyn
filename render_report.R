library(rmarkdown)
# rendering a report in production mode
here::i_am("render_report.R")
# Reading in system defined variable from terminal
WHICH_CONFIG <- Sys.getenv("WHICH_CONFIG")

# Setting configuration
config <- config::get(
  config = WHICH_CONFIG)

report_filename <- paste0(
  "f75_report_config_",
  WHICH_CONFIG,
  ".html"
)

render("report.Rmd",
       output_file = report_filename)
