library(monaco)
library(shiny)
library(sass)

ui <- fluidPage(

  uiOutput("style"),

  br(),

  fluidRow(
    column(
      width = 4,
      actionButton("sass", "Compile to CSS", class = "btn-primary btn-block")
    ),
    column(
      width = 8,
      tags$input(type = "range", min = 0, max = 10, step = 0.1)
    )
  ),

  br(),

  fluidRow(
    column(
      width = 6,
      monacoOutput("scss", height = "75vh")
    ),
    column(
      width = 6,
      monacoOutput("css", height = "75vh")
    )
  )
)

server <- function(input, output){

  output[["scss"]] <- renderMonaco({
    monaco(
      system.file(
        "htmlwidgets", "customRangeInput", "customRangeInput.scss",
        package = "monaco"
      )
    )
  })

  css <- eventReactive(input[["sass"]], {
    sass(input[["scss"]])
  })

  output[["css"]] <- renderMonaco({
    monaco(css(), language = "css")
  })

  output[["style"]] <- renderUI({
    tags$head(tags$style(HTML(input[["css"]])))
  })

}

shinyApp(ui, server)


