#' Monaco languages
#' @description Get the list of available languages in the Monaco editor.
#'
#' @export
getMonacoLanguages <- function(){
  c("abap", "apex", "bat", "c", "clojure", "coffeescript", "cpp",
    "csharp", "css", "dockerfile", "fsharp", "graphql", "handlebars",
    "html", "ini", "java", "javascript", "json", "julia", "kotlin",
    "less", "lua", "markdown", "mysql", "objective-c", "pascal",
    "perl", "pgsql", "php", "plaintext", "powershell", "pug", "python",
    "r", "razor", "restructuredtext", "ruby", "rust", "scala", "scheme",
    "scss", "shell", "sql", "swift", "tcl", "twig", "typescript",
    "vb", "xml", "yaml")
}

#' Monaco themes
#' @description Get the list of available themes of the Monaco editor. All
#'   themes are dark, excepted \code{"vs"}.
#'
#' @export
getMonacoThemes <- function(){
  c("vs", "vs-dark", "Dark", "AllHallowsEve", "Cobalt", "Merbivore",
    "VibrantInk")
}
