## Lectura de datos
## Walter Chanava
## 26 Ago

# Librerias
library(readr) # lectura de datos
library(dplyr) # manipulacion de datos

# Datos
gapminder <- read_csv("https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/gapminder.csv")

# Analisis Exploratorio de Datos

# filter
filter(gapminder, lifeExp < 30)
filter(gapminder, country == "Mexico", lifeExp > 60)
print(filter(gapminder, country == "Peru" | country == "Bolivia"), n = Inf)
print(filter(gapminder, country %in% c("Peru", "Bolivia")), n = Inf)

# select
select(gapminder, pop, continent)
select(gapminder, -year, -lifeExp)

# mutate
mutate(gapminder, x = lifeExp + gdpPercap)

# Ejemplo --
cambo <- filter(gapminder, country == "Cambodia")
cambo_new <- select(cambo, -continent, -lifeExp)

select(filter(gapminder, country == "Cambodia"), -continent, -lifeExp)

# Operador pipe %>% 
gapminder %>% 
  filter(country == "Cambodia") %>% 
  select(-continent, -lifeExp)

gap_filter <- gapminder %>% 
  filter(country %in% c("Brasil", "Panama", "France"))
  