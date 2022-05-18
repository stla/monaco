HTMLWidgets.widget({

  name: "monaco",

  type: "output",

  factory: function(el, width, height) {

    if(HTMLWidgets.shinyMode) {
      $(".monacoWidget").addClass("mWidget");
    }

    var id = $(el).attr("id");
    var slctr_fileName = "#fileName" + id;
    var slctr_modal = "#modal" + id;

    return {

      renderValue: function(x) {

        if(x.header) {
          $(".monacoWidgetHeader").show();
          $(slctr_fileName).text(x.fileName);
        }

        if(x.theme !== "vs-dark" && x.theme !== "vs") {
          monaco.editor.defineTheme(x.theme, _MW.themes[x.theme]);
        }
        monaco.editor.setTheme(x.theme);

				var editor = monaco.editor.create(el, {
					value: x.contents.join("\n"),
					language: x.language,
					tabSize: x.tabSize,
					indentSize: x.tabSize,
          automaticLayout: true,
          fontSize: x.fontSize,
          fontFamily: "Ubuntu Mono"
				});

        _MW.modelValue = editor.getValue();

        if(HTMLWidgets.shinyMode) {
          Shiny.setInputValue(id, editor.getValue());
        }

        editor.addAction(
          _MW.actions.save(x.fileName)
        );

        editor.addAction(
          _MW.actions.bookmark(slctr_fileName)
        );

        editor.addAction(
          _MW.actions.restore(slctr_fileName)
        );

				if(_MW.prettifiable.indexOf(x.language) > -1) {
				  $("#checkbox" + id).show();
          editor.addAction(
            _MW.actions.prettifier(x.language, x.tabSize)
          );
          if(x.language === "markdown") {
            editor.addAction(
              _MW.actions.markdownit(slctr_modal)
            );
            editor.addAction(
              _MW.actions.wordWrap()
            );
          }
				} else if(x.fileExtension === "svg") {
				  $("#checkbox" + id).show();
          editor.addAction(
            _MW.actions.prettifier("svg", x.tabSize)
          );
				  editor.addAction(
				    _MW.actions.svgViewer(slctr_modal)
				  );
				  editor.addAction(
				    _MW.actions.svgScale()
				  );
				} else if(x.language === "plaintext") {
          editor.addAction(
            _MW.actions.wordWrap()
          );
				}

				var model = editor.getModel();
        model.updateOptions({
          tabSize: x.tabSize,
          indentSize: x.tabSize
        });
				model.onDidChangeContent(function(event) {
          $(slctr_fileName).css("font-style", "italic");
          if(HTMLWidgets.shinyMode) {
            Shiny.setInputValue(id, editor.getValue());
          }
        });
        _MW.modelState = editor.saveViewState();


      },

      resize: function (width, height) {
        // TODO: code to re-render the widget with a new size
      }
    };
  }
});
