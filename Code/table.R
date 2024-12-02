# Load necessary libraries
library(here)
library(dplyr)
library(knitr)

here::i_am("Code/table.R")

filtered_table_data <- readRDS(here("Output", "filtered_data.Rds"))

table_data <- filtered_table_data %>%
  select(measure_name, age_band, Prevalence) %>%
  filter(!is.na(Prevalence) & !is.na(age_band) & !is.na(measure_name))

# Group by both measure_name and age_band, and calculate the average prevalence
table_data <- table_data %>%
  group_by(measure_name, age_band) %>%
  summarise(average_prevalence = mean(Prevalence, na.rm = TRUE), .groups = "drop")

table_output <- here("Output", "prevalence_table.rds")

saveRDS(table_data, file = table_output)