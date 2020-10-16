#' Monaco editor
#' @description Open the Monaco editor.
#'
#' @param contents this can be the path to a file, \code{NULL} to open an
#'   empty editor, or missing to open the file currently open in RStudio
#' @param language the language of the contents; if \code{NULL} and the
#'   contents are read from a file, the mode is guessed from the extension of
#'   the file; run \code{\link{getMonacoLanguages}} to get the list of
#'   available languages
#' @param theme the theme of the editor; run \code{\link{getMonacoThemes}} to
#'   get the list of available themes
#' @param tabSize number of spaces for the indentation (usually \code{2} or
#'   \code{4}); if \code{NULL}, it is set to the one used in RStudio
#' @param width,height dimensions; the default values are nice for usage in
#'   the RStudio viewer pane
#' @param elementId a HTML id for the container; this is useless for common
#'   usage
#'
#' @importFrom htmlwidgets createWidget
#' @importFrom rstudioapi getSourceEditorContext isAvailable getThemeInfo
#' @importFrom tools file_ext
#'
#' @export
#' @examples # in RStudio, `monaco()` opens the current file:
#' monaco()
#'
#' # opens a new JavaScript file:
#' monaco(NULL, language = "javascript")
#'
#' # opens an existing file:
#' monaco(system.file("exampleFiles", "JavaScript.js", package = "monaco"))
#'
#' # try the SVG viewer; you can zoom and pan the image:
#' monaco(system.file("exampleFiles", "react.svg", package = "monaco"))
monaco <- function(
  contents, language = NULL, theme = NULL, tabSize = NULL,
  width = NULL, height = NULL, elementId = NULL
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
  }else if(!is.null(contents) && file.exists(contents)){
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
    fileName = fileName,
    fileExtension = ext
  )

  # create widget
  createWidget(
    name = "monaco",
    x,
    width = width,
    height = height,
    package = "monaco",
    elementId = elementId
  )
}

#' @importFrom htmltools tagList tags
#' @noRd
monaco_html <- function(id, style, class, ...){
  tagList(
    tags$div(
      tags$div(
        id = "modal", class = "modal"
      ),
      tinyCheckbox(
        "checkbox", "bookmark", "Always bookmark before prettifying"
      ),
      tags$span(id = "fileName"),
      tags$div(style = "clear: both;")
    ),
    tags$div(id = id, class = class)
  )
}

#' Shiny bindings for monaco
#'
#' Output and render functions for using monaco within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a monaco
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name monaco-shiny
#'
#' @export
monacoOutput <- function(outputId, width = "100%", height = "400px") {
  htmlwidgets::shinyWidgetOutput(outputId, "monaco", width, height, package = "monaco")
}

#' @rdname monaco-shiny
#' @export
renderMonaco <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) {
    expr <- substitute(expr)
  } # force quoted
  htmlwidgets::shinyRenderWidget(expr, monacoOutput, env, quoted = TRUE)
}
