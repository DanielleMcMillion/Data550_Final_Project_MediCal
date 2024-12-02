here::i_am("Code/render_report.R")

library(rmarkdown)

# rendering a report in production mode
render(here::here("Final_Project_Report.Rmd"),

output_file = here::here("Output", "FInal_Project_Report.html"))