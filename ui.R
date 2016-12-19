
source('rscripts/user_uiscript.r')
source('rscripts/admin_uiscript.r')


shinyUI(bootstrapPage(
  
  # titlePanel("JHU Mindfulness Web App"),
  # Add custom CSS & Javascript;
  tagList(
    tags$head(
      tags$link(rel="stylesheet", type="text/css",href="style.css"),
      tags$script(type="text/javascript", src = "md5.js"),
      tags$script(type="text/javascript", src = "passwdInputBinding.js"),
      
      includeCSS("styles.css"),
  
      headerPanel("JHU Mindfulness Web App"),
      
      inputPanel(
        img(src='Mindfulness2.png')
        ### the rest of your code
      )
),
  


  
  ## Login module;
  div(class = "login",
      uiOutput("uiLogin"),
      textOutput("pass")
  ), 
  
  div(class = "span4", uiOutput("obs")),
  div(class = "span8", plotOutput("distPlot"))
  
      )
  
  )
)
