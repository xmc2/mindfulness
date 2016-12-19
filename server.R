
library("shiny")
library("shinyjs")
library("readr")
library("dplyr")
library("googlesheets")
library("lubridate")
library("datasets")
library("googleformr")
library("DT")
<<<<<<< HEAD
# rsconnect::showLogs(streaming = TRUE)
=======
>>>>>>> 19f75c20a2cdff5d04e30913e4377194b57b04ee


source('rscripts/googleauth.R')


# CODE FROM ss

# ENCRYPTION INFORMATION

Logged = FALSE;
Admin = FALSE;
PASSWORD <- data.frame(Name = c("Bob","Matt","Sarah","John","Nattyboh","Johnnyhops","bob"), 
                       Password = c("2fc1c0beb992cd7096975cfebf9d5c3b",  # Bob
                                    "7c1f90bd9bdc70cc059640a7a6209389",  # Matt
                                    "28e5481a80aa2bd18c8cf35d0495980a",  # Sarah
                                    "61409aa1fd47d4a5332de23cbf59a36f",  # John
                                    "25d55ad283aa400af464c76d713c07ad",  # 12345678 
                                    "1de6647f72fe23f908e815385dd6a28a",  # Hopkins
                                    "9f9d51bc70ef21ca5c14f307980a29d8"), # bob
                       Admin = c(0,
                                 0,
                                 0,
                                 0,
                                 1,
                                 0,
                                 0)
)

# Define server logic required to summarize and view the selected dataset


# need a better way to authenticate google sheets.

data <- gs_title("mindfullness")

## mc BELOW functions dealing with javascript


write_date <- function(user, file, action, date, h){
        # Stores data, via a google form, into a google sheet
  ping(c(user, file, action, date, h))
}     


shinyServer(function(input, output, session) {
        ## ss below
        source("rscripts/login.R",  local = TRUE)
        
        ## mc below
        ## ss edited: sourcing the Login.R script grab the username entered into the Login widget 
        output$results = renderPrint({
                as.data.frame(input$plays_r, input$userName)
        })
        
        
        observeEvent(input$plays_r, {
                write_date(user = input$userName[1], file = input$plays_r[1], 
                           action = "play", date = as.character(today()),
                           h = as.character(ymd_hms(now())))
        })
        observeEvent(input$pause_r, {
#           print("In the pause_r")
#           message("In the pause_r_message")
#           message("In the pause_r_warning")
#           cat("Hello world!\n", file = stderr())
#           cat("Hello world!\n", file = stdout())
          
                write_date(user = input$userName[1] , file = input$pause_r[1], 
                           action = "pause", date = as.character(today()),
                           h = as.character(ymd_hms(now())))
        })
        observeEvent(input$end_r, {
#           print("In the end_r")
#           message("In the end_r_message")
#           message("In the end_r_warning")
          
          write_date(user = input$userName[1] , file = input$pause_r[1], 
                     action = "end", date = as.character(today()),
                     h = as.character(ymd_hms(now())))
        })
        
        # ss below
        
        observe({
                if (USER$Logged == TRUE & USER$Admin == 0) {
                  
                        output$obs <- renderUI({ page })
                }
                 if (USER$Logged == TRUE & USER$Admin == 1) {
                          source('rscripts/googlesheet.R')
                          source('rscripts/stats.R')
                   
                         table <- "mindfullness"
                         output$obs <- renderUI({ admin_page })
                         
                              output$responses <- DT::renderDataTable({
                                
                                    saveData <- function(data) {
                                    # Grab the Google Sheet
                                    sheet <- gs_title(table)
                                    # Add the data as a new row
                                    gs_add_row(sheet, input = data)
                                    }
                           
                                    loadData <- function() {
                                    # Grab the Google Sheet
                                    sheet <- gs_title(table)
                                    # Read the data
                                    gs_read_csv(sheet)
                                    }
                          
                           
                              formData <- reactive({
                                  data <- sapply(fields, function(x) input[[x]])
                                  data
                              })
                           
                              input$submit
                              loadData()
                           
                             })   
                           
                 }
        })
        
        ## trying to look at data

        output$generalplot1 <- renderPlot({
          
          # Render first barplot
          barplot(
            bplot,
            col = "steelblue",
            xlab = "File",
            ylab = "Count",
            main = "Total Number of Audio Files Accessed in the Study"
          )
          
        })
        
      output$generalplot2 <- renderPlot({
          
          # Render second barplot
        barplot(
          bplot2,
          col = "darkblue",
          xlab = "File",
          ylab = "Count",
          main = "Total Recorded Activity (Audio Plays & Pauses) from All Patients in the Study"
        )
        
      })
      
      output$generalplot3 <- renderPlot({
        
        # Render second barplot
        barplot(as.matrix(bplot3), beside=TRUE,
                col=rainbow(8),
                legend.text=rownames(bplot3), 
                main = "Total Number Audio Files Accessed for all Patients in Study")
        
      })

      
      output$generalplot4 <- renderPlot({
        
        # Render second barplot
        barplot(as.matrix(bplot4), beside=TRUE,
                col=rainbow(8),
                legend.text=rownames(bplot4),
                main = "Total Number (Audio Plays & Pauses) for all Patients in Study")
        
      })
      
     
      #output$myImage <- renderImage({
        # A temp file to save the output.
        # This file will be removed later by renderImage
       # outfile <- "~/Downloads/Mindfulness3.png"
        
     # }) 
      
      
}) 
        

