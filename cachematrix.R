## These two functions together allow the caching of the inverse of a matrix 
## and then allow that to be retrieved from cache so that it doesn't have to 
## be generated from scratch each time. 

## This function is called by cacheSolve. cacheSolve determines which 
## subfunction (set, get, setMatrix, getMatrix)

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x  
    setMatrix <- function(matrix) m <<- matrix # insert code to create a special matrix that can cache it's invers
    getMatrix <- function() m  # insert code to get cached inverse
    list(set = set, get = get,
         setMatrix = setMatrix,
         getMatrix = getMatrix)
}


## This function returns the cached inverse of the matrix, if available. 
## Otherwise it generates and caches it. 

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
