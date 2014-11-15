## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    s = NULL
    set = function(m) {
        x <<- m
        s <<- NULL
    }
    get = function() x
    setSolve = function(solveMatrix) s <<- solveMatrix
    getSolve = function() s
    list(set = set, get = get,
         setSolve = setSolve,
         getSolve = getSolve)

}


## Write a short comment describing this function

## Return a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    s = x$getSolve()
    if(!is.null(s)) {
        message("getting cached data")
        return(s)
    }
    s = solve(x$get())
    x$setSolve(s)
    s
}
