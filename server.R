
library("shiny")
library("shinyjs")
library("readr")
library("dplyr")
library("googlesheets")
library("lubridate")
library("datasets")
library("googleformr")
library("DT")

source('rscripts/googleauth.R')
source('rscripts/stats.R')

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
        source("rscripts/Login.R",  local = TRUE)
        
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
                write_date(user = input$userName[1] , file = input$pause_r[1], 
                           action = "pause", date = as.character(today()),
                           h = as.character(ymd_hms(now())))
        })
        observeEvent(input$end_r, {
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
                         table <- "mindfullness"
                         output$obs <- renderUI({ admin_page })
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
          main = "Total Number of Clicks from All Patients in the Study"
        )
        
      })
      
      output$generalplot3 <- renderPlot({
        
        # Render second barplot
        barplot(
          bplot3,
          col = c("darkblue", "red", "purple", "cyan", "blue", "green", "yellow", "magenta"),
          xlab = "Date",
          ylab = "Count",
          main = "Total Number of Audio Files Accessed from All Patients per Day"
        )
        legend("topright",legend=paste(c("Arrive_5", "Arrive_10", "Breath_10", "Breath_5", "Self_10", "Self_5", "Well_10", "Well_5")),
               col= c("darkblue","red", "purple", "cyan", "blue", "green", "yellow", "magenta"), pch=rep(3,8), 
               bty="n",ncol=1,cex=0.7)
      })

      
      output$generalplot4 <- renderPlot({
        
        # Render second barplot
        barplot(
          bplot4,
          col = c("darkblue", "red", "purple", "cyan", "blue", "green", "yellow", "magenta"),
          xlab = "Date",
          ylab = "Count",
          main = "Total Number of Clicks on from All Patients per Day"
        )
        legend("topright",legend=paste(c("Arrive_5", "Arrive_10", "Breath_10", "Breath_5", "Self_10", "Self_5", "Well_10", "Well_5")),
               col= c("darkblue","red", "purple", "cyan", "blue", "green", "yellow", "magenta"), pch=rep(3,8), 
               bty="n",ncol=1,cex=0.7)
      })
      
      output$responses <- DT::renderDataTable({
        #source("rscripts/admin_table.R",  local = TRUE)
        
        #*****
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
        #*****
        
        formData <- reactive({
          data <- sapply(fields, function(x) input[[x]])
          data
        })
        
        input$submit
        loadData()
      }) 
      
      #output$myImage <- renderImage({
        # A temp file to save the output.
        # This file will be removed later by renderImage
       # outfile <- "~/Downloads/Mindfulness3.png"
        
     # }) 
      
      
}) 

