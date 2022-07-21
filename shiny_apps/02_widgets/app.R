library(shiny)
ui <- fluidPage(
  fluidRow(
    column(2, actionButton("actBtn", "Action Button")),
    column(2, checkboxGroupInput("ckGrp", h3("Check"), choices = list("a" = 1, "b" = 2), selected = 1)),
    column(2, checkboxInput("ckIn", "Solo Check", value = TRUE)),
    column(2, dateInput("dateIn", "Date", value = "2014-11-27")),
    column(2, dateRangeInput("dateRng", "Date range", start = "2012-01-01", end = "2022-12-31", format = "dd/mm/yyyy")),
    column(2, fileInput("upld", "Upload file", multiple = TRUE)),
  ),
  fluidRow(
    column(2, helpText("This is just a helper", "No id associated to it")),
    column(2, numericInput("nIn", "Enter nb", value = 4)),
    column(2, radioButtons("radBtn", "Radio", choices = list("a" = 1, "b" = 2), selected = 1)),
    column(2, selectInput("slctIn", "Select", choices = list("a" = 1, "b" = 2), selected = 1, multiple = TRUE)),
    column(2, sliderInput("sldIn", "Slider", min = 5, max = 15, value = 7, step = 1)),
    column(2, submitButton("Send all values to server")),
  ),
  fluidRow(column(12, textInput("txtIn", "Enter text", value = "", placeholder = "Here")))
)

# ui <- fluidPage(
#   sidebarLayout(
#     sidebarPanel(
#       helpText("Create demographic maps with information", "from the 2010 US Census"),
#       selectInput("slctIn", "Choose a variable to display",
#         choices = list("Percent White" = 1, "Percent Black" = 2, "Percent Hispanic" = 3, "Percent Asian" = 4),
#         selected = 1
#       ),
#       sliderInput("sldIn", "Range of Interest", min = 0, max = 100, value = c(5, 10))
#     ),
#     mainPanel()
#   )
# )

server <- function(input, output) {}

shinyApp(ui = ui, server = server)
