#' Monaco editor
#' @description Open the Monaco editor.
#'
#' @param contents this can be the path to a file, \code{NULL} to open an
#'   empty editor, missing to open the file currently open in RStudio, or a
#'   character vector which corresponds to the lines of a file
#' @param language the language of the contents; if \code{NULL} and the
#'   contents are read from a file, the mode is guessed from the extension of
#'   the file; run \code{\link{getMonacoLanguages}} to get the list of
#'   available languages
#' @param theme the theme of the editor; run \code{\link{getMonacoThemes}} to
#'   get the list of available themes
#' @param tabSize number of spaces for the indentation (usually \code{2} or
#'   \code{4}); if \code{NULL}, it is set to the one used in RStudio
#' @param fontSize font size in pixels
#' @param header logical, whether to display the header of the widget
#' @param width,height dimensions; the default values are nice for usage in
#'   the RStudio viewer pane
#' @param elementId a HTML id for the container; this is useless for common
#'   usage
#'
#' @importFrom htmlwidgets createWidget
#' @importFrom rstudioapi getSourceEditorContext isAvailable getThemeInfo
#' @importFrom tools file_ext
#' @importFrom shiny isRunning
#'
#' @export
#' @examples # in RStudio, `monaco()` opens the current file:
#' monaco()
#'
#' # opens a new, empty JavaScript file:
#' monaco(NULL, language = "javascript")
#'
#' # opens an existing file:
#' monaco(system.file("exampleFiles", "JavaScript.js", package = "monaco"))
#'
#' # try the SVG viewer; you can zoom and pan the image:
#' monaco(system.file("exampleFiles", "react.svg", package = "monaco"))
#'
#' # a dirty Markdown file, try to prettify it:
#' monaco(system.file("exampleFiles", "Markdown.md", package = "monaco"))
#'
#'
#' # opens two editors side-by-side:
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
#'
#'
#' # stacks two editors:
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
monaco <- function(
  contents, language = NULL, theme = NULL, tabSize = NULL, fontSize = 14,
  header = TRUE, width = NULL, height = NULL, elementId = NULL
) {

  if(!is.null(language) && !is.element(language, getMonacoLanguages())){
    message(
      "Invalid `language` argument.",
      "Run `getMonacoLanguages()` to get the list of available languages."
    )
  }

  if(is.null(theme)){
    if(isAvailable()){
      dark <- getThemeInfo()[["dark"]]
      theme <- ifelse(dark, "Dark", "vs")
    }else{
      theme <- "Dark"
    }
  }else{
    if(!is.element(theme, getMonacoThemes())){
      message(
        "This theme is not available.",
        "Run `getMonacoThemes()` to get the list of available themes."
      )
      theme <- "Dark"
    }
  }

  fileName <- NULL
  ext <- "txt"

  if(missing(contents)){
    if(isAvailable()){
      context <- getSourceEditorContext()
      contents <- context[["contents"]]
      if(is.null(language)){
        ext <- file_ext(context[["path"]])
        language <- languageFromExtension(ext)
      }
      fileName <- basename(context[["path"]])
    }else{
      contents <- ""
    }
  }else if(length(contents) == 1L && file.exists(contents)){
    ext <- tolower(file_ext(contents))
    if(ext %in% binaryExtensions){
      stop("Cannot open this type of files.")
    }
    fileName <- basename(contents)
    if(is.null(language)){
      language <- languageFromExtension(ext)
    }
    contents <- suppressWarnings(readLines(contents))
  }
  if(ext == "svg"){
    language <- "xml"
  }else if(is.null(language)){
    language <- "plaintext"
  }
  if(is.null(fileName)){
    ext <- extensionFromLanguage(language)
    fileName <- paste0("untitled.", ext)
  }
  if(is.null(tabSize)){
    tabSize <- getTabSize()
  }

  # forward options using x
  x <- list(
    contents = as.list(contents),
    language = language,
    theme = theme,
    tabSize = tabSize,
    fontSize = fontSize,
    header = header,
    fileName = fileName,
    fileExtension = ext
  )

  # create widget
  if(!isRunning() && is.null(elementId)){
    elementId <- paste0("MW", randomString(15))
  }
  createWidget(
    name = "monaco",
    x,
    width = ifelse(is.null(width), "100%", width),
    height = ifelse(is.null(height), "calc(100vh - 50px)", height),
    package = "monaco",
    elementId = elementId
  )
}

#' @importFrom htmltools tagList tags
#' @noRd
widget_html.monaco <- function(id, style, class, ...){
  tags$div(
    class = "monacoWidget",
    tagList(
      tags$div(
        id = paste0("modal", id), class = "modal markdown-body"
      ),
      tags$div(
        class = "monacoWidgetHeader",
        tinyCheckbox(
          paste0("checkbox", id), paste0("bookmark", id),
          "Always bookmark before prettifying"
        ),
        tags$span(id = paste0("fileName", id)),
        tags$div(style = "clear: both;")
      ),
      tags$div(id = id, class = class, style = style)
    )
  )
}

#' Shiny bindings for Monaco editor
#'
#' Output and render functions for using Monaco editors within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height CSS measurements like \code{"100\%"},
#'   \code{"400px"}, \code{"auto"}, or a number, which will be coerced to a
#'   string and have \code{"px"} appended
#' @param expr an expression that creates a Monaco editor with
#'   \code{\link{monaco}}
#' @param env the environment in which to evaluate \code{expr}
#' @param quoted logical, whether \code{expr} is a quoted expression
#'
#' @name monaco-shiny
#'
#' @importFrom htmlwidgets shinyWidgetOutput shinyRenderWidget
#' @export
#'
#' @examples library(monaco)
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
#'
#'
#' # Customizing the input range, using the 'sass' package ####
#'
#' library(monaco)
#' library(shiny)
#' library(sass)
#'
#' ui <- fluidPage(
#'
#'   uiOutput("style"),
#'
#'   titlePanel("Customized range input"),
#'
#'   fluidRow(
#'     column(
#'       width = 4,
#'       actionButton("sass", "Compile to CSS", class = "btn-primary btn-block")
#'     ),
#'     column(
#'       width = 8,
#'       tags$input(type = "range", min = 0, max = 10, step = 0.1)
#'     )
#'   ),
#'
#'   br(),
#'
#'   fluidRow(
#'     column(
#'       width = 6,
#'       monacoOutput("scss", height = "75vh")
#'     ),
#'     column(
#'       width = 6,
#'       monacoOutput("css", height = "75vh")
#'     )
#'   )
#' )
#'
#' server <- function(input, output){
#'
#'   output[["scss"]] <- renderMonaco({
#'     monaco(
#'       system.file(
#'         "htmlwidgets", "customRangeInput", "customRangeInput.scss",
#'         package = "monaco"
#'       ),
#'       header = FALSE
#'     )
#'   })
#'
#'   css <- eventReactive(input[["sass"]], {
#'     sass(input[["scss"]])
#'   })
#'
#'   output[["css"]] <- renderMonaco({
#'     monaco(css(), language = "css", header = FALSE)
#'   })
#'
#'   output[["style"]] <- renderUI({
#'     tags$head(tags$style(HTML(input[["css"]])))
#'   })
#'
#' }
#'
#' if(interactive()){
#'   shinyApp(ui, server)
#' }
monacoOutput <- function(outputId, width = "100%", height = "400px") {
  shinyWidgetOutput(outputId, "monaco", width, height, package = "monaco")
}

#' @rdname monaco-shiny
#' @export
renderMonaco <- function(expr, env = parent.frame(), quoted = FALSE) {
  if(!quoted) {
    expr <- substitute(expr)
  } # force quoted
  shinyRenderWidget(expr, monacoOutput, env, quoted = TRUE)
}
