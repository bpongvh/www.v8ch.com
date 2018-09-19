import BlogContainer from "../components/blog/Container";
import DashboardContainer from "../components/dashboard/Container";
import HomeContainer from "../components/home/Container";
import PostAdd from "../components/post/Add";
import PostContainer from "../components/post/Container";

const routes = [
  {
    component: HomeContainer,
    name: "home",
    path: "/"
  },
  {
    component: BlogContainer,
    name: "blog",
    path: "/blog"
  },
  {
    component: DashboardContainer,
    name: "dashboard",
    path: "/dashboard"
  },
  {
    component: PostContainer,
    name: "posts",
    path: "/post"
  },
  {
    component: PostAdd,
    name: "postAdd",
    path: "/post/add"
  }
];

export default routes;
