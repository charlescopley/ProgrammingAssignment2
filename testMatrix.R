source('hilbert.R') ##lets get the function that gives me the hilbert matrix
source('cachematrix.R') ## also the makeCacheMatrix.r function and the 



h8<-hilbert(8) ##make a 8x8 matrix
sh8<-solve(h8)

checkInv <- round(h8 %*% sh8) ## sweet. We now have the inverted matrix

## next lets see if I can use my functions
hil<-makeCacheMatrix() ##first we create the matrix (call it hil) in the makecacheMatrix
hil$set(h8) ##then we set the matrix stored inside
hil$get() ## then we check that this has actually gone through?
cacheSolve(hil) # then we tell the structure to calculate its inverse and cache it
##sweet we've done this.
##now lets check that it gets the stored cached Inverser??- We would expect it to print getting 
##cached copy
cacheSolve(hil)
