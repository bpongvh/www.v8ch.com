import DOMPurify from "dompurify";
import moment from "moment";
import markdownTransformer from "../markdown";

export default function(postResponseJson) {
  const html = markdownTransformer.makeHtml(postResponseJson.content);
  return {
    content: DOMPurify.sanitize(html),
    published: moment().format("ll"),
    id: postResponseJson.id,
    title: postResponseJson.title
  };
}
