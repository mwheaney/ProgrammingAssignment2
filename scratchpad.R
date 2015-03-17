testMatrix <- matrix(c(1,2,3,4,5,6,7,8,11), nrow =3, ncol =3)
testInv <-solve(testMatrix) #creates inverse
#tempNames <- rownames(testMatrix) # gets rownames for existing matrix
#inverseNames <-     #creates rownames for inverse rows
#    # need to determine # of names to create and pre-pend each with "inv"
#rownames(testInv) <- c(invNames) #creates rownames for inverse data
testmatrix <- rbind(testMatrix, testInv) # appends inverse "cache" to matrix
testmatrix[(nrow(testMatrix)/2+1):(nrow(testMatrix)),] # returns inverse