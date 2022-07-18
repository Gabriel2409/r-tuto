a <- 0

while (a < 10) {
  print(a)
  a <- a + 1
}

for (i in 1:5) {
  print(i)
}

#---
# generates n random number
x <- rnorm(n = 1)
if (x > 1) {
  answer <- "Greater than 1"
} else if (x == 1) {
  answer <- "Equal to 1"
} else {
  answer <- "Less than 1"
}
