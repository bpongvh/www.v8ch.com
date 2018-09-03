import DOMPurify from "dompurify";
import moment from "moment";
import markdown from "../markdown";

export default function(postResponseJson) {
  const html = markdown.makeHtml(postResponseJson.content);
  return {
    content: DOMPurify.sanitize(html),
    published: moment().format("ll"),
    id: postResponseJson.id,
    title: postResponseJson.title
  };
}
