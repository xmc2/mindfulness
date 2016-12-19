
library("shiny")
library("tuneR")
library("markdown")
library("shinyjs")


subIntro <- function(test) {
  paste(
    "Please see below for two audiofiles reguarding ", test,
    ".  The first is about five minutes while the second is about 10.",
    sep = ""
  ) %>%
    p()
}



page <-
  
  fluidPage(
    useShinyjs(),
    # Application title
    titlePanel("Be Mindful"),
    
    # Sidebar with a slider input for number of bins
    navlistPanel(
      tabPanel(
        "Well Wishes",
        mainPanel(
          h3("We wish you well"),
          subIntro("Well Wishes"),
          h4("5 Minute:"),
          fluidRow(
            tags$audio(
              id = "Audio1", src = "well_wish_5.mp3",
              type = "audio/mp3",
              controls = F,
              onplaying = "playCounter('well_5')",
              onpause = "pauseCounter('well_5')",
              onended = "endCounter('well_5')"
            )
          ), # add js
          br(),
          h4("10 Minute:"),
          fluidRow(
            tags$audio(
              src = "well_wish_10.mp3",
              type = "audio/mp3",
              controls = T,
              onplaying = "playCounter('well_10')",
              onpause = "pauseCounter('well_10')",
              onended = "endCounter('well_10')"
            )
          )
        )
      ),
      
      
      tabPanel("Self kindness",
               mainPanel(
                 h3("Kindness to yourself is great"),
                 subIntro("Self kindness"),
                 h4("5 Minute:"),
                 fluidRow(
                   tags$audio(
                     src = "self_kindness_5.mp3",
                     type = "audio/mp3",
                     controls = T,
                     onplaying = "playCounter('self_5')",
                     onpause = "pauseCounter('self_5')",
                     onended = "endCounter('self_5)"
                   ) # add js
                 ),
                 br(),
                 h4("10 Minute:"),
                 fluidRow(
                   tags$audio(
                     src = "self_kindness_10.mp3",
                     type = "audio/mp3",
                     controls = T,
                     onplaying = "playCounter('self_10')",
                     onpause = "pauseCounter('self_10')",
                     onended = "endCounter('self_10)"
                   )
                 )
               )),
      
      tabPanel("Just breathe and be",
               mainPanel(
                 h3("Breath in and out"),
                 subIntro("Just breathe and be"),
                 h4("5 Minute:"),
                 fluidRow(
                   tags$audio(
                     src = "NICU_5_mins_Just_breathe_and_be.mp3",
                     type = "audio/mp3",
                     controls = T,
                     onended = "rscripts/record.R",
                     onplaying = "playCounter('breath_5')",
                     onpause = "pauseCounter('breath_5')",
                     onended = "endCounter('breath_5)"
                   )
                 ), # add js
                 br(),
                 h4("10 Minute:"),
                 fluidRow(
                   tags$audio(
                     src = "NICU_10mins_Just_breathe_and_be.mp3",
                     type = "audio/mp3",
                     controls = T,
                     onplaying = "playCounter('breath_10')",
                     onpause = "pauseCounter('breath_10')",
                     onended = "endCounter('breath_10)"
                   )
                 )
               )),
      
      tabPanel("Arriving",
               mainPanel(
                 h3("Almost there"),
                 subIntro("Arriving"),
                 h4("5 Minute:"),                 
                 fluidRow(
                   tags$audio(
                     src = "NICU_Arriving_5min.mp3",
                     type = "audio/mp3",
                     controls = T,
                     onplaying = "playCounter('arrive_5')",
                     onpause = "pauseCounter('arrive_5')",
                     onended = "endCounter('arrive_5)"
                   )
                 ), # add js
                 br(),
                 h4("10 Minute:"),
                 fluidRow(
                   tags$audio(
                     src = "NICU_Arriving_10mins.mp3",
                     type = "audio/mp3",
                     controls = T,
                     onplaying = "playCounter('arrive_10')",
                     onpause = "pauseCounter('arrive_10')",
                     onended = "endCounter('arrive_10)"
                   )
                 )
               )),
      tabPanel("GIFs",
               mainPanel(
                 h3("Destress Here"),
                 fluidRow(
                   tags$img(
                     src = "giphy.gif",
                     alt = "Awesome gif"
                   )
                 ) # add js
               )),
      # THIS LINE IS NEEDED FOR ACCESSING JAVASCRIPT
      mainPanel(tags$body(tags$script(src = "mycode.js")) #,
                # verbatimTextOutput("results"))
      )
    )
    #,
    
    #inputPanel(
    #  img(src='Mindfulness3.jpg')
      ### the rest of your code
    #)
  )