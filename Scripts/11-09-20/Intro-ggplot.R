# Paquetes -----------------------

library(ggplot2)
library(dplyr)

# Data -----------------------------

data("mpg", package = "ggplot2")

# EDA ------------------------

# Tipos de manufacturer 
unique(mpg$manufacturer)

# Cantidad de valores unicos
length(unique(mpg$manufacturer))

# Cuantos audi en mpg
mpg_audi <- mpg %>%
  filter(manufacturer == "audi")

# hwy x displ de todos los autos 
ggplot(data = mpg) +
  geom_point(mapping = aes(x = hwy, y = displ))

# hwy x displ de los autos audi
ggplot(data = mpg %>% 
         filter(manufacturer == "audi")) +
  geom_point(mapping = aes(x = hwy, y = rend))


