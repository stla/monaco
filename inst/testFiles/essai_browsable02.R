library(monaco)
library(htmltools)

ed1 <- monaco(
  system.file("exampleFiles", "JavaScript.js", package = "monaco"),
  height = "calc(50vh - 40px)"
)
ed2 <- monaco(
  system.file("exampleFiles", "react.svg", package = "monaco"),
  height = "calc(50vh - 40px)"
)

browsable(
  tagList(
    tags$style(HTML(
      ".editor {",
      "  position: fixed;",
      "  left: 1vw;",
      "  width: 98vw;",
      "}"
    )),
    div(
      div(ed1, class = "editor", style = "bottom: calc(50vh + 5px);"),
      div(ed2, class = "editor", style = "top: calc(50vh + 5px);")
    )
  )
)

#' library(monaco)
#' library(htmltools)
#'
#' ed1 <- monaco(
#'   system.file("exampleFiles", "JavaScript.js", package = "monaco"),
#'   height = "calc(50vh - 40px)"
#' )
#' ed2 <- monaco(
#'   system.file("exampleFiles", "react.svg", package = "monaco"),
#'   height = "calc(50vh - 40px)"
#' )
#'
#' if(interactive()){
#'   browsable(
#'     tagList(
#'       tags$style(HTML(
#'         ".editor {",
#'         "  position: fixed;",
#'         "  left: 1vw;",
#'         "  width: 98vw;",
#'         "}"
#'       )),
#'       div(
#'         div(ed1, class = "editor", style = "bottom: calc(50vh + 5px);"),
#'         div(ed2, class = "editor", style = "top: calc(50vh + 5px);")
#'       )
#'     )
#'   )
#' }
