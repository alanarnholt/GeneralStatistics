# Independence Illustration

set.seed(3)
sims <- 10000
n <- 49
xbar <- numeric(sims)
SD <- numeric(sims)
for(i in 1:sims){
  vals <- rnorm(n, 100, 7)
  xbar[i] <- mean(vals)
  SD[i] <- sd(vals)
}

R <- round(cor(xbar, SD/sqrt(n)), 4)
R
####
DF <- data.frame(xbar = xbar, SD = SD)
library(ggplot2)
ggplot(data = DF, aes(x = xbar, y = SD/sqrt(n))) + 
  geom_point(alpha = .1, color = "blue") + 
  theme_bw() + 
  labs(x = expression(bar(x)), 
       y = "Standard Error (SE)", 
       title = paste("r =",R)) + 
  theme(plot.title = element_text(hjust = 0.5))
####

