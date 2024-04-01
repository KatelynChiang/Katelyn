Important Notes
================
Group 2

This project is aimed creating three tables and one figure for the f75_interim.csv data set.
Code files included in this project will eventually render a markdown report with customization parameters for age.
The makefile has rules to generate each of the outputs listed in the organizational structure below. Use 'make outputs' to generate all outputs:


## Organizational Structure

Please make sure that we are following the same naming and filing
convention per the agreed upon structure below.

- **Midterm_project/**
  - report.Rmd
  - render_report.R
  - config.yml
  - **Code/**
    - 00_table1.R
    - 01_histogram.R
    - 02_table2.R
    - 03_table3.R
  - **Output/**
    - table1.rds
    - Histogram.png
    - table2.rds
    - table3.rds
  - **Raw_data/**
    - f75_interim.csv
- makefile
- readme.md
- .gitignore
