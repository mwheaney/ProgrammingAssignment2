## These two functions together allow the caching of the inverse of a matrix 
## and then allow that to be retrieved from cache so that it doesn't have to 
## be generated from scratch each time. 
## To use, follow these steps: 
## Step 1: Call makeCacheMatrix on a matrix and assign its value to a 
## variable. 
##              Example: >test2 <- makeCacheMatrix(testMatrix)
## Step 2: Call cacheSolve twice on the variable created above. 
##              Example: > cacheSolve(test2)
## The second time you run it you will see red text indicating it is using 
## cached data.


## The first function creates the "CacheMatrix" and is called by cacheSolve. 

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x  
    setMatrix <- function(matrix) m <<- matrix 
    getMatrix <- function() m  
    list(set = set, get = get,
         setMatrix = setMatrix,
         getMatrix = getMatrix)
}


## This function returns the cached inverse of the matrix, if available. 


cacheSolve <- function(x, ...) {
    m <- x$getMatrix()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setMatrix(m)
    m
}
