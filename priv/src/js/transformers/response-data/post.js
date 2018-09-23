import DOMPurify from "dompurify";
import moment from "moment";
import markdownTransformer from "../markdown";

export default function(postResponseJson) {
  const html = markdownTransformer.makeHtml(postResponseJson.content);
  return {
    content: {
      html: DOMPurify.sanitize(html),
      markdown: postResponseJson.content
    },
    published: moment().format("ll"),
    id: postResponseJson.id,
    title: postResponseJson.title
  };
}
