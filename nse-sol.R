### A1

get2 <- function(x, envir) {
  
  checkmate::assert_atomic(x, len = 1)
  checkmate::assert_string(x)
  checkmate::assert_environment(envir)
  x <- as.name(x)
  eval(x, envir = envir)
}

z <- 15
get2("z", envir = caller_env())
get2("mean", envir = caller_env())
get2("formula", envir = global_env())
get2("formula", envir = parent.env(caller_env()))
get2(c("z", "formula"), envir = caller_env())
get2(20, envir = caller_env())

### A2

assign2 <- function(x, value, envir) {
  
  checkmate::assert_atomic(x, len = 1)
  checkmate::assert_string(x)
  checkmate::assert_environment(envir)
  x <- as.name(x)
  value <- eval(value, envir = caller_env())
  expre <- call("<-", x, value)
  eval(expre, envir = envir)
  
}

assign2(x = "n", value = 45, envir = .GlobalEnv)
assign2("name", "John", envir = .GlobalEnv)
new_env <- new.env()
assign2("function", "mean", 
        envir = new_env)
assign2("vector", 1:10, 
        envir = .GlobalEnv)
assign2("missing", NA, envir = current_env())



### A3
# x kein Default
# y Default 10
g <- function(x = 20, y) {
  x + y
}

formals(g) <- alist(x = , y = 10)

g(5)
g(5, 5)
g(y = 5)
