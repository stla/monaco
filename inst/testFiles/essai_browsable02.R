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
  div(
    div(ed1, style="position:fixed; left:1vw; bottom: calc(50vh + 5px); width: 98vw;"),
    div(ed2, style="position:fixed; left:1vw; top: calc(50vh + 5px); width: 98vw;")
  )
)

#' library(monaco)
#' library(htmltools)
#'
#' ed1 <- monaco(
#'   system.file("exampleFiles", "JavaScript.js", package = "monaco")
#' )
#' ed2 <- monaco(
#'   system.file("exampleFiles", "react.svg", package = "monaco")
#' )
#'
#' if(interactive()){
#'   browsable(
#'     tagList(
#'       tags$style(
#'         HTML(
#'           ".monaco {position: fixed; height: calc(50vh - 50px); width: 98vw;}"
#'         )
#'       ),
#'       div(
#'         div(ed1, style="position:fixed; left:1vw; width: 98vw;"),
#'         div(ed2, style="position:fixed; left:1vw; top: 52vh; width: 98vw;")
#'       )
#'     )
#'   )
#' }
