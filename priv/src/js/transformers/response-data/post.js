import DOMPurify from "dompurify";
import moment from "moment";
import showdown from "showdown";

export default function(postResponseJson) {
  const converter = new showdown.Converter();
  const html = converter.makeHtml(postResponseJson.content);
  return {
    content: DOMPurify.sanitize(html),
    published: moment().format("ll"),
    id: postResponseJson.id,
    title: postResponseJson.title
  };
}
