df <- data.frame(x = runif(20), y = runif(20), sex =
                   sample(c("m","f"), 20, rep = TRUE))
library(ggplot2)
ggplot(data = df, aes(x, y, shape = sex)) +
  geom_point(size = 5) +
  scale_shape_manual(values = c("m" = "\u2642", f = "\u2640")) + 
  theme_bw()