#' Monaco editor
#' @description Open the Monaco editor.
#'
#' @param contents this can be the path to a file, \code{NULL} to open an
#'   empty editor, or missing to open the file currently open in RStudio
#' @param language the language of the contents; if \code{NULL} and the
#'   contents are read from a file, the mode is guessed from the extension of
#'   the file; run \code{\link{getMonacoLanguages}} to get the list of
#'   available languages
#' @param theme the theme of the editor; run \code{\link{getAceThemes}} to get
#'   the list of available themes
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
#' monaco(NULL, mode = "javascript")
#'
#' # opens an existing file:
#' monaco(system.file("htmlwidgets", "monaco.js", package = "monaco"))
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
      theme <- ifelse(dark, "hc-black", "xx")
    }else{
      theme <- "hc-black"
    }
  }else{
    if(!is.element(theme, getMonacoThemes())){
      message(
        "This theme is not available.",
        "Run `getMonacoThemes()` to get the list of available themes."
      )
      theme <- "hc-black"
    }
  }

  fileName <- NULL

  if(missing(contents)){
    if(isAvailable()){
      context <- getSourceEditorContext()
      contents <- context[["contents"]]
      if(is.null(language)){
        ext <- file_ext(context[["path"]])
        mode <- languageFromExtension(ext)
      }
      fileName <- basename(context[["path"]])
    }else{
      contents <- ""
    }
  }else if(!is.null(contents) && file.exists(contents)){
    ext <- file_ext(contents)
    if(tolower(ext) %in% binaryExtensions){
      stop("Cannot open this type of files.")
    }
    if(is.null(language)){
      language <- languageFromExtension(ext)
      fileName <- basename(contents)
    }
    contents <- suppressWarnings(readLines(contents))
  }
  if(is.null(language)){
    language <- "plaintext"
  }
  if(is.null(fileName)){
    fileName <- "untitled"
  }

  # forward options using x
  x <- list(
    contents = contents,
    language = language,
    tabSize = tabSize,
    fileName = fileName
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

# #' @import htmltools
# monaco_html <- function(id, style, class, ...){
#   tagList(
#     tags$div(id = id, class = class),
#     tags$script(HTML('var require = {paths: {vs: "monaco-editor/min/vs"}};')),
#     htmlDependency(
#       "empty",
#       version = "0.0.0",
#       src = "htmlwidgets",
#       package = "monaco"
#     ),
#     includeScript(system.file("htmlwidgets", "monaco-editor", "loader.js", package = "monaco"))
#   )
# }

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
