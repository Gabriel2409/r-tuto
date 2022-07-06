# R core programming principles

## Data types

- integers: `x <-2L`
- double: `y <-2`. By default, R will create a double
- complex: `z <- 3 + 2i`
- character: `a <-"h"`
- logical: `q1 <- T`

Check type : `typeof(x)`

## Variables:

- remove a variable from the R env with `remove(<var_name>)`
- addition: `c <- a + b`
- concat strings: `message <- paste("Hello", "World")`

## Logical operators

- basics: `==`, `!=`, `>`, `<`, `<=`, `>=`
- not: `!`
- or, and, use only single symbol: `|`,`&`
- check if var is true: `isTRUE(x)`

## loops

```
while (a < 10) {
  print(a)
  a <- a + 1
}

# Note: 1:5 includes the 5
for (i in 1:5) {
  print(i)
}
```
