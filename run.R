# result <- 0
# steps <- 0
# O <- 1000
# for(i in 1:O){
#   result <- c(result, cftp(xu, xl, L)[[1]][1])
#   steps <- c(steps, cftp(xu, xl, L)[[2]])
# }
# length(which(result==2))/(O+1)
# min(steps)
# max(steps)
# sum(steps)/(O+1)

run <- function(){
tmp <- 0
result <- 0
steps <- 0
loops <- 100000
reward <- c(4, 0, 0)
for(i in 1:loops){
  tmp <- cftp(xu, xl, L, buffersize)
  if(all(tmp[[1]]==reward)){
    result <- result + 1
  }
  steps <- c(steps, tmp[[2]])
}
steps <- steps[-1]
return(list(result/loops, min(steps), max(steps), (sum(steps)/loops)))
# min(steps)
# max(steps)
# sum(steps)/loops
}
