# Paquetes -----------------------

library(ggplot2)
library(dplyr)

# Data -----------------------------

data("mpg", package = "ggplot2")

# EDA ---------------------------------------------------------------------

# Histogramas
ggplot(data = mpg) +
  geom_bar(mapping = aes(x = manufacturer, fill = manufacturer))

ggplot(data = mpg %>% 
         group_by(class) %>% 
         summarise(count = n())) +
  geom_col(mapping = aes(x = class, y = count, fill = class))

ggplot(data = mpg) +
  geom_bar(mapping = aes(x = trans, y = ..prop.., group = 1))

ggplot(data = mpg) +
  geom_bar(mapping = aes(x = as.factor(year), fill = drv), 
           position = "dodge") +
  scale_y_continuous(limits = c(0, 75), breaks = seq(0, 75, 25)) +
  labs(x = "Anho", y = "Conteo", 
       title = "Produccion de las categorias de drv en 1999 y en 2008",
       caption = "Fuente: Datos del paquete ggplot2")

ggplot(data = mpg) +
  geom_bar(mapping = aes(x = manufacturer, fill = manufacturer)) +
  coord_flip() +
  labs(x = element_blank(), fill = "Empresa")

