## The following two functions allow to check for already calculated matrix inversions.
## If so, the function will reuse the inverted matrix, retrieving it from the cache.
## Otherwise, the second function will calcualted the inversion.
## This allows to improve performance of the overall code.

## Below function creates an object that can cache & read from cache a matrix and its inverse.

makeCacheMatrix <- function(mat = matrix()) {
     minv <- NULL
     set <- function(y) {
          mat <<- y                                  ## caches the matrix (to matrix of higher environment)
          minv <<- NULL
     }
     get <- function() mat                           ## Reads matrix from cache.
     setinverse <- function(solve) minv <<- solve    ## Caches the inverse of the matrix.
     getinverse <- function() minv                   ## Reads the inverse of the matrix.
     list(set = set, get = get,
          setinverse = setinverse,                   ## Output is the list of functions.
          getinverse = getinverse)        
}


## Below function calculates the inverse of the special "matrix" returned by makeCacheMatrix above.
## If it has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.
## If the matrix has changed, it will also recalculate the inverse.

cacheSolve <- function(x, ...) {
     minv <- x$getinverse()              ## Reads inverted matrix from cache.
     if(!is.null(minv)) {                ## Checks whether an inverse is stored in cache and whether the matrix in cache is still the same.
          message("getting cached data")
          return(minv)                   ## If so, the function will simply return minv as the inverted matrix.
     }
     else{
          mat <- x$get()                 ## Otherwise, read matrix from cache...
          minv <- solve(mat)             ## and calculate its inverse.
          x$setinverse(minv)             ## Then, cache the calculated inverted matrix.
          return(minv)                   ## The result of the inversion calculated just 2 lines above is returned by this function.
     }
}
x <- makeCacheMatrix(matrix(c(1,3,2,5),nrow=2))
x$get()
