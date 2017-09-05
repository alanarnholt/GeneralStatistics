ui <- fluidPage(
  titlePanel("Monty Hall Generalization"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Run a Monty Hall like simulation"),
      
    numericInput(inputId = "n", label = "Number of Doors:", value = 3, min = 3, max = 20),
    numericInput(inputId = "N", label = "Number of games:", value = 1, min = 1, max = 100000),
    selectInput(inputId = "strat", label = "Choose a strategy:", 
                choices = c("stay", "random", "switch"), selected = "stay"),
    selectInput(inputId = "print_games", label = "Print Games:", 
                choices = c(FALSE, TRUE), selected = FALSE)
    ),
    
    mainPanel(
      textOutput("something"),
      tableOutput("percentwin")
    )
  )
)

server <- function(input, output) {
 
  
   
  winnings <- reactive({
    data.frame(
      Your = c("Percent Winnings"),
      Value = "33%"
    )
  })
  
  output$something <- renderText({
    paste("After playing", input$N, "games with", input$n, "doors using a", input$strat, "strategy,")
  })
  
  output$percentwin <- renderTable({
    winnings()
  })
  
}

shinyApp(ui = ui, server = server)


