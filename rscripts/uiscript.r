library("shiny")
library("tuneR")
library("markdown")
library("shinyjs")

page <-

fluidPage(
        useShinyjs(),
        # Application title
        titlePanel("Be mindfull"),
        
        # Sidebar with a slider input for number of bins
        navlistPanel(
                tabPanel("Well Wishes",
                         mainPanel("We wish you well :)", 
                                   fluidRow(
                                           tags$audio(id = "Audio1", src = "well_wish_5.mp3", 
                                                      type = "audio/mp3", 
                                                      controls = F,
                                                      onplaying = "playCounter('well_5')",
                                                      onpause = "pauseCounter('well_5')",
                                                      onended = "endCounter('well_5)"
                                           )
                                   ), # add js
                                   
                                   fluidRow(
                                           tags$audio(src = "well_wish_10.mp3", 
                                                      type = "audio/mp3", 
                                                      controls = T,
                                                      onplaying = "playCounter('well_10')",
                                                      onpause = "pauseCounter('well_10')",
                                                      onended = "endCounter('well_10)")
                                           )
                                   )
                ),
                
                
                tabPanel("Self kindness",
                         mainPanel("hey this should say the tab title: Self kindness", 
                                   fluidRow(
                                           tags$audio(src = "self_kindness_5.mp3", 
                                                      type = "audio/mp3", 
                                                      controls = T,
                                                      onplaying = "playCounter('self_5')",
                                                      onpause = "pauseCounter('self_5')",
                                                      onended = "endCounter('self_5)"
                                        ) # add js
                                   ),
                                   fluidRow(
                                           tags$audio(src = "self_kindness_10.mp3", 
                                                      type = "audio/mp3", 
                                                      controls = T,
                                                      onplaying = "playCounter('self_10')",
                                                      onpause = "pauseCounter('self_10')",
                                                      onended = "endCounter('self_10)")
                                   )
                         )
                ),
                
                tabPanel("Just breathe and be",
                         mainPanel("hey this should say the tab title: tab 3", 
                                   fluidRow(
                                           tags$audio(src = "NICU_5_mins_Just_breathe_and_be.mp3", 
                                                      type = "audio/mp3", 
                                                      controls = T,
                                                      onended="rscripts/record.R",
                                                      onplaying = "playCounter('breath_5')",
                                                      onpause = "pauseCounter('breath_5')",
                                                      onended = "endCounter('breath_5)")
                                   ), # add js
                                   fluidRow(
                                           tags$audio(src = "NICU_10mins_Just_breathe_and_be.mp3", 
                                                      type = "audio/mp3", 
                                                      controls = T,
                                                      onplaying = "playCounter('breath_10')",
                                                      onpause = "pauseCounter('breath_10')",
                                                      onended = "endCounter('breath_10)")
                                   )
                         )
                ),
                
                tabPanel("Arriving",
                         mainPanel("hey this should say the tab title: tab 4", 
                                   fluidRow(
                                           tags$audio(src = "NICU_Arriving_5min.mp3", 
                                                      type = "audio/mp3", 
                                                      controls = T,
                                                      onplaying = "playCounter('arrive_5')",
                                                      onpause = "pauseCounter('arrive_5')",
                                                      onended = "endCounter('arrive_5)")
                                   ), # add js
                                   fluidRow(
                                           tags$audio(src = "NICU_Arriving_10mins.mp3", 
                                                      type = "audio/mp3", 
                                                      controls = T,
                                                      onplaying = "playCounter('arrive_10')",
                                                      onpause = "pauseCounter('arrive_10')",
                                                      onended = "endCounter('arrive_10)")
                                   )
                         )
                ),
        # THIS LINE IS NEEDED FOR ACCESSING JAVASCRIPT
        mainPanel(
                tags$body(tags$script(src="mycode.js")) #,
                # verbatimTextOutput("results")
        )
        )
)