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
    panel.grid.major = element_line(color = "white"),
    panel.grid.minor = element_line(color = "white"),
    panel.background = element_rect(fill = "lightcyan"),
    panel.border = element_rect(fill = NA, color = "grey20")
  ) +
  labs(x = "Age", y = "Percent Body Fat") +
  ggtitle(label = "Customized (Ugly) Theme", subtitle = "Source: Mazess, R. B., Peppler, W. W., and Gibbons, M. (1984) Total Body \nComposition by Dual-Photon (153 Gd) Absorptiometry. American Journal \nof Clinical Nutrition, 40, 4: 834-839.")


# panel.grid.major = element_line(colour = "white"),


ggplot(data = BODYFAT, aes(x = age, y = fat, shape = sex, color = sex)) +
  geom_point(size = 6) +
  scale_shape_manual(values = c(F = "\u2640", M = "\u2642")) + 
  scale_color_manual(values = c("purple", "darkgreen")) +
  labs(x = "Age", y = "Percent Body Fat") +
  theme_bw() + 
  ggtitle(label = "Black and White Theme", subtitle = "Source: Mazess, R. B., Peppler, W. W., and Gibbons, M. (1984) Total Body \nComposition by Dual-Photon (153 Gd) Absorptiometry. American Journal \nof Clinical Nutrition, 40, 4: 834-839.")

####

ggplot(data = BODYFAT, aes(x = age, y = fat, shape = sex, color = sex)) +
  geom_point(size = 6) +
  scale_shape_manual(values = c(F = "\u2640", M = "\u2642")) + 
  scale_color_manual(values = c("purple", "darkgreen")) +
  theme(
    axis.text = element_text(size = 14),
    legend.key = element_blank(),
    legend.background = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    panel.border = element_rect(fill = NA, color = "grey20")
  ) +
  labs(x = "Age", y = "Percent Body Fat") +
  ggtitle(label = "No Grid Lines", subtitle = "Source: Mazess, R. B., Peppler, W. W., and Gibbons, M. (1984) Total Body \nComposition by Dual-Photon (153 Gd) Absorptiometry. American Journal \nof Clinical Nutrition, 40, 4: 834-839.")


#####
