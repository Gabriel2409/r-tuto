?matrix

data <- 1:10
mat <- matrix(data, nrow = 2, ncol = 5, byrow = FALSE)
rownames(mat) <- c("a", "b")
colnames(mat) <- c("a", "b", "c", "d", "e")
mat[1, 2] # element
mat[1, ] # full row
mat[, 2] # full col
mat[1, 1:2] # first two elements of row
mat[1, c(1, 3, 5)] # more complex select
mat[-1, 2:4] # all rows except first, elements 2 to 4 in cols

mat[, 1] # returns a vector
mat[, 1, drop = FALSE] # keeps as matrix

mat[3] # single vector index. Acts like a vector formed by stacking columns
mat[c(1, 8)] # same idea

mat[c(TRUE, FALSE), c(TRUE, TRUE, TRUE, FALSE, TRUE)] # row 1, all cols except 4
mat[mat > 2] # conditional select

a <- c(1, 2, 3)
b <- c(4, 5, 6)
rbind(a, b) # 2 by 3 matrix. row name is name of initial vectors
cbind(a, b) # 3 by 2 matrix. col names is name of initial vectors




mat1 <- matrix(seq(0, 50, by = 10), nrow = 2, ncol = 3)
mat2 <- matrix(seq(0, 5, by = 1), nrow = 2, ncol = 3)
mat3 <- matrix(1:10, nrow = 5, ncol = 2)

mat2 / mat1
mat3 / mat2 # error: non conformable arrays
