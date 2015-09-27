## cachematrix.R
##
## Contains The Following Methods:
##      - makeCacheMatrix
##      - cacheSolve
##


# Creates a special "matrix" object that can cache its inverse.
#
# Args:
#   x: The matrix to be augmented with caching abilities for its inverse.
#
# Returns:
#   The special matrix that caches its inverse
makeCacheMatrix <- function(x = matrix()) {

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

}
