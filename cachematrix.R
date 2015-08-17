## The following two functions allow to check for already calculated matrix inversions.
## If so, the function will reuse the inverted matrix, retrieving it from the cache.
## Otherwise, the second function will calcualted the inversion.
## This allows to improve performance of the overall code.

## Below function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {          ##
     minv <- NULL                                    ##
     setinverse <- function(solve) minv <<- solve    ##
     getinverse <- function() minv                   ##
     list(setinverse = setinverse,                   ##
          getinverse = getinverse)        
}


## Below function calculates the inverse of the special "matrix" returned by makeCacheMatrix above.
## If it has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
     minv <- x$getinverse()                ## minv is variable that will have the inverted matrix as output. This line gets the inverted matrix, whether it's empty or not.
     if(!is.null(minv)) {                  ## checking whether there is an inversion (minv) already calculated for matrix x. 
          message("getting cached data")
          return(minv)                     ## If so, the function will simply return minv as the inverted matrix.
     }
     else{
          minv <- solve(x, ...)            ## This line actually calculates the inversion of matrix x.
          x$setinverse(minv)               ## This line calls the makeCacheMatrix to store/cache the calculated inversion in a seperate environment.
          return(minv)                     ## The result of the inversion calculated just 2 lines above is returned by this function.
     }
}