# Load necessary libraries
library(dplyr)
library(readr)
library(here)
library(knitr)

here::i_am("Code/process_data.R")

# Read the data
data <- read_csv(here("Data/measures_data_2024.csv"))

# Filter for specific measure_ids
selected_ids <- c(7, 8, 9, 10, 11, 12, 14, 15, 17, 18, 19, 20, 21, 
                  22, 23, 24, 25, 26, 27, 28, 29)

filtered_data <- data %>%
  filter(measure_id %in% selected_ids) %>%
  mutate(
    measure_name = case_when(
      measure_id == 7 ~ "Atrial Fibrillation (A-Fib) Prevalence",
      measure_id == 8 ~ "Alzheimer's Disease Prevalence",
      measure_id == 9 ~ "Heart Attack (Acute Myocardial Infarction) Prevalence",
      measure_id == 10 ~ "Anemia Prevalence",
      measure_id == 11 ~ "Anxiety Prevalence",
      measure_id == 12 ~ "Asthma Prevalence",
      measure_id == 14 ~ "All Combined Cancer Prevalence",
      measure_id == 15 ~ "Chronic Kidney Disease Prevalence",
      measure_id == 17 ~ "COPD Prevalence",
      measure_id == 18 ~ "Dementia (Non-Alzheimer's) Prevalence",
      measure_id == 19 ~ "Depression, Bipolar, or Other Depressive Mood Disorders Prevalence",
      measure_id == 20 ~ "Diabetes Prevalence",
      measure_id == 21 ~ "Heart Failure Prevalence",
      measure_id == 22 ~ "Hip/Pelvic Fracture Prevalence",
      measure_id == 23 ~ "High Cholesterol (Hyperlipidemia) Prevalence",
      measure_id == 24 ~ "High Blood Pressure (Hypertension) Prevalence",
      measure_id == 25 ~ "Coronary Artery Disease (Ischemic Heart Disease) Prevalence",
      measure_id == 26 ~ "Obesity Prevalence",
      measure_id == 27 ~ "Osteoporosis Prevalence",
      measure_id == 28 ~ "Rheumatoid Arthritis/Osteoarthritis Prevalence",
      measure_id == 29 ~ "Stroke (Transient Ischemic Attack) Prevalence",
      TRUE ~ NA_character_
    ),
    Prevalence = measure_numerator / measure_denominator
  )
output_file <- here("Output", "filtered_data.Rds")

saveRDS(filtered_data, file = output_file)
