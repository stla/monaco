HTMLWidgets.widget({

  name: "monaco",

  type: "output",

  factory: function(el, width, height) {
    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        $("#fileName").text(x.fileName); // italic on change, etc

        if(x.theme !== "vs.dark") {
          monaco.editor.defineTheme(x.theme, _MW.themes[x.theme]);
        }
        monaco.editor.setTheme(x.theme);

				var editor = monaco.editor.create(el, {
					value: x.contents.join("\n"),
					language: x.language,
					tabSize: x.tabSize,
					indentSize: x.tabSize,
          automaticLayout: true
				});

        _MW.modelValue = editor.getValue();

        editor.addAction(
            _MW.actions.save(x.fileName)
        );

        editor.addAction(
            _MW.actions.bookmark()
        );

        editor.addAction(
            _MW.actions.restore()
        );

				if(_MW.prettifiable.indexOf(x.language) > -1) {
				  $("#checkbox").show();
          editor.addAction(
            _MW.actions.prettifier(x.language, x.tabSize)
          );
          if(x.language === "markdown") {
            editor.addAction(
              _MW.actions.markdownit()
            );
          }
				}

				if(x.fileExtension === "svg") {
				  $("#checkbox").show();
          editor.addAction(
            _MW.actions.prettifier("svg", x.tabSize)
          );
				  editor.addAction(
				    _MW.actions.svgViewer()
				  );
				  editor.addAction(
				    _MW.actions.svgScale()
				  );
				}

				var model = editor.getModel();
        model.updateOptions({
          tabSize: x.tabSize,
          indentSize: x.tabSize
        });
				model.onDidChangeContent(function(event) {
          $("#fileName").css("font-style", "italic");
        });
        _MW.modelState = editor.saveViewState();


      },

      resize: function (width, height) {
        // TODO: code to re-render the widget with a new size
      }
    };
  }
});
