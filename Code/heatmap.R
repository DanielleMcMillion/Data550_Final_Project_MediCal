# Load necessary libraries
library(here)
library(dplyr)
library(ggplot2)
library(tidyr)

here::i_am("Code/heatmap.R")

# Read the data (assuming the filtered data is already loaded)
filtered_data <- readRDS(here("Output", "filtered_data.Rds"))

# Reshaping data
heatmap_data <- filtered_data %>%
  filter(!is.na(Prevalence) & !is.na(age_band) & !is.na(measure_name)) %>%
  select(age_band, measure_name, Prevalence)

# making the heatmap
ggplot(heatmap_data, aes(x = factor(age_band), y = measure_name)) +
  geom_tile(aes(fill = Prevalence), color = "white") +
  scale_fill_gradient(low = "blue", high = "red") + 
  labs(title = "Prevalence of Chronic Conditions by Age Band",
       x = "Age Band", y = "Condition", fill = "Prevalence") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        axis.text.y = element_text(size = 8))  

ggsave(here("Output", "heatmap_age_band_conditions.png"), width = 10, height = 8)
