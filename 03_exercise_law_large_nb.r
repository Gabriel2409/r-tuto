for (n in 10:10:10000) {
  numbers <- rnorm(n = n, mean = 0, sd = 1)
  count <- 0
  for (num in numbers) {
    if (num >= -1 & num <= 1) {
      count <- count + 1
    }
  }
  res <- count / n
  print(res)
}
