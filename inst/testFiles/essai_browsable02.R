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
    tags$style(
      HTML(
        ".monaco {position: fixed; height: calc(50vh - 50px); width: 98vw;}"
      )
    ),
    div(
      div(ed1, style="position:fixed; left:1vw; width: 98vw;"),
      div(ed2, style="position:fixed; left:1vw; top: 52vh; width: 98vw;")
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
