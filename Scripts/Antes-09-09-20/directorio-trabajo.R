# Paquetes
library(readr)
library(haven)

# Forma 1
lineas_moviles1 <- read_csv("C:/Users/RStudio/Documents/walteR/tidyverse-course/Data/lineas-moviles.csv")

# Forma 2
setwd("C:/Users/RStudio/Documents/walteR/tidyverse-course")
lineas_moviles2 <- read_csv("./Data/lineas-moviles.csv")

# Forma 3
lineas_moviles3 <- read_csv("./Data/lineas-moviles.csv")

# Leer archivos sav
est_car <- read_sav("./Data/1 estudio de caracterizacion.sav")
bio <- read_sav("./Data/bioestadisticai.sav")
