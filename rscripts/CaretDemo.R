library(C50)
data(churn)
str(churnTrain)
predictors <- names(churnTrain)[names(churnTrain) != "churn"]
predictors
