### DATA VISUALIZATION ##

install.packages("tidyverse")
library(tidyverse)
library(palmerpenguins)
library(ggthemes)

penguins

glimpse(penguins)
data_lihat_sekilas(penguins)

ggplot(data = penguins)
visualisasi_ggplot(data = penguins) #Masih Error

ggplot(
  data = penguins,
  mapping = aes(x = flipper_len, y = body_mass)
)
visualisasi_ggplot(penguins, flipper_len, body_mass)

visualisasi_ggplot(penguins, aes(flipper_len, body_mass)) +
  grafik_geometrik_titik()

ggplot(penguins, aes(x = species)) +
  geom_bar()

visualisasi_ggplot(penguins, aes(x = species)) +
  grafik_geometrik_batang()





