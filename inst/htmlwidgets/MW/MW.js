var _MW = {
  modelState: null,
  modelValue: "",
  prettifiable: [
    "css",
    "html",
    "javascript",
    "markdown",
    "scss",
    "typescript",
    "yaml"
  ],
  themes: {
    Cobalt: {
      base: "vs-dark",
      inherit: true,
      rules: [
        {
          background: "001B33",
          token: ""
        },
        {
          foreground: "e1efff",
          token:
            "punctuation - (punctuation.definition.string || punctuation.definition.comment)"
        },
        {
          foreground: "ff628c",
          token: "constant"
        },
        {
          foreground: "ffdd00",
          token: "entity"
        },
        {
          foreground: "ff9d00",
          token: "keyword"
        },
        {
          foreground: "ffee80",
          token: "storage"
        },
        {
          foreground: "3ad900",
          token: "string -string.unquoted.old-plist -string.unquoted.heredoc"
        },
        {
          foreground: "3ad900",
          token: "string.unquoted.heredoc string"
        },
        {
          foreground: "0088ff",
          fontStyle: "italic",
          token: "comment"
        },
        {
          foreground: "80ffbb",
          token: "support"
        },
        {
          foreground: "cccccc",
          token: "variable"
        },
        {
          foreground: "ff80e1",
          token: "variable.language"
        },
        {
          foreground: "ffee80",
          token: "meta.function-call"
        },
        {
          foreground: "f8f8f8",
          background: "800f00",
          token: "invalid"
        },
        {
          foreground: "ffffff",
          background: "223545",
          token: "text source"
        },
        {
          foreground: "ffffff",
          background: "223545",
          token: "string.unquoted.heredoc"
        },
        {
          foreground: "ffffff",
          background: "223545",
          token: "source source"
        },
        {
          foreground: "80fcff",
          fontStyle: "italic",
          token: "entity.other.inherited-class"
        },
        {
          foreground: "9eff80",
          token: "string.quoted source"
        },
        {
          foreground: "80ff82",
          token: "string constant"
        },
        {
          foreground: "80ffc2",
          token: "string.regexp"
        },
        {
          foreground: "edef7d",
          token: "string variable"
        },
        {
          foreground: "00ff00",
          token: "string"
        },
        {
          foreground: "ffb054",
          token: "support.function"
        },
        {
          foreground: "eb939a",
          token: "support.constant"
        },
        {
          foreground: "ff1e00",
          token: "support.type.exception"
        },
        {
          foreground: "8996a8",
          token: "meta.preprocessor.c"
        },
        {
          foreground: "afc4db",
          token: "meta.preprocessor.c keyword"
        },
        {
          foreground: "73817d",
          token: "meta.sgml.html meta.doctype"
        },
        {
          foreground: "73817d",
          token: "meta.sgml.html meta.doctype entity"
        },
        {
          foreground: "73817d",
          token: "meta.sgml.html meta.doctype string"
        },
        {
          foreground: "73817d",
          token: "meta.xml-processing"
        },
        {
          foreground: "73817d",
          token: "meta.xml-processing entity"
        },
        {
          foreground: "73817d",
          token: "meta.xml-processing string"
        },
        {
          foreground: "9effff",
          token: "meta.tag"
        },
        {
          foreground: "9effff",
          token: "meta.tag entity"
        },
        {
          foreground: "9effff",
          token: "meta.selector.css entity.name.tag"
        },
        {
          foreground: "ffb454",
          token: "meta.selector.css entity.other.attribute-name.id"
        },
        {
          foreground: "5fe461",
          token: "meta.selector.css entity.other.attribute-name.class"
        },
        {
          foreground: "9df39f",
          token: "support.type.property-name.css"
        },
        {
          foreground: "f6f080",
          token: "meta.property-group support.constant.property-value.css"
        },
        {
          foreground: "f6f080",
          token: "meta.property-value support.constant.property-value.css"
        },
        {
          foreground: "f6aa11",
          token: "meta.preprocessor.at-rule keyword.control.at-rule"
        },
        {
          foreground: "edf080",
          token: "meta.property-value support.constant.named-color.css"
        },
        {
          foreground: "edf080",
          token: "meta.property-value constant"
        },
        {
          foreground: "eb939a",
          token: "meta.constructor.argument.css"
        },
        {
          foreground: "f8f8f8",
          background: "000e1a",
          token: "meta.diff"
        },
        {
          foreground: "f8f8f8",
          background: "000e1a",
          token: "meta.diff.header"
        },
        {
          foreground: "f8f8f8",
          background: "4c0900",
          token: "markup.deleted"
        },
        {
          foreground: "f8f8f8",
          background: "806f00",
          token: "markup.changed"
        },
        {
          foreground: "f8f8f8",
          background: "154f00",
          token: "markup.inserted"
        },
        {
          background: "8fddf630",
          token: "markup.raw"
        },
        {
          background: "004480",
          token: "markup.quote"
        },
        {
          background: "130d26",
          token: "markup.list"
        },
        {
          foreground: "c1afff",
          fontStyle: "bold",
          token: "markup.bold"
        },
        {
          foreground: "b8ffd9",
          fontStyle: "italic",
          token: "markup.italic"
        },
        {
          foreground: "c8e4fd",
          background: "001221",
          fontStyle: "bold",
          token: "markup.heading"
        }
      ],
      colors: {
        "editor.foreground": "#FFFFFF",
        "editor.background": "#002240",
        "editor.selectionBackground": "#B36539BF",
        "editor.lineHighlightBackground": "#00000059",
        "editorCursor.foreground": "#FFFFFF",
        "editorWhitespace.foreground": "#FFFFFF26",
        "editorGutter.background": "#001B33"
      }
    },
    Dark: {
      base: "hc-black",
      inherit: true,
      rules: [
        {
          background: "161920"
        },
        {
          fontStyle: "bold",
          token: "keyword"
        }
      ],
      colors: {
        "editorIndentGuide.background": "#ffffff50",
        "editorGutter.background": "#19197040"
      }
    },
    AllHallowsEve: {
      base: "vs-dark",
      inherit: true,
      rules: [
        {
          background: "000000",
          token: ""
        },
        {
          foreground: "ffffff",
          background: "434242",
          token: "text"
        },
        {
          foreground: "ffffff",
          background: "000000",
          token: "source"
        },
        {
          foreground: "9933cc",
          token: "comment"
        },
        {
          foreground: "3387cc",
          token: "constant"
        },
        {
          foreground: "cc7833",
          token: "keyword"
        },
        {
          foreground: "d0d0ff",
          token: "meta.preprocessor.c"
        },
        {
          fontStyle: "italic",
          token: "variable.parameter"
        },
        {
          foreground: "ffffff",
          background: "9b9b9b",
          token: "source comment.block"
        },
        {
          foreground: "66cc33",
          token: "string"
        },
        {
          foreground: "aaaaaa",
          token: "string constant.character.escape"
        },
        {
          foreground: "000000",
          background: "cccc33",
          token: "string.interpolated"
        },
        {
          foreground: "cccc33",
          token: "string.regexp"
        },
        {
          foreground: "cccc33",
          token: "string.literal"
        },
        {
          foreground: "555555",
          token: "string.interpolated constant.character.escape"
        },
        {
          fontStyle: "underline",
          token: "entity.name.type"
        },
        {
          fontStyle: "italic underline",
          token: "entity.other.inherited-class"
        },
        {
          fontStyle: "underline",
          token: "entity.name.tag"
        },
        {
          foreground: "c83730",
          token: "support.function"
        },
        {
          foreground: "FFA500",
          token: "delimiter"
        },
        {
          foreground: "FFA500",
          token: "delimiter.html"
        }
      ],
      colors: {
        "editor.foreground": "#FFFFFF",
        "editor.background": "#000000",
        "editor.selectionBackground": "#73597EE0",
        "editor.lineHighlightBackground": "#333300",
        "editorCursor.foreground": "#FFFFFF",
        "editorWhitespace.foreground": "#404040",
        "editorIndentGuide.background": "#ffffff50",
        "editorGutter.background": "#19197040"
      }
    },
    Merbivore: {
      base: "vs-dark",
      inherit: true,
      rules: [
        {
          background: "161616",
          token: ""
        },
        {
          foreground: "ad2ea4",
          fontStyle: "italic",
          token: "comment"
        },
        {
          foreground: "fc6f09",
          token: "keyword"
        },
        {
          foreground: "fc6f09",
          token: "storage"
        },
        {
          foreground: "fc83ff",
          token: "entity.other.inherited-class"
        },
        {
          foreground: "58c554",
          token: "constant.numeric"
        },
        {
          foreground: "1edafb",
          token: "constant"
        },
        {
          foreground: "8dff0a",
          token: "constant.library"
        },
        {
          foreground: "fc6f09",
          token: "support.function"
        },
        {
          foreground: "fdc251",
          token: "constant.language"
        },
        {
          foreground: "8dff0a",
          token: "string"
        },
        {
          foreground: "1edafb",
          token: "support.type"
        },
        {
          foreground: "8dff0a",
          token: "support.constant"
        },
        {
          foreground: "fc6f09",
          token: "meta.tag"
        },
        {
          foreground: "fc6f09",
          token: "declaration.tag"
        },
        {
          foreground: "fc6f09",
          token: "entity.name.tag"
        },
        {
          foreground: "ffff89",
          token: "entity.other.attribute-name"
        },
        {
          foreground: "ffffff",
          background: "990000",
          token: "invalid"
        },
        {
          foreground: "519f50",
          token: "constant.character.escaped"
        },
        {
          foreground: "519f50",
          token: "constant.character.escape"
        },
        {
          foreground: "519f50",
          token: "string source"
        },
        {
          foreground: "519f50",
          token: "string source.ruby"
        },
        {
          foreground: "e6e1dc",
          background: "144212",
          token: "markup.inserted"
        },
        {
          foreground: "e6e1dc",
          background: "660000",
          token: "markup.deleted"
        },
        {
          background: "2f33ab",
          token: "meta.diff.header"
        },
        {
          background: "2f33ab",
          token: "meta.separator.diff"
        },
        {
          background: "2f33ab",
          token: "meta.diff.index"
        },
        {
          background: "2f33ab",
          token: "meta.diff.range"
        },
        {
          foreground: "FFD700",
          token: "delimiter"
        },
        {
          foreground: "FFD700",
          token: "delimiter.html"
        }
      ],
      colors: {
        "editor.foreground": "#E6E1DC",
        "editor.background": "#161616",
        "editor.selectionBackground": "#454545",
        "editor.lineHighlightBackground": "#333435",
        "editorCursor.foreground": "#FFFFFF",
        "editorWhitespace.foreground": "#404040",
        "editorIndentGuide.background": "#ffffff50",
        "editorGutter.background": "#19197040"
      }
    },
    VibrantInk: {
      base: "vs-dark",
      inherit: true,
      rules: [
        {
          background: "000000",
          token: ""
        },
        {
          foreground: "ffffff",
          background: "0f0f0f",
          token: "text"
        },
        {
          background: "000000",
          token: "source.ruby.rails.embedded.html"
        },
        {
          foreground: "ffffff",
          background: "101010",
          token: "text.html.ruby"
        },
        {
          foreground: "ccff33",
          token: "constant.numeric.ruby"
        },
        {
          foreground: "ffffff",
          background: "000000",
          token: "source"
        },
        {
          foreground: "9933cc",
          token: "comment"
        },
        {
          foreground: "339999",
          token: "constant"
        },
        {
          foreground: "ff6600",
          token: "keyword"
        },
        {
          foreground: "edf8f9",
          token: "keyword.preprocessor"
        },
        {
          foreground: "ffffff",
          token: "keyword.preprocessor directive"
        },
        {
          foreground: "ffcc00",
          token: "entity.name.function"
        },
        {
          foreground: "ffcc00",
          token: "storage.type.function.js"
        },
        {
          fontStyle: "italic",
          token: "variable.parameter"
        },
        {
          foreground: "772cb7",
          background: "070707",
          token: "source comment.block"
        },
        {
          foreground: "ffffff",
          token: "variable.other"
        },
        {
          foreground: "999966",
          token: "support.function.activerecord.rails"
        },
        {
          foreground: "66ff00",
          token: "string"
        },
        {
          foreground: "aaaaaa",
          token: "string constant.character.escape"
        },
        {
          foreground: "000000",
          background: "cccc33",
          token: "string.interpolated"
        },
        {
          foreground: "44b4cc",
          token: "string.regexp"
        },
        {
          foreground: "cccc33",
          token: "string.literal"
        },
        {
          foreground: "555555",
          token: "string.interpolated constant.character.escape"
        },
        {
          fontStyle: "underline",
          token: "entity.name.class"
        },
        {
          fontStyle: "underline",
          token: "support.class.js"
        },
        {
          fontStyle: "italic underline",
          token: "entity.other.inherited-class"
        },
        {
          foreground: "ff6600",
          token: "meta.tag.inline.any.html"
        },
        {
          foreground: "ff6600",
          token: "meta.tag.block.any.html"
        },
        {
          foreground: "99cc99",
          fontStyle: "italic",
          token: "entity.other.attribute-name"
        },
        {
          foreground: "dde93d",
          token: "keyword.other"
        },
        {
          foreground: "ff6600",
          token: "meta.selector.css"
        },
        {
          foreground: "ff6600",
          token: "entity.other.attribute-name.pseudo-class.css"
        },
        {
          foreground: "ff6600",
          token: "entity.name.tag.wildcard.css"
        },
        {
          foreground: "ff6600",
          token: "entity.other.attribute-name.id.css"
        },
        {
          foreground: "ff6600",
          token: "entity.other.attribute-name.class.css"
        },
        {
          foreground: "999966",
          token: "support.type.property-name.css"
        },
        {
          foreground: "ffffff",
          token: "keyword.other.unit.css"
        },
        {
          foreground: "ffffff",
          token: "constant.other.rgb-value.css"
        },
        {
          foreground: "ffffff",
          token: "constant.numeric.css"
        },
        {
          foreground: "ffffff",
          token: "support.function.event-handler.js"
        },
        {
          foreground: "ffffff",
          token: "keyword.operator.js"
        },
        {
          foreground: "cccc66",
          token: "keyword.control.js"
        },
        {
          foreground: "ffffff",
          token: "support.class.prototype.js"
        },
        {
          foreground: "ff6600",
          token: "object.property.function.prototype.js"
        },
        {
          foreground: "FFBF00",
          token: "delimiter"
        },
        {
          foreground: "FFBF00",
          token: "delimiter.html"
        }
      ],
      colors: {
        "editor.foreground": "#FFFFFF",
        "editor.background": "#000000",
        "editor.selectionBackground": "#35493CE0",
        "editor.lineHighlightBackground": "#333300",
        "editorCursor.foreground": "#FFFFFF",
        "editorWhitespace.foreground": "#404040",
        "editorIndentGuide.background": "#ffffff50",
        "editorGutter.background": "#19197040"
      }
    }
  }, // end of 'themes'
  // functions
  utf8_to_base64: function (str) {
    // https://stackoverflow.com/questions/30106476/using-javascripts-atob-to-decode-base64-doesnt-properly-decode-utf-8-strings
    return btoa(unescape(encodeURIComponent(str)));
  },
  prettify: function (code, parser, tabSize) {
    var prettyCode = null,
      error = null;
    try {
      prettyCode = prettier.format(code, {
        parser: parser,
        plugins: prettierPlugins,
        trailingComma: "none",
        tabWidth: tabSize,
        printWidth: 80
      });
    } catch (err) {
      error = err.message;
    }
    return { prettyCode: prettyCode, error: error };
  },
  markdownit: function (code) {
    var html = null,
      error = null;
    try {
      var md = window.markdownit({
        html: true,
        linkify: true,
        typographer: true
      });
      html = md.render(code);
    } catch (err) {
      error = err.message.replace(/[\u00A0-\u9999<>\&]/gim, function (i) {
        return "&#" + i.charCodeAt(0) + ";";
      });
    }
    return { html: html, error: error };
  },
  // end of functions
  actions: {
    save: function (fileName) {
      return {
        id: "save",
        label: "Save",
        keybindings: [monaco.KeyMod.CtrlCmd | monaco.KeyCode.KEY_S],
        precondition: null,
        keybindingContext: null,
        contextMenuGroupId: "navigation",
        contextMenuOrder: 0,
        run: function (ed) {
          var a = document.createElement("a");
          document.body.append(a);
          a.download = fileName;
          a.href =
            "data:text/plain;base64," + _MW.utf8_to_base64(ed.getValue());
          a.click();
          a.remove();
          return null;
        }
      };
    },
    bookmark: function (slctr) {
      return {
        id: "bookmark",
        label: "Bookmark",
        keybindings: [monaco.KeyMod.CtrlCmd | monaco.KeyCode.KEY_B],
        precondition: null,
        keybindingContext: null,
        contextMenuGroupId: "navigation",
        contextMenuOrder: 1.5,
        run: function (ed) {
          _MW.modelValue = ed.getValue();
          _MW.modelState = ed.saveViewState();
          $(slctr).css("font-style", "normal");
          return null;
        }
      };
    },
    restore: function (slctr) {
      return {
        id: "restore",
        label: "Restore",
        keybindings: [monaco.KeyMod.CtrlCmd | monaco.KeyCode.KEY_R],
        precondition: null,
        keybindingContext: null,
        contextMenuGroupId: "navigation",
        contextMenuOrder: 1.5,
        run: function (ed) {
          ed.setValue(_MW.modelValue);
          ed.restoreViewState(_MW.modelState);
          ed.focus();
          $(slctr).css("font-style", "normal");
          return null;
        }
      };
    },
    prettifier: function (language, tabSize, label) {
      if (typeof label === "undefined") {
        label = "Prettify";
      }
      var parser;
      switch (language) {
        case "css":
          parser = "css";
          break;
        case "html":
          parser = "html";
          break;
        case "javascript":
          parser = "babel";
          break;
        case "markdown":
          parser = "markdown";
          break;
        case "scss":
          parser = "css";
          break;
        case "svg":
          parser = "html";
          break;
        case "typescript":
          parser = "typescript";
          break;
        case "yaml":
          parser = "yaml";
          break;
      }
      return {
        id: "prettifier",
        label: label,
        precondition: null,
        keybindingContext: null,
        contextMenuGroupId: "navigation",
        contextMenuOrder: 1.5,
        run: function (ed) {
          var bookmark = $("#bookmark").prop("checked");
          if (bookmark) {
            _MW.modelValue = ed.getValue();
            _MW.modelState = ed.saveViewState();
          }
          var result = _MW.prettify(ed.getValue(), parser, tabSize);
          if (result.error === null) {
            ed.setValue(result.prettyCode);
          } else {
            Swal.fire({
              icon: "error",
              title: "Something went wrong!",
              html: "<pre>" + result.error + "</pre>",
              width: "100%"
            });
          }
          return null;
        }
      };
    },
    markdownit: function (slctr) {
      return {
        id: "markdownit",
        label: "View HTML",
        precondition: null,
        keybindingContext: null,
        contextMenuGroupId: "navigation",
        contextMenuOrder: 1.5,
        run: function (ed) {
          var result = _MW.markdownit(ed.getValue());
          if (result.error === null) {
            $(slctr).html(result.html).modal({
              fadeDuration: 500,
              closeClass: "icon-close",
              closeText: "&times;"
            });
          } else {
            Swal.fire({
              icon: "error",
              title: "Something went wrong!",
              html: "<pre>" + result.error + "</pre>",
              width: "100%"
            });
          }
          return null;
        }
      };
    },
    svgViewer: function (slctr) {
      return {
        id: "svgViewer",
        label: "View SVG image",
        precondition: null,
        keybindingContext: null,
        contextMenuGroupId: "navigation",
        contextMenuOrder: 1.5,
        run: function (ed) {
          var svg = ed.getValue();
          var error = null;
          try {
            var json = SVGparse.parse(svg);
          } catch (err) {
            error = err.message.replace(/[\u00A0-\u9999<>\&]/gim, function (i) {
              return "&#" + i.charCodeAt(0) + ";";
            });
          }
          if (error === null) {
            $(slctr).html(svg).modal({
              fadeDuration: 500,
              closeClass: "icon-close",
              closeText: "&times;"
            });
            panzoom(document.querySelector(slctr));
          } else {
            Swal.fire({
              icon: "error",
              title: "Something went wrong!",
              html: "<pre>" + error + "</pre>",
              width: "100%"
            });
          }
          return null;
        }
      };
    },
    svgScale: function () {
      return {
        id: "svgScale",
        label: "Scale that SVG",
        precondition: null,
        keybindingContext: null,
        contextMenuGroupId: "navigation",
        contextMenuOrder: 1.5,
        run: function (ed) {
          var svg = ed.getValue();
          var error = null;
          try {
            var json = SVGparse.parse(svg);
          } catch (err) {
            error = err.message.replace(/[\u00A0-\u9999<>\&]/gim, function (i) {
              return "&#" + i.charCodeAt(0) + ";";
            });
          }
          if (error === null) {
            (async () => {
              const { value: factor } = await Swal.fire({
                title: "Scaling factor?",
                icon: "question",
                input: "range",
                inputLabel: "Check the image after scaling!",
                inputAttributes: {
                  min: 0.1,
                  max: 10,
                  step: 0.1
                },
                inputValue: 1
              });
              scaleSVG(svg, { scale: factor }).then(function (scaledSVG) {
                ed.setValue(scaledSVG);
              });
            })();
          } else {
            Swal.fire({
              icon: "error",
              title: "Something went wrong!",
              html: "<pre>" + error + "</pre>",
              width: "100%"
            });
          }
          return null;
        }
      };
    },
    wordWrap: function () {
      return {
        id: "wordWrap",
        label: "Wrap (80 characters)",
        precondition: null,
        keybindingContext: null,
        contextMenuGroupId: "navigation",
        contextMenuOrder: 1.5,
        run: function (ed) {
          var result = wordWrap(ed.getValue(), {
            width: 80,
            indent: ""
          });
          ed.setValue(result);
          return null;
        }
      };
    }
  } // end of 'actions'
};
