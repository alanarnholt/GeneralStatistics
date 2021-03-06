# Monte Hall Generalization
# Code modified from Corey Chivers
# https://bayesianbiologist.com/2012/02/03/monty-hall-by-simulation/
# Alan T. Arnholt



monty <- function(strat = "stay", n = 3, N = 10000, print_games = FALSE){
  doors <- 1:n # initialize doors
  win <- 0     # track of number of wins
  for(i in 1:N){
    prize <- sample(1:n, 1) # select door with Grand prize
    guess <- sample(1:n, 1) # players initial guess
    ## Reveal one of the doors with goat
    if(n == 3 & (prize != guess)){
      reveal <- doors[-c(prize, guess)]
    } else {  
      reveal <- sample(doors[-c(prize, guess)], 1)
    } 
    ## Strategy:  Switch
    if(strat == "switch" & n == 3){
        select <- doors[-c(reveal, guess)]
      } else {
        select <- sample(doors[-c(reveal, guess)], 1)
      }
    ## Stategy:  Random
    if(strat == "random")
      select <- sample(doors[-reveal], 1)
    ## Strategy: Stay
    if(strat == "stay")
       select <- guess
    ## Count wins
    if(prize == select){
      win <- win + 1
      outcome <- "Winner!"
    } else {
      outcome <- "Loser!"
    }
    if(print_games == TRUE)
      cat(paste("Guess: ",guess,
                "\nRevealed: ",reveal,
                "\nSelection: ",select,
                "\nGrand prize: ",prize,
                "\n",outcome,"\n\n",sep=""))
  }
  cat(paste("Using the ",strat," strategy, your win percentage was ",round(win/N*100, 2),"%\n",sep="")) #Print the win percentage of your strategy
}

monty(n = 3, N = 10000, strat = "stay")
monty(n = 3, N = 10000, strat = "random")
monty(n = 3, N = 10000, strat = "switch")
monty(n = 4, N = 10000, strat = "stay")
monty(n = 4, N = 10000, strat = "random")
monty(n = 4, N = 10000, strat = "switch")
monty(n = 5, N = 10000, strat = "stay")
monty(n = 5, N = 10000, strat = "random")
monty(n = 5, N = 10000, strat = "switch")
4/15

