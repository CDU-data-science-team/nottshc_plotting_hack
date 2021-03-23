library(palmerpenguins)
library(tidyverse)
library(ggpattern)
library(ggthemes)
library(extrafont)

penguins %>% 
  ggplot(aes(species, bill_length_mm, fill = species)) +
  geom_col_pattern(aes(pattern = species)) +
  theme_bw() +
  theme(
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.text.x = element_text(angle = 90),
    axis.text = element_text(size = 20),
    legend.title = element_text(size = 20),
    legend.text = element_text(size = 20)
  ) +
  scale_fill_colorblind()
