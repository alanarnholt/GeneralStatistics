# What does confidence mean?  Simulation of CI for proportions

# Create 10,000 95% CIs for p when p = .7, n=500

m <- 10000

CIlev <- 0.95
z <- qnorm(1 - (1 - CIlev)/2)

z

p <- 0.7
n <- 500
set.seed(13)
#sample from 0 & 1 m*n times
trialvals <- sample(c(0, 1), m*n, replace = TRUE, prob = c(1-p, p))

#reshape to matrix
trialmat <- matrix(trialvals, ncol = n)

#find the number of successes for each sample
NumSuccesses <- apply(trialmat, 1, sum)

#calculate phat for all the samples
Phats <- NumSuccesses/n
hist(Phats)

#Calculate end points for the CIs
LOW <- Phats - z*sqrt(Phats*(1 - Phats)/n)
UP <- Phats + z*sqrt(Phats*(1 - Phats)/n)

DF <- cbind(Phats = Phats, LOW = LOW, UP = UP)
head(DF)

#Graphs of lower & upper endpoints
lowhist <- hist(LOW, breaks = 50, plot = FALSE)
plot(lowhist, col = ifelse(abs(lowhist$breaks) < .7, "seagreen1", "red"))

uphist <- hist(UP, breaks = 50, plot = FALSE)
plot(uphist, col = ifelse(abs(uphist$breaks) > .7, "seagreen2", "red"))


#say whether endpoints are "good"
Goodlow <- LOW < p
Goodup <- UP > p

goodCI <- cbind(Goodlow, Goodup)
head(goodCI)

#find when BOTH endpoints are "good"
gotit <- apply(goodCI, 1, sum)

#turn counts into percents:
percentgood <- table(gotit)/m
percentgood

#pretty output:
cat("The simulated CI contained the truth",percentgood[2]*100,"% of the time")


#as a function:
phat.sim <- function(m, p, n, CIlev) {
  trialvals <- sample(c(0, 1), m*n, replace = TRUE, prob = c(1-p, p))
  trialmat <- matrix(trialvals, ncol = n)
  
  NumSuccesses <- apply(trialmat, 1, sum)
  Phats <- NumSuccesses/n
  
  z <- qnorm(1 - (1 - CIlev)/2)
  
  LOW <- Phats - z*sqrt(Phats*(1 - Phats)/n)
  UP <- Phats + z*sqrt(Phats*(1 - Phats)/n)
  
  Goodlow<- LOW < p
  Goodup <- UP > p
  
  goodCI <- cbind(Goodlow, Goodup)
  gotit <- apply(goodCI, 1, sum)
  percentgood<- table(gotit)/m
  cat("The simulated CI contained the truth",percentgood[2]*100,"% of the time")
}


#PLAY with it:
phat.sim(m = 10000, p = 0.7, n = 500, CIlev = 0.95)

phat.sim(10000, p = 0.2, n = 2000, CIlev =.91) #10,000 trials, p = .2, n=2000, conflev = .91
phat.sim(10000, 0.5, 100, 0.98)

phat.sim(9999, 0.5, 100, 0.98)

#tools > install packages > PASWR2
library(PASWR2)
?cisim
cisim(samples = 100, n = 1000,parameter = 0.7, conf.level = 0.95, type = "Pi")


m <- 10000
n1 <- 500
p1 <- 0.47
n2 <- 500
p2 <- 0.43

library(ggplot2)
phat1 = rbinom(m, n1, p1)/n1
phat2 = rbinom(m, n2, p2)/n2
phatd = phat1 - phat2
DF <- data.frame(phat1 = phat1, phat2 = phat2, phatd = phatd)
MEANphat <- round(mean(DF$phatd), 4)
SDphat <- round(sd(DF$phatd), 4)
DF <- cbind(DF, INT = ifelse(phatd < quantile(phatd, 0.025), "out", 
                             ifelse(phatd > quantile(phatd, 0.975), "out", "in")))
head(DF)

ggplot2::ggplot(data = DF) + 
    geom_histogram(aes(x = phatd, fill = INT), 
                   alpha = 0.2) + 
    theme_bw() + 
    labs(x = expression(hat(p))) + 
    theme_bw(base_size = 18) + 
    labs(x = substitute(paste(hat(mu)[hat(p)[1]-hat(p)[2]] == MEANphat, " and ", hat(sigma)[hat(p)[1]-hat(p)[2]] == SDphat), list(MEANphat = MEANphat, SDphat = SDphat)))


# stat_function(fun = dnorm, args = list(p1 - p2, sqrt(p1*(1 - p1)/n1 + p2*(1 - p2)/n2)), n = 500, color = "red") +