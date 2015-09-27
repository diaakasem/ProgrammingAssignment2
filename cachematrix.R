## cachematrix.R
##
## Contains The Following Methods:
##      - makeCacheMatrix
##      - cacheSolve
##
## Test Run using RStudio
##
## > source('cachematrix.R')
## > m = matrix(runif(10000), nrow = 100, ncol = 100)
## > cm <- makeCacheMatrix(m)
## > system.time(cacheSolve(cm))
##   user  system elapsed 
##  0.002   0.000   0.002 
##  > system.time(cacheSolve(cm))
##     user  system elapsed 
##        0       0       0 


# Creates a special "matrix" object that can cache its inverse.
#
# Args:
#   x: The matrix to be augmented with caching abilities for its inverse.
#
# Returns:
#   The special matrix that caches its inverse
makeCacheMatrix <- function(x = matrix()) {
    matrixInverse <- NULL
    innerMatrix <- NULL
    # Setting innerMatrix to equal the newMatrix
    set <- function(newMatrix) {
        innerMatrix <<- newMatrix
        # Clearing up the inverse
        matrixInverse <<- NULL
    }
    get <- function() x
    # Set the matrix inverse ( to be cached )
    setInverse <- function(inverse) matrixInverse <<- inverse
    # Get the matrix inverse
    getInverse <- function() matrixInverse
    # The new object, with the caching abilities
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


# Computes the inverse of the special "matrix" returned by makeCacheMatrix.
# If the inverse has already been calculated (and the matrix has not changed),
# then the cachesolve should retrieve the inverse from the cache.
#
# Args:
#   x: The matrix to be inversed.
#
# Returns:
#   The inverse of the matrix passed in arguments.
cacheSolve <- function(x, ...) {
    # If no previously cached matrix inverse
    if (is.null(x$getInverse())) {
        # Compute the inverse of the matrix
        matrixInverse <- solve(x$get())
        # update the cache of the inverse matrix
        x$setInverse(matrixInverse)
    } 
    # Return the matrix inverse from cache
    x$getInverse()
}
