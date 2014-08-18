## Put comments here that give an overall description of what your
## functions do

## The makeCacheMatrix function will create an object that stores a matrix, the inverse of the matrix
## and a set of functions associated with the matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL ##we use this so that when we create the matrix at first we reset it to NULL
  set <- function(y) { ##this function instantiates the matrix x using the value y f
    x <<- y #
    inv <<- NULL ##and we make sure that the inverse is NULLED 
  }
  get <- function() {x} ##return the value of the matrix stored as x
  setInverse <- function(inverse) {inv<<- inverse} ##here we store the inverted matrix value to the variable inv
  getInverse <- function() {inv} 
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## The function cacheSolve operates on the object above to actually populate the classes

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse() ##first we get the inverse that is in the cacheMatrix
  if(!is.null(inv)){ ##if the invers stored there is not null then there is a cached copy
    message("getting the cached copy")
    return(inv) ##and we return then value
  }
  ##we only do the rest of the code if the cached copy does not already have the inverse stored
  matData<-x$get()
  inv<-solve(matData) ##and here we would invert the matrix
  x$setInverse(inv) ## and we set the inverse value in the cached matrix appropriately
  return(inv)
}
