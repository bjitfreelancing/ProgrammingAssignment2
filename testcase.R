# Creating a proper invertible matrix and test the happy scenario
rm(list=ls());
source("cachematrix.R");
a <- makeCacheMatrix( matrix(c(1,2,12,13), nrow = 2, ncol = 2) );
summary(a);
a$getMatrix();
cacheSolve(a);
cacheSolve(a);

# Creating a non square matrix
rm(list=ls());
source("cachematrix.R");
a <- makeCacheMatrix( matrix(matrix(1:1000, 100, 10) ) );
summary(a);
a$getMatrix();
cacheSolve(a);
cacheSolve(a);

# Creating a square, but non invertible matrix
rm(list=ls());
source("cachematrix.R");
a <- makeCacheMatrix( matrix(matrix(1:1000, 10, 10) ) );
summary(a);
a$getMatrix();
cacheSolve(a);
cacheSolve(a);