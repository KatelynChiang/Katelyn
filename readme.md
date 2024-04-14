Important Notes
================
Group 2

This project is aimed creating three tables and one figure for the f75_interim.csv data set.
Code files included in this project will eventually render a markdown report with customization parameters for age.
The makefile has rules to generate each of the outputs listed in the organizational structure below. 

Once project is downloaded and your working directory is set to that project folder, run the following commands in the terminal:
  - `make install` this will download all of the project specific package versions
  - `make` this will render the report based on the config that you have specified
    - There are two configurations: 
      - `default` Age in months cut-point is 0
      - `experimental`Age in months cut-point is 22 (average age in months)
    - You'll need to specify which configuration you'd like the report to generate by entering the following into the terminal prior to running `make`:
      - For `default`: `export WHICH_CONFIG="default"`
      - For `experimental`: `export WHICH_CONFIG="experimental"`

To run the default version of the report (where age in months cut-point is 0), run the following commands in the terminal in this order:
  1. `make install`
  2. `export WHICH_CONFIG="default"`
  3. `make f75_report_config_${WHICH_CONFIG}.html`

To run the experimental version of the report (where age in months cut-point is 22 [average age in months]), run the following commands in the terminal in this order:
  1. `make install`
  2. `export WHICH_CONFIG="experimental"`
  3. `make f75_report_config_${WHICH_CONFIG}.html`

## Organizational Structure

Please make sure that we are following the same naming and filing
convention per the agreed upon structure below.

- **Midterm_project/**
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
  - **renv/**
- .gitignore
- readme.md
- config.yml
- render_report.R
- report.Rmd
- makefile
- .Rprofile
- renv.lock
- install_packages.R


