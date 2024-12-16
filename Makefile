DOCKER_IMAGE = danimillionemory/final_project:final_project_image

REPORT_DIR = ./report

install:
  Rscript -e "renv::restore()"
	
process_data:
	Rscript Code/process_data.R

heatmap:
	Rscript Code/heatmap.R

table:
	Rscript Code/table.R

Final_Project_Report.html: process_data heatmap table Final_Project_Report.Rmd
	Rscript Code/render_report.R

all: process_data heatmap table Final_Project_Report.html

run:
	mkdir -p $(REPORT_DIR)
	docker run --rm \
		-v $(PWD)/$(REPORT_DIR):/final_project_mcmillion/report \
		$(DOCKER_IMAGE)


.PHONY: clean
clean:
	rm -f output/*.rds && rm -f Final_Project_Report.html
	rm -rf $(REPORT_DIR)