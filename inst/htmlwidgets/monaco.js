HTMLWidgets.widget({

  name: "monaco",

  type: "output",

  factory: function(el, width, height) {
    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        monaco.editor.setTheme(x.theme);

				var editor = monaco.editor.create(el, {
					value: x.contents.join("\n"),
					language: x.language,
					tabSize: x.tabSize,
          automaticLayout: true
				});

      },

      resize: function (width, height) {
        // TODO: code to re-render the widget with a new size
      }
    };
  }
});
