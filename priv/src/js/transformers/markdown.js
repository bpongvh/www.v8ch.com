import highlightjs from "highlight.js";
import showdown from "showdown";

showdown.extension("highlightjs", function() {
  // Use Showdown's regexp engine to conditionally parse codeblocks
  const left = "<pre><code\\b[^>]*>";
  const right = "</code></pre>";
  const flags = "g";
  function htmlUnencode(text) {
    return text
      .replace(/&amp;/g, "&")
      .replace(/&lt;/g, "<")
      .replace(/&gt;/g, ">");
  }

  function replacement(_wholeMatch, match, left, right) {
    // Unescape match to prevent double escaping
    match = htmlUnencode(match);
    return left + highlightjs.highlightAuto(match).value + right;
  }

  return [
    {
      type: "output",
      filter: function(text, _converter, _options) {
        return showdown.helper.replaceRecursiveRegExp(
          text,
          replacement,
          left,
          right,
          flags
        );
      }
    }
  ];
});

const ShowdownConverter = () => {
  const converter = new showdown.Converter({ extensions: ["highlightjs"] });
  return converter;
};

export default ShowdownConverter();
