
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
                         output$obs <- renderUI({ admin_page })
                 }
        })
}) 



