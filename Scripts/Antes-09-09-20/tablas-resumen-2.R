# Seccion se hace con Ctrl + Shift + R
# Paquetes ----------------------------------------------------------------

library(readr)
library(dplyr)


# Datos -------------------------------------------------------------------

covid <- read_csv("./Data/positivos-covid.csv")
solar <- read_csv("./Data/solar-power-generation-plant.csv")
lineas_mov <- read_csv("./Data/lineas-moviles-tbl.csv")
covid2 <- read_csv("./Data/positivos-covid-tbl.csv")
space <- read_csv("./Data/space-missions.csv")


# Manipulacion de datos ---------------------------------------------------

covid_tbl <- covid %>% 
  sample_n(100) %>% 
  mutate(FECHA_RESULTADO = as.character(FECHA_RESULTADO),
         FECHA_RESULTADO = as.Date(FECHA_RESULTADO, "%Y%m%d")) 

solar_tbl <- solar %>% 
  mutate(DATE_TIME = substr(DATE_TIME, 1, 10))

space_tbl <- space %>% 
  mutate(Date = substr(Datum, 5, 16),
         Date = as.Date(Date, "%b %d, %Y"))


# EDA ---------------------------------------------------------------------

# Conteo de pacientes por departamentos
covid %>% 
  group_by(DEPARTAMENTO) %>% 
  summarise(Conteo = n()) %>% 
  arrange(desc(Conteo)) %>% # en orden descendiente
  print(n = Inf)

# Conteo de pacientes por provincias
covid %>% 
  group_by(PROVINCIA) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))

# Conteo de pacientes por distrito
covid %>% 
  group_by(DISTRITO) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))

# Conteo de pacientes por cada metodo
covid %>% 
  group_by(METODODX) %>% 
  summarise(Conteo = n(),
            Prop = n()/600438*100)

# Resumen de pacientes de sexo por edad
covid %>% 
  group_by(SEXO) %>% 
  summarise(Prom = mean(EDAD, na.rm = TRUE),
            Mediana = median(EDAD, na.rm = TRUE))

# Results -----------------------------------------------------------------

write_csv(covid_tbl, "./Data/positivos-covid-tbl.csv")
write_csv(solar_tbl, "./Data/solar-power-generation-plant-tbl.csv")
