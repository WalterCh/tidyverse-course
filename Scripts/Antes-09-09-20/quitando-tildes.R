# Packages
library(readr)
library(dplyr)
library(stringi)

# Data
lineas_old <- read_csv("./Data/lineas-moviles.csv")
lineas <- read_csv("./Data/lineas-moviles.csv", 
                    locale(encoding = "ISO-8859-1"),
                    col_names = TRUE, 
                    col_types = NULL)

# Data wrangling
lineas_tbl <- lineas %>% 
  rename(Lineas = Líneas,
         Mod_contract = `Modalidad Contractual`,
         Fecha = Mes) %>% 
  mutate(Empresa = stri_trans_general(Empresa, "Latin-ASCII"),
         Departamento = stri_trans_general(Departamento, "Latin-ASCII"),
         Mod_contract = tolower(Mod_contract),
         Fecha = case_when(
           substr(Fecha, 1, 3) == "Ene" ~ paste("01-01", substr(Fecha, 5, 6), 
                                                sep = "-"),
           substr(Fecha, 1, 3) == "Feb" ~ paste("01-02", substr(Fecha, 5, 6),
                                                sep = "-"),
           substr(Fecha, 1, 3) == "Mar" ~ paste("01-03", substr(Fecha, 5, 6),
                                                sep = "-"),
           substr(Fecha, 1, 3) == "Abr" ~ paste("01-04", substr(Fecha, 5, 6),
                                                sep = "-"),
           substr(Fecha, 1, 3) == "May" ~ paste("01-05", substr(Fecha, 5, 6),
                                                sep = "-"),
           substr(Fecha, 1, 3) == "Jun" ~ paste("01-06", substr(Fecha, 5, 6),
                                                sep = "-"),
           substr(Fecha, 1, 3) == "Jul" ~ paste("01-07", substr(Fecha, 5, 6),
                                                sep = "-"),
           substr(Fecha, 1, 3) == "Ago" ~ paste("01-08", substr(Fecha, 5, 6),
                                                sep = "-"),
           substr(Fecha, 1, 3) == "Set" ~ paste("01-09", substr(Fecha, 5, 6),
                                                sep = "-"),
           substr(Fecha, 1, 3) == "Oct" ~ paste("01-10", substr(Fecha, 5, 6),
                                                sep = "-"),
           substr(Fecha, 1, 3) == "Nov" ~ paste("01-11", substr(Fecha, 5, 6),
                                                sep = "-"),
           substr(Fecha, 1, 3) == "Dic" ~ paste("01-12", substr(Fecha, 5, 6),
                                                sep = "-")),
         Fecha = as.Date(Fecha, format = "%d-%m-%y"),
         Lineas = ifelse(Lineas == "-", NA, Lineas),
         Lineas = as.numeric(Lineas))

# Resultado
write_csv(lineas_tbl, "./Data/lineas-moviles-corregido.csv")
