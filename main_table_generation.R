# Load necessary libraries
library(readxl)
library(knitr)
library(tidyverse)

# Define the file path
file_path <- "/Users/marco/GitHub/cp-resource-data/R_files/plant_lists/Sarracenia_list_v2.xlsx"

# Load the data
df <- read_excel(file_path, sheet = "amorph_dorm") %>% select(-species)

t <- DT::datatable(
  df,
  class = "display nowrap table-striped",
  escape = FALSE,
  rownames = FALSE,
  options = list(
    pageLength = 50,
    scrollX = TRUE, 
    autoWidth = TRUE
  )
)

htmltools::save_html(t, file="/Users/marco/GitHub/amorphophallus/main_table.html")