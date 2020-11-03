# Librerias
library(readr)
library(dplyr)

# Datos
gapminder <- read_csv("https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/gapminder.csv")

# Mode function
Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

# Exploratory Data Analysis
# mean(), sd(), median(), min(), max(), n()  

gapminder %>% 
  group_by(country) %>% 
  summarise(mean = mean(lifeExp)) %>% 
  print(n = Inf)

gapminder %>% 
  group_by(year) %>% 
  summarise(media = mean(lifeExp)) %>% 
  print(n = Inf)

gapminder %>% 
  group_by(continent) %>% 
  summarise(Media = mean(lifeExp),
            Mediana = median(lifeExp),
            Moda = Mode(lifeExp),
            Desv_Est = sd(lifeExp)) %>% 
  print(n = Inf)

gapminder %>% 
  group_by(continent, year) %>% 
  summarise(Media_pob = mean(pop)) %>% 
  print(n = Inf)

gapminder %>% 
  group_by(continent) %>% 
  summarise(min_pob = min(pop)) %>% 
  print(n = Inf)

gapminder %>% 
  group_by(country) %>% 
  summarise(Conteo = n()) %>% 
  print(n = Inf)
