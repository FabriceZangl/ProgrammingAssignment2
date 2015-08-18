#################################
## lines to execute for testing##
## test 3 cases:
## 1. Nothing done so far. New matrix. calculate it's inverse.
## 2. An inverse is available and matrix hasn't changed. Call inverse.
## 3. An inverse is available but for a different matrix. Recalculate inverse.
#################################
mat1 <- matrix(c(9,0,0,0,9,0,0,0,9),nrow = 3, ncol = 3)
mat2 <- matrix(c(4,0,0,4),nrow = 2, ncol = 2)
solve(mat1)
source("ProgAssignment2/cachematrix.R")
makeCacheMatrix(mat2)
cacheSolve(makeCacheMatrix)
undebug(cacheSolve)
