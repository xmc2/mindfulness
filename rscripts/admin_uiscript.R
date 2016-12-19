
library("shiny")
library("markdown")
library("shinyjs")
library("dplyr")

admin_page <-
  
  fluidPage(
    # Application title
    titlePanel("Welcome, Admin"), 
      
        plotOutput("generalplot1"),
        plotOutput("generalplot2"),
        plotOutput("generalplot3"),
        plotOutput("generalplot4")
        ,
        DT::dataTableOutput("responses", width = 300), tags$hr()
      )
      
    



  
