library(shiny)

# Define UI
ui <- fluidPage(
  titlePanel("My Shiny App"),
  sidebarLayout(
    sidebarPanel(
      h2("Installation"),
      p("Shiny is available on CRAN, so you can install it the usual way from your R console:"),
      code('install.packages("shiny")'),
      img(src = "rstudio.png", width = 200, height = 70),
      br(),
      p("Shiny is a product of", a("RStudio", href = "https://www.rstudio.com/"))
    ),
    mainPanel(
      h1("Introducing Shiny"),
      p("Shiny is a package...."),
      h1("Features"),
      p("- list of features")
    )
  )
)

# Define server
server <- function(input, output) {

}

shinyApp(ui = ui, server = server)
