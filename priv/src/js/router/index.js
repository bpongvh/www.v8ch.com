import Blog from "../components/blog/Blog";
import Home from "../components/home/Home";

const routes = [
  {
    component: Home,
    name: "home",
    path: "/"
  },
  {
    component: Blog,
    name: "blog",
    path: "/blog"
  }
];

export default routes;
