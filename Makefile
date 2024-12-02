process_data:
	Rscript Code/process_data.R

heatmap:
	Rscript Code/heatmap.R

table:
	Rscript Code/table.R

Final_Project_Report.html: process_data heatmap table Final_Project_Report.Rmd
	Rscript Code/render_report.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f Final_Project_Report.html