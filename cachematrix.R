## Below two functions are used to create a special object to store a Invertible Matrix
## and cache the inverse of the Matrix

## makeCacheMatrix fucnction creates object to set/get a Matirx and set/get the inverse of it

makeCacheMatrix <- function(x = matrix()) {
    im <- NULL
    set <- function(y) {
        x <<- y
        im <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) im <<- solve
    getinverse <- function() im
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## cacheSolve function checks if target matrix had been solved, returns the cached value 
##  or calculate the inverse of the target matrix and return the result if it's not existed

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    im <- x$getinverse()
    if(!is.null(im)) {
        message("getting cached data")
        return(im)
    }
    data <- x$get()
    im <- solve(data, ...)
    x$setinverse(im)
    im

}
