# monaco: the Monaco editor as a HTML widget

**Yet another second editor in RStudio.** 

The Monaco editor is the code editor which powers 'VS Code'. It is particularly
well developed for JavaScript. In addition to the built-in features of the 
Monaco editor, the widget allows to prettify multiple languages, to view the 
HTML rendering of Markdown code, and to view and resize SVG images.

![](https://raw.githubusercontent.com/stla/monaco/main/inst/screenshots/monacoJS.gif)

With the help of `htmltools::browsable`, one can open two Monaco editors in the 
RStudio viewer pane:

![](https://raw.githubusercontent.com/stla/monaco/main/inst/screenshots/monacoBrowsable.gif)

The Monaco editor has [many options](https://microsoft.github.io/monaco-editor/api/interfaces/monaco.editor.ieditoroptions.html). 
If you would like some of them to be available in the `monaco` package, please 
fill an issue.

As any HTML widget, the Monaco editor widget can be used in Shiny apps:

![](https://raw.githubusercontent.com/stla/monaco/main/inst/screenshots/customRangeInput.gif)

This app uses the `sass` package to compile some SCSS code to CSS code. It is 
one of the examples provided in the `monaco` package.


### Related projects

- [shinyMonacoEditor](https://github.com/stla/shinyMonacoEditor): the Monaco 
editor in a sophisticated Shiny app. It is more developed than the `monaco` 
widget but using the Shiny app locks RStudio.
- [aceEditor](https://github.com/stla/aceEditor): the Ace editor as a HTML 
widget. 
