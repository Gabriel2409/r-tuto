# R core programming principles

## Packages

- install package: `install.packages("ggplot2")`
- activate package: `library(ggplot2)` : no need for quotes
- deactivate package: `detach(package:ggplot2, unload=TRUE)`
- uninstall package: `remove.packages("ggplot2")`

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

- while loop:

```
while (a < 10) {
  print(a)
  a <- a + 1
}
```

- for loop:

```R
# Note: 1:5 includes the 5
for (i in 1:5) {
  print(i)
}
```

- if statement:

```R
# generates n random number
x <- rnorm(n = 1)
if (x > 1) {
  answer <- "Greater than 1"
} else if (x == 1) {
  answer <- "Equal to 1"
} else {
  answer <- "Less than 1"
}
```

## Vectors

- In R, everything is a vector
- Vectors are index based
- Vectors can only contain elements of the same type: if you try to combine several types, they will be coerced to the most general types

```R
a <- c("a", "b", "c") #c is used to combine
a <- 1:5 # generates a sequence. final value included
a <- seq(1,5,2) # last arg is step
# Note: default step is 1 if end > start or -1 if end < start
a <- rep(1,10) # repeats 1 10 times
a <- rep(c(1,2),5) # repeats 1,2 5 times
```

- helper functions: `is.numeric`, `is.double`, `is.character`, ...

- Access elements with []
- Because everything is a vector:
- Note: R is mainly used for vectorized operations so most of the time, no need to access individual elements

```R
a <- 1 # a[1] == 1 | a[1][1] == 1

vect <- c("a","b", "c", "d")
vect[1] # a
vect[6] #NA

vect[0] # returns character(0)
vect[-2] # "a", "c", "d" | everything except second element

vect[c(1,3)] # "a", "c"
vect[c(-1,-3)] # "b", "d"
# note: can not mix negative and positive subscripts
```

- Vectorized operations

```R
a <- c(4,5)
b <- c(10,20)

a + b # 14,25 | -, *, /, bool operation work as well


a3 <- rep(0,4) # recycling of vectors
a3 + a # 4,5,4,5

a2 <- rep(0,3)
a2 + a # 4,5,4 | we also get a warning: longer object length is not a multiple of shorter object length
```

- named vector:

```R
my_vect <- c(1,2)
names(my_vect) <- c("a", "b")

# remove name
names(my_vect) <- NULL
```

## Matrices

- creation:

```R
data <- 1:10
mat <- matrix(data, nrow = 2, ncol = 5, byrow = TRUE)
# Note: if data length is not a sub multiple or multiple of nb row * nbcols, we get a warning
rownames(mat) <- c("a", "b") #similar to names for vectors
colnames(mat) <- c("a", "b", "c", "d", "e")

a <- c(1,2,3)
b <- c(4,5,6)
rbind(a,b) # 2 by 3 matrix. row name is name of initial vectors
cbind(a,b) # 3 by 2 matrix. col names is name of initial vectors
```

- Access:

```R
mat[1, 2] # element
mat[1, ] # full row
mat[, 2] # full col
mat[1, 1:2] # first two elements of row
mat[1, c(1, 3, 5)] # more complex select
mat[-1, 2:4] # all rows except first, elements 2 to 4 in cols

mat[,1] # returns a vector
mat[,1, drop=FALSE] # keeps as matrix

mat[3] # single vector index. Acts like a vector formed by stacking columns
mat[c(1, 8)] # same idea

mat[c(TRUE, FALSE), c(TRUE, TRUE, TRUE, FALSE, TRUE)] # row 1, all cols except 4
mat[mat > 2] # conditional select

# notes: similar to vector, can access by named dimensions as well
```

- operations

```R
# similar to vectors
mat1 <- matrix(seq(0, 50, by = 10), nrow = 2, ncol = 3)
mat2 <- matrix(seq(0, 5, by = 1), nrow = 2, ncol = 3)
mat3 <- matrix(1:10, nrow = 5, ncol = 2)

mat2 / mat1
mat3 / mat2 # error: non conformable arrays
```

## functions

```R
a <- function(){
    mydata <- c(1,2)
    # return value is last exp to be evaluated
    mydata
}
a()

b <- function(alpha=1){
  alpha
}
b(4)
```

### Ex: matplot

- plots in columns
- legends must be added manually

```R
matplot(t(FieldGoals), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4,6), pch=15:18, horiz=FALSE)
```

## dataframes

- similar to matrices but each column can be of a different type

### import data

- show working dir with `getwd()`
- `df <- read.csv(file.choose())` or

```R
setwd("path/to/dir") # sets working dir
df <- read.csv("file.csv")
is.data.frame(df) #TRUE
```

### create df from vectors

```R
v1 <- c(1,"a")
v2 <- c(2, "b")

df <- data.frame(v1,v2)
colnames(df) <- c("name1","name2")

df_alt <- data.frame(name1=v1, name2=v2)
```

### explore dataframe

- nb of rows: `nrow(df)`
- nb of cols: `ncol(df)`
- First rows: `head(df, n=10) # default is 5`
- last rows: `tail(df, n=10)`
- structure of the df: `str(df)`
- more complete summary: `summary(df)`

NOTE: categorical variables are represented as factors. Each value is stored ad an integer and the factor contains the mapping between the integer ans the corresponding level

### dataframe access and assignment

- everything that we can use on a matrix work with df: `df[1,2]`, `df[1:4,]`, ...
- is we access a unique row, we still have a df, not a vector: `df[3,]` returns a dataframe
- however, if we access a column, we get a vector by default: `df[,4]` returns a vector. `df[,4,drop=FALSE]` returns a df with one column
- `$` is used as syntactic sugar: `df$colname` is equivalent to `df[,"colname"]`
- assign a col: `df$c1 <- df$a + df$b` : when adding vectors, R performs recycling if vector is too small. Which means we can easily add a constant to all the values: `df$colname +1`
- remove a col: `df$col <- NULL`
- `df$col >1` returns a vector full of boolean values. This vector can then be used to index the df. Which means, we can filter the df: `df[df$col>1,]`

### merge dataframes

```R
merged <- data.frame(df1, df2, by.x="col1", by.y="col2")
```

## ggplot2

Grammar of graphics is a package to make very advanced plots

### qplot

Qplot (quickplot) allows to make fast plots. Qplot will determine which graph is the most suitable based on the provided data.
Ex:

```R
qplot(
    data=merged,
    x=Internet.users,
    y=Birth.rate,
    color=Region,
    size=I(4),
    shape=I(13),
    alpha=I(0.8)
)

```

### ggplot2

Main function of the package.
Ggplot2 superposes 7 layers that are necessary to render a plot

- Data: the data we want to plot
- Aesthetics: how the data us mapped to the chart (axis, color...)
- Geometries: what form the aesthetics take (line, dot, ...)
- Statistics: transform data to create new data to visualize
- Facets: multiple form of the same chart based on categories
- Coordinates: x,y, polar, zoom level, etc...
- Themes: make the chart pretty

To build a chart, you need at least the first three layers. With ggplot, you define the data and the default aesthetics. Then you add the geometry to get the plot (note that the geometry can overwrite the default aesthetics).

```R
# empty initialisation. Data and aesthetics overwritten in geometry layer
q1 <- ggplot()
q1 + geom_point(data = movies, mapping = aes(x = CriticRating, y = AudienceRating))

# initialisation with data and aesthetics
q1 <- ggplot(data = movies, mapping = aes(x = CriticRating, y = AudienceRating))
q1_alt <- ggplot(data = movies) +
  aes(x = CriticRating, y = AudienceRating)
q1 + geom_point()
#NOTE: we can override the data and mapping in the geom layer even if it was specified
# earlier.


# example with more complete aesthetics
q2 <- ggplot(
  data = movies,
  mapping = aes(x = CriticRating, y = AudienceRating, color = Genre, size = BudgetMillions)
)
q2 + geom_point()


# override aesthetics, we also need to modify the x label for some reason
q2 + geom_point(mapping=aes(x=BudgetMillions)) + xlab("BudgetMillions")

# we can have multiple geometries
q2 + geom_point() + geom_line(alpha = 0.1)


# mapping vs setting
q3 <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating))

## add color: mapping
q3 + geom_point(mapping = aes(color = Genre))

## add color: setting. No use of aes keyword
q3 + geom_point(color = "blue")
```
