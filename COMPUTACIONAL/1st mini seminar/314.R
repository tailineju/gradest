if (!require(pacman)) install.packages("pacman")
pacman::p_load(tidyverse,GGally,iris)

rmvn.Choleski <-
function(n, mu, sigma) {
# generate n random vectors from MVN(mu, Sigma)
# dimension is inferred from mu and Sigma
d <- length(mu)
Q <- chol(sigma) # Choleski factorization of Sigma
Z <- matrix(rnorm(n*d), nrow=n, ncol=d)
X <- Z %*% Q + matrix(mu, n, d, byrow=TRUE)
return(X)
}

n <- 200
mu <- c(0,1,2)
sigma <- matrix(c(1,-.5,.5,-.5,1,-.5,.5,-.5,1),nrow=3)
x<-rmvn.Choleski(n,mu,sigma)
head(x)
pairs(x)
ggpairs(x)
