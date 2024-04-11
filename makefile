# Generate Report
f75_report_config_${WHICH_CONFIG}.html: outputs render_report.R report.Rmd
	Rscript render_report.R

.PHONY: install
install: install_packages.R
	Rscript install_packages.R

.PHONY: outputs
outputs: table3.rds table2.rds Histogram.png table1.rds

# Make Table 3
table3.rds: Code/03_table3.R Raw_data/f75_interim.csv
	Rscript Code/03_table3.R

# Make Histogram
Histogram.png: Code/01_histogram.R Raw_data/f75_interim.csv
	Rscript Code/01_histogram.R

# Make Table 2
table2.rds: Code/02_table2.R Raw_data/f75_interim.csv
	Rscript Code/02_table2.R

# Make Table 1
table1.rds: Code/00_table1.R  Raw_data/f75_interim.csv
	Rscript Code/00_table1.R

# Cleaning outputs and renderings
.PHONY: clean
clean:
	rm -f Output/* && rm -f *.html && rm -f .Rhistory