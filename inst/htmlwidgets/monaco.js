HTMLWidgets.widget({

  name: "monaco",

  type: "output",

  factory: function(el, width, height) {
    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        if(x.theme !== "vs.dark") {
          monaco.editor.defineTheme(x.theme, _MW.themes[x.theme]);
        }
        monaco.editor.setTheme(x.theme);

				var editor = monaco.editor.create(el, {
					value: x.contents.join("\n"),
					language: x.language,
					tabSize: x.tabSize,
          automaticLayout: true
				});

				if(_MW.prettifiable.indexOf(x.language) > -1) {
          editor.addAction(
            _MW.actions.prettifier(x.language, x.tabSize)
          );
				}

      },

      resize: function (width, height) {
        // TODO: code to re-render the widget with a new size
      }
    };
  }
});
