#系内客数2
# lambda <- c(1/3, 1/3, 1/3) #到着率
# P <- matrix(0, 4, 4)
# P[1,1] <- c(0)
# P[1,2] <- c(lambda[1])
# P[1,3] <- c(lambda[2])
# P[1,4] <- c(lambda[3])
# P[2,1] <- c(0.4)
# P[2,2] <- c(0)
# P[2,3] <- c(0.3)
# P[2,4] <- c(0.3)
# P[3,1] <- c(0.2)
# P[3,2] <- c(0.3)
# P[3,3] <- c(0)
# P[3,4] <- c(0.5)
# P[4,1] <- c(0.2)
# P[4,2] <- c(0.4)
# P[4,3] <- c(0.4)
# P[4,4] <- c(0)
# I <- diag(1, 4, 4)

lambda <- rep(c(1), 3) #到着率
P <- matrix(0, 4, 4)
P[1,1] <- c(0)
P[1,2] <- c(0.3)
P[1,3] <- c(0.3)
P[1,4] <- c(0.4)
P[2,1] <- c(0.3)
P[2,2] <- c(0)
P[2,3] <- c(0.5)
P[2,4] <- c(0.2)
P[3,1] <- c(0.4)
P[3,2] <- c(0.4)
P[3,3] <- c(0)
P[3,4] <- c(0.2)
P[4,1] <- c(lambda[1])
P[4,2] <- c(lambda[2])
P[4,3] <- c(lambda[3])
P[4,4] <- c(0)
I <- diag(1, 4, 4)


T <- -1
L <- 3 #queueing networkのサーバー数
K <- 12 #系内客数の上限
buffersize <- 4
xu <- c(buffersize, buffersize, buffersize) #global maximum
xl <- c(0,0,0) #global minimum
myu <- c(1.0, 1.0, 1.0) #各サーバーの処理率
v <- sum(lambda)+sum(myu)
q <- c(lambda/v, myu/v)
#q <- myu/v
#q <- c(1/4, 1/4, 1/4, 1/4)

p <- P/v

#library(RMarkov)
#theta <- ctmc.st(P - I)$x
#a <- 0
#for(i in 1:L){
#  a[i] <- c(theta[i]/myu[i])
#}
