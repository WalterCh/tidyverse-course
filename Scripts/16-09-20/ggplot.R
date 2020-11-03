
# Paquetes ----------------------------------------------------------------

library(ggplot2)
library(dplyr)

# Datos -------------------------------------------------------------------

data("diamonds", package = "ggplot2")


# EDA ---------------------------------------------------------------------

# Boxplot
ggplot(data = diamonds) +
  geom_boxplot(mapping = aes(x = carat))

ggplot(diamonds, aes(x = carat)) +
  geom_boxplot()

ggplot(data = diamonds) +
  geom_boxplot(mapping = aes(x = carat, col = cut))

# Barplot
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, y = (..count..)/sum(..count..), fill = cut)) +
  coord_polar() +
  labs(y = "Prop")

# Histogram
ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = price), binwidth = 2000, 
                 col = "black", fill = "red", alpha = .75)

# Density plot
ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = price), binwidth = 2000,
                 col = "black", fill = "red", alpha = .75) +
  geom_density(mapping = aes(x = price, y = ..count..))

# Diagrama de puntos (Scatterplot)
ggplot(data = diamonds %>% 
         sample_n(100)) +
  geom_point(mapping = aes(x = carat, y = price)) +
  geom_smooth(mapping = aes(x = carat, y = price), col = "red", se = FALSE)

ggplot(diamonds %>% 
         sample_n(100), 
       aes(x = carat, y = price)) +
  geom_point() +
  geom_smooth(se = FALSE, col = "red")

ggplot(diamonds %>% 
         sample_n(1000),
       aes(x = carat, y = price, col = cut)) +
  geom_point() +
  geom_smooth(se = FALSE)
