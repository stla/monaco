library(monaco)
library(shiny)

ui <- fluidPage(
  monacoOutput("ed", height = "400px")
)

server <- function(input, output){

  output[["ed"]] <- renderMonaco({
    monaco(
      system.file("exampleFiles", "react.svg", package = "monaco")
    )
  })

  observeEvent(input[["ed"]], {
    print(input[["ed"]])
  })

}

shinyApp(ui, server)


#' library(monaco)
#' library(shiny)
#'
#' ui <- fluidPage(
#'   monacoOutput("ed", height = "400px")
#' )
#'
#' server <- function(input, output){
#'
#'   output[["ed"]] <- renderMonaco({
#'     monaco(
#'       system.file("exampleFiles", "JavaScript.js", package = "monaco")
#'     )
#'   })
#'
#' }
#'
#' if(interactive()){
#'   shinyApp(ui, server)
#' }
