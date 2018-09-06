import Blog from "../components/blog/Blog";
import Dashboard from "../components/dashboard/Dashboard";
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
  },
  {
    component: Dashboard,
    name: "dashboard",
    path: "/dashboard"
  }
];

export default routes;
