getwd()

movies <- read.csv("P2-Movie-Ratings.csv", stringsAsFactors = TRUE)
head(movies)
str(movies)
summary(movies)
colnames(movies) <-
  c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")

movies$Year <- factor(movies$Year)

library(ggplot2)



# empty initialisation. Data and aesthetics overwritten in geometry layer
q1 <- ggplot()
q1 +
  geom_point(data = movies, mapping = aes(x = CriticRating, y = AudienceRating))

# initialisation with data and aesthetics
q1 <- ggplot(data = movies, mapping = aes(x = CriticRating, y = AudienceRating))
q1_alt <- ggplot(data = movies) +
  aes(x = CriticRating, y = AudienceRating)
q1 + geom_point()

# add color and size
q2 <- ggplot(
  data = movies,
  mapping = aes(x = CriticRating, y = AudienceRating, color = Genre, size = BudgetMillions)
)
q2 + geom_point()

# geometries
q2 + geom_point() + geom_line(alpha = 0.1, size = 1)

# override aesthetics, we also need to modify the x label
q2 + geom_point(mapping = aes(x = BudgetMillions)) + xlab("BudgetMillions")

# mapping vs setting

q3 <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating))

## add color: mapping
q3 + geom_point(mapping = aes(color = Genre))

## add color: setting
q3 + geom_point(color = "blue")

## histograms
q4 <- ggplot(data = movies, mapping = aes(x = BudgetMillions))
q4 + geom_histogram(binwidth = 10, color = "black", mapping = aes(fill = Genre))

## density chart
q4 + geom_density(aes(fill = Genre), position = "stack")

## statistical layer

### smoothing
q5 <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, color = Genre))
q5 + geom_point() + geom_smooth(fill = NA)

### boxplots
q6 <- ggplot(data = movies, aes(x = Genre, y = AudienceRating, color = Genre))
q6 + geom_boxplot(size = 1.2) + geom_jitter(alpha = 0.2)


## facets
q7 <- ggplot(data = movies, aes(x = BudgetMillions))

# one chart with everything, not easy to read
q7 + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black")



# one graph per Genre
q7 + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black") +
  facet_grid(Genre ~ .)

# one graph per Genre and Year
q7 + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black") +
  facet_grid(Genre ~ Year)

# scatter plot per year
q8 <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, color = Genre))
q8 + geom_point(size = 3) + facet_grid(. ~ Year)

q8 + geom_point(aes(size = BudgetMillions)) + geom_smooth() + facet_grid(Genre ~ Year)
