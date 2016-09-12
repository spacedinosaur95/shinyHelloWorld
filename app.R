# I am following along with this tutorial (https://www.youtube.com/watch?v=Ido56dwDTg8), lead by Joe Cheng and posted to YouTube by DataScience.LA


# Hello World 

# loading the shiny library 
library(shiny)

# shiny apps have two components: the UI and the server 

# establishing the UI component 
# changing from just a title to having a fluid page
ui <- fluidPage(
  h1("Hello, World!") # changing from just text to having a header
)

# establishing the server component 
server <- function(input, output, session){
}

# calling the shiny app, the UI and the server
shinyApp(ui, server)
