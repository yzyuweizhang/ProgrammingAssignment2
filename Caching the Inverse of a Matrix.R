makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(matrix) {
    x <<- matrix()
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() x
  list(set = set, get = get, 
       setinverse = setinverse,  
       getinverse = getinverse)
}



cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if (!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data)
  x$setinverse(i)
  i
}
