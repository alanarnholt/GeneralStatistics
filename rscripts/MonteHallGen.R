# Monte Hall Generalization
# Alan T. Arnholt
set.seed(11)
n <- 4
SIM <- 5
BM <- t(replicate(SIM, sample(c(rep(0, n - 1), 1))))
BM
aguess <- sample(1:n, SIM, 1)
aguess
ANS <- numeric(SIM)
for(i in 1:SIM){
ANS[i] <- BM[i, aguess[i]] == 1
} 
ANS
PWNS <- mean(ANS)
PWNS

