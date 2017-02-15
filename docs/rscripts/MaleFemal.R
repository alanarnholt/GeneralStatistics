library(PASWR2)
library(ggplot2)
ggplot(data = BODYFAT, aes(x = age, y = fat, shape = sex, color = sex)) +
  geom_point(size = 6) +
  scale_shape_manual(values = c(F = "\u2640", M = "\u2642")) + 
  scale_color_manual(values = c("purple", "darkgreen")) +
  theme(
    axis.text = element_text(size = 14),
    legend.key = element_rect(fill = "white"),
    legend.background = element_rect(fill = "pink"),
    panel.grid.major = element_line(colour = "white"),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "lightcyan")
  ) +
  labs(x = "Age", y = "Percent Body Fat") +
  ggtitle(label = "For Paige", subtitle = "Source: Mazess, R. B., Peppler, W. W., and Gibbons, M. (1984) Total Body \nComposition by Dual-Photon (153 Gd) Absorptiometry. American Journal \nof Clinical Nutrition, 40, 4: 834-839.")



