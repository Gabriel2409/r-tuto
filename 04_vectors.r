
a <- 1
b <- c(1, "b")
rep(1:-5, 2)



vect <- c("a", "b", "c", "d")
vect[1] # a
vect[6] # NA

vect[c(-1, 3)] # error

v1 <- c(2, 8)
v2 <- c(4, 9)

my_vect <- c(1, 2)
names(my_vect) <- c("a", "b")

names(my_vect) <- NULL
