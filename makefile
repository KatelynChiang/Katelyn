# Make table 1
table1.rds: Code/00_table1.R  Raw_data/f75_interim.csv
	Rscript Code/00_table1.R

# Cleaning outputs and renderings
.PHONY: clean
clean:
	rm Output/* && rm -f *.html