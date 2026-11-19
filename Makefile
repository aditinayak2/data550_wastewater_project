.PHONY: all clean
all: final_report.html

clean:
	rm -f data/clean/wastewater_clean.rds output/table_one.rds final_report.html output/figure_two.png
data/clean/wastewater_clean.rds: code/00_clean_data.R data/raw/CDC_Wastewater_Data_for_SARS-CoV-2_GA.csv
	Rscript code/00_clean_data.R

output/table_one.rds: code/01_tables.R data/clean/wastewater_clean.rds
	Rscript code/01_tables.R
	
output/figure_one.png: code/02_figure1.R data/clean/wastewater_clean.rds
	Rscript code/02_figure1.R
	
output/figure_two.png: code/03_figure2.R data/clean/wastewater_clean.rds
	Rscript code/03_figure2.R

final_report.html: final_report.Rmd data/clean/wastewater_clean.rds output/table_one.rds output/figure_two.png
	Rscript -e "rmarkdown::render('final_report.Rmd')"
	
clean:
	rm -f data/clean/wastewater_clean.rds
	rm -f data/clean/wastewater_clean.csv
	rm -f output/table_one.rds
	rm -f output/figure_one.png
	rm -f output/figure_two.png
	rm -f final_report.html