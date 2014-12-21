# @Author : Biswajit (bjitfreelancing@gmail.com)
#
#
# It's a function that returns a list of functions
# It stores a Non Invertible Matrix and cached value of its inverse
# This function contains the following functions
#  *	setMatrix 
#  *  getMatrix 
#  *  cacheInverse
#  *  getInverse
makeCacheMatrix <- function(inputmatrix = numeric()) {
  	cache <- NULL

	# Stores a Matrix
  	setMatrix <- function(input){
	  inputmatrix <<- input
  	  cache <<- NULL
	}

	# Returns the stored Matrix/ Getter method
	getMatrix <- function() inputmatrix

	# Caches the inverse Matrix
	cacheInverse <- function(solveinverse){
		cache <<- solveinverse
	}

	# Gets the cached Inverse Matrix
	getInverse <- function() cache
	
	# Returns list of defined functions
	list(setMatrix = setMatrix, getMatrix = getMatrix,
   		cacheInverse = cacheInverse, getInverse = getInverse)
}

#	This function solves the inverse of matrix created by makeCacheMatrix 
cacheSolve <- function(y, ...) {

	# Retrieves the cached inverse
    	inverse <- y$getInverse()
    	if(!is.null(inverse)){
	      message("Getting cached data")
      	return(inverse)
    	}
		
    	data <- y$getMatrix()
	
	# Checking if the matrix is square
	if(nrow(data) != ncol(data)){
		message("It's not a square matrix, hence can't be invertible")
		return()
	}

	# Checking if the matrix is Invertible
	determinant <- det(data)
	if(determinant == 0){
		message <- message("It is a non Invertible Matrix....")
		return(message)
	}

	# Solving inverse of the matrix
    	inverse <- solve(data, ...)
    	y$cacheInverse(inverse)
    	inverse
}