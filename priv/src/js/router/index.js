import Blog from "../components/blog/Blog";
import DashboardContainer from "../components/dashboard/Container";
import HomeContainer from "../components/home/Container";

const routes = [
  {
    component: HomeContainer,
    name: "home",
    path: "/"
  },
  {
    component: Blog,
    name: "blog",
    path: "/blog"
  },
  {
    component: DashboardContainer,
    name: "dashboard",
    path: "/dashboard"
  }
];

export default routes;
