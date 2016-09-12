# I am following along with this tutorial (https://www.youtube.com/watch?v=Ido56dwDTg8), lead by Joe Cheng and posted to YouTube by DataScience.LA


# Hello World 

# loading the shiny library 
library(shiny)

# shiny apps have two components: the UI and the server 

# establishing the UI component 
# changing from just a title to having a fluid page
# putting in a sidebar into the app
# putting in a main panel into the app
ui <- fluidPage(
  h1("Hello, World!"), # changing from just text to having a header
  # make sidebar panel
  sidebarPanel( 
    # making a dropdown box
    selectInput("dataset", "Choose a dataset:", 
    # put in options for the dropdown box
    choices = ls("package:datasets"), 
    # pre-select a choice for the dropdown box
    selected = "pressure")
  ), 
  # make a main panel
  mainPanel(
    # making tabs to click on to see str, plot, and table each in one tab... "tabset"
    tabsetPanel(
      tabPanel("Str", 
      verbatimTextOutput("dump")
      ), 
      tabPanel("Plot", 
        plotOutput("plot")
        ),
      tabPanel("Table", 
        tableOutput("table")
        )
    )
  )
)

# establishing the server component 
server <- function(input, output, session){
  output$dump <- renderPrint({
    dataset <- get(input$dataset, "package:datasets", inherits = FALSE)
    str(dataset)
  })
  # actually showing plots of the datasets :) 
  output$plot <- renderPlot({
    dataset <- get(input$dataset, "package:datasets", inherits = FALSE)
    plot(dataset)
  })
  # showing the table
  output$table <- renderTable({
    dataset <- get(input$dataset, "package:datasets", inherits = FALSE)
    dataset
  })
}

# calling the shiny app, the UI and the server
shinyApp(ui, server)
