library(tidyverse)

# Read in the data.  Do some cleaning/verification
MaxTemp <- read.csv('data-raw/FlagMaxTemp.csv') %>%
  gather('DOM', 'MaxTemp', X1:X31) %>%
  drop_na() %>%
  mutate(DOM  = str_remove(DOM, fixed('X')) ) %>%
  mutate(Date = lubridate::ymd( paste( Year, Month, DOM )) ) %>%
  select(Date, MaxTemp)

# Save the data frame to the data/ directory as MaxTemp.rda
usethis::use_data(MaxTemp)
