library(monaco)
library(htmltools)

ed1 <- monaco(
  system.file("exampleFiles", "JavaScript.js", package = "monaco"),
  width = NULL)
ed2 <- monaco(system.file("exampleFiles", "react.svg", package = "monaco"),
              width = NULL)

browsable(
  tagList(
    tags$style(HTML(".monaco {position: fixed; width: 48vw;}")),
    div(
      style = "position:absolute; top:0;",
      div(ed1, style="position:fixed; left:1vw;"),
      div(ed2, style="position:fixed; left:51vw;")
    )
  )
)
