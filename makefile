# Generate Report
f75_report_config_${WHICH_CONFIG}.html: outputs render_report.R report.Rmd
	Rscript render_report.R

.PHONY: install
install: install_packages.R
	Rscript install_packages.R

.PHONY: outputs
outputs: Output/table3.rds Output/table2.rds Output/Histogram.png Output/table1.rds 

# Make Table 3
Output/table3.rds: Code/03_table3.R Raw_data/f75_interim.csv
	Rscript Code/03_table3.R

# Make Histogram
Output/Histogram.png: Code/01_histogram.R Raw_data/f75_interim.csv
	Rscript Code/01_histogram.R

# Make Table 2
Output/table2.rds: Code/02_table2.R Raw_data/f75_interim.csv
	Rscript Code/02_table2.R

# Make Table 1
Output/table1.rds: Code/00_table1.R  Raw_data/f75_interim.csv
	Rscript Code/00_table1.R

# Cleaning outputs and renderings
.PHONY: clean
clean:
	rm -f Output/* && rm -f *.html && rm -f .Rhistory