## This pair of functions computes the inverse of an inversible matrix and keep the result cached 
<<<<<<< HEAD
## to save unnecessary computational demand as long as the matrix does not change  
## 
## How to Use:
## 1 - Call the cache support function makeVector() passing an inversible matrix as parameter,
## stores the result in a variable to later access :
##   - my_matrix_vector<-makeCacheMatrix(matrix(c(4,7,2,6),nrow=2,ncol=2))
##
## 2- Inverse the matrix my_matrix using cacheSolve
##   - cacheSolve(my_matrix_vector)   
##
## Results:     
## - First cacheSolve() call, it computes the inverse and return results
## - From Second call to cacheSolve() on, it retrives the result from the cached data
=======

>>>>>>> 4ff3718238396d71f6ddc3eb08828b6932ea7976

#######################################################################################################
### makeCacheMatrix: Creates a vector to access matrix cache functions set, get, setinverse, getinverse
##  variable "x" stores original matrix
##  variable "m" stores inverse of matrix
##  functions:
##      $set() - set a new matrix "x" and erase variable m
##      $get() - return original matrix "x"
##      $setinverse() - initialize variable "m" with the inverse of the matrix
##      $getinverse() - return inverse of matrix stored variable "m"
########################################################################################################


makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


#######################################################################################################
### cacheSolve: Return if available, the inverse of a Matrix by accessing the cache matrix vector.
### It checks the return of getinverse() function from the cached makeCacheMatrix for a valid result
### (m is not null) If (m==null), than it gets the original matrix stored in the cache "get()", compute 
### the inverse "solve()" and finally stores the inverse in the cache for future use "setinverse()".
#######################################################################################################

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}

