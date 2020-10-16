library(monaco)
library(htmltools)

ed1 <- monaco(
  system.file("exampleFiles", "JavaScript.js", package = "monaco")
)
ed2 <- monaco(
  system.file("exampleFiles", "react.svg", package = "monaco")
)

browsable(
  div(
    div(ed1, style="position: fixed; left: 1vw; right: 51vw;"),
    div(ed2, style="position: fixed; left: 51vw; right: 1vw;")
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
#'     div(
#'       div(ed1, style="position: fixed; left: 1vw; right: 51vw;"),
#'       div(ed2, style="position: fixed; left: 51vw; right: 1vw;")
#'     )
#'   )
#' }
