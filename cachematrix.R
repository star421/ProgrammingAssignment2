## This function creates a special "matrix" object 
## that can cache its inverse.

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


## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already 
## been calculated (and the matrix has not changed), 
## then cacheSolve should retrieve the inverse from the cache.

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
