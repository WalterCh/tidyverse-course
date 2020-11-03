## Trabajando con formato fecha en R



# Paquetes ----------------------------------------------------------------

library(readr)
library(dplyr)
library(haven)

# Data --------------------------------------------------------------------

space <- read_csv("./Data/space-missions.csv")
covid <- read_csv("./Data/positivos-covid.csv")
solar <- read_csv("./Data/solar-power-generation-plant.csv")
lineas_mov <- read_csv("./Data/Limpios/lineas-moviles-tbl.csv")
factbook <- read_csv2("./Data/factbook.csv")
transv <- read_sav("./Data/estudio-transversal.sav")
data <- read_sav("./Data/database.sav")
carac <- read_sav("./Data/estudio-caracterizacion.sav")
dolor <- read_sav("./Data/anestesia-dolor.sav")
bio <- read_sav("./Data/bioestadisticai.sav")

covid_latam <- read_csv2("./Data/VariosPaises_Covid19.csv")

# Limpieza de datos -------------------------------------------------------

covid_tbl <- covid %>% 
  mutate(FECHA_RESULTADO = as.character(FECHA_RESULTADO),
         FECHA_RESULTADO = as.Date(FECHA_RESULTADO, "%Y%m%d"),
         datos_mayo = FECHA_RESULTADO > as.Date("2020-05-01") & 
           FECHA_RESULTADO < as.Date("2020-06-01"),
         datos_mayo2 = FECHA_RESULTADO %in% as.Date(c("2020-05-01", 
                                                      "2020-06-01")))

solar_tbl <- solar %>% 
  mutate(DATE_TIME = as.Date(DATE_TIME, "%d-%m-%Y %H:%M"))

lineas_mov_tbl <- lineas_mov %>% 
  mutate(Fecha = as.character(Fecha))

covid_latam_tbl <- covid_latam %>% 
  mutate(FECHA = as.Date(FECHA, "%d/%m/%Y"))


# EDA ---------------------------------------------------------------------

# Conteo de datos en mayo 2020
covid_tbl %>% 
  group_by(datos_mayo) %>% 
  summarise(Count = n())


covid_latam_tbl %>% 
  group_by(COUNTRY) %>% 
  summarise(dia_min = min(FECHA),
            dia_max = max(FECHA)) %>% 
  arrange(dia_min)

# Resultados --------------------------------------------------------------

write_csv(lineas_mov_tbl, "./Data/Limpios/lineas-moviles-tbl.csv")
