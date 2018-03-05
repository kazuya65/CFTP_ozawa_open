
choose_function <- function(){ #4が外部サーバー,1~3が内部サーバー
  l <- which(rmultinom(1,1,q)==1)
  if(l > 3){ #3以上であればサーバーからの離脱
    m <- which(rmultinom(1,1,P[l-3,])==1)
  }else{ #3以下であればサーバーへの到着
    m <- l
  }
  return(c(l,m))
}

update_function <- function(x, L, a){
#  cat("l=", a[[1]], "m=", a[[2]], "\n")
  if (a[1] > 3) {
    fserver <- a[1]-3
    tserver <- a[2]

    if (x[fserver] == 0) return(x)

    x[fserver] <- x[fserver] - 1

    if (tserver == 4) return(x)

    if (x[tserver] < buffersize) {
      x[tserver] <- x[tserver] + 1
    }
  }
  else {
    tserver <- a[1]
    if (x[tserver] < buffersize) {
      x[tserver] <- x[tserver] + 1
    }
  }
  return(x)
}

cftp <- function(xu0, xl0, L, buffersize){
  servers <- cbind(choose_function())
  break_frag <- 0
  T <- -1
  while(1){
#  for(i in 1:30){ #テスト用
    xu <- xu0
    xl <- xl0
    for(i in 1:-T){
      cat("xu=", xu, "xl=", xl, "\n")
      xu <- update_function(xu, L, servers[,i])
      xl <- update_function(xl, L, servers[,i])
      if(all(xu == xl)){
        break_frag <- 1
      }
      if (sum(xu) < sum(xl))
        stop("error")
    }
    cat("xu=", xu, "xl=", xl, "\n")
    cat("\n")
    if(break_frag==1){
      break
    }
    servers <- cbind(choose_function(), servers)
    T <- T-1
  }
  return(list(xu, T))
}

cftp(xu, xl, L, buffersize)
