.onAttach <- function(libname, pkgname){
  if(interactive()){
    packageStartupMessage(
      "Don't forget to save the files you edit."
    )
  }
}
