# Load necessary libraries
library(readxl)
library(knitr)
library(tidyverse)
library(DT)

# Define the file path
file_path <- "/Users/marco/GitHub/cp-resource-data/R_files/plant_lists/Sarracenia_list_v2.xlsx"

# Load the data
df <- read_excel(file_path, sheet = "amorph_dorm") %>% select(-species)

# Custom CSS for responsive font size
css <- "
<style>
@media (max-width: 600px) {
  table.dataTable tbody th, table.dataTable tbody td {
    font-size: 16px;  /* Adjust font size as needed */
  }
  .dataTables_wrapper .dataTables_paginate {
    font-size: 14px;  /* Pagination font size */
  }
  .dataTables_wrapper .dataTables_info {
    font-size: 12px;  /* Info text font size */
  }
}
</style>
"

# Create the datatable with custom CSS
t <- htmltools::tagList(
  htmltools::HTML(css),
  DT::datatable(
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
)

# Display or save the datatable
t

htmltools::save_html(t, file="/Users/marco/GitHub/amorphophallus/resources/main_table.html")
