# code to prepare `breakfast` dataset goes here

library(dplyr)
set.seed(19)

breakfast_raw <- readr::read_csv2(
  file = "data-raw/breakfast.csv"
) |>
  as.data.frame()

breakfast <- breakfast_raw |>
  sample_n(size = 1e3)

usethis::use_data(breakfast, overwrite = TRUE)

checkhelper::use_data_doc(
  name = "breakfast",
  description = "A simple dataset about the breakfast time in France.",
  source = "INSEE"
)
