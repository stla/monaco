library(monaco)
library(htmltools)

ed1 <- monaco(
  system.file("exampleFiles", "JavaScript.js", package = "monaco")
)
ed2 <- monaco(
  system.file("exampleFiles", "react.svg", package = "monaco")
)

browsable(
  tagList(
    div(
      div(ed1, style="position:fixed; left:1vw; right: 51vw;"),
      div(ed2, style="position:fixed; left:51vw; right: 1vw;")
    )
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
#'       tags$style(HTML(".monaco {position: fixed; width: 48vw;}")),
#'       div(
#'         div(ed1, style="position:fixed; left:1vw; width: 48vw;"),
#'         div(ed2, style="position:fixed; left:51vw; width: 48vw;")
#'       )
#'     )
#'   )
#' }
