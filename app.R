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
    # putting out text output ... needs to be verbatim so it doesn't look like garbage 
    verbatimTextOutput("dump"), 
    # plot the dataset 
    plotOutput("plot")
  )
)

# establishing the server component 
server <- function(input, output, session){
  output$dump <- renderPrint({
    dataset <- get(input$dataset, "package:datasets", inherits = FALSE)
    str(dataset)
  })
}

# calling the shiny app, the UI and the server
shinyApp(ui, server)
