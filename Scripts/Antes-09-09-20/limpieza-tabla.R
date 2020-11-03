# Paquetes
library(readr)
library(dplyr)

# Data
world <- read_csv2("./Data/factbook.csv")
film  <- read_csv2("./Data/film.csv")

# Data wrangling
film_tbl <- film %>% 
  slice(-1) %>% 
  mutate(Year = as.numeric(Year), 
         Length = as.numeric(Length), 
         Subject = as.factor(Subject),
         Popularity = as.numeric(Popularity))

# Results
write_csv(x = film_tbl, path = "./Data/film-tbl.csv")
