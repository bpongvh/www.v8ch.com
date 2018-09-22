import BlogContainer from "../components/blog/Container";
import DashboardContainer from "../components/dashboard/Container";
import HomeContainer from "../components/home/Container";
import PostAdd from "../components/post/Add";
import PostEdit from "../components/post/Edit";

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
    component: PostAdd,
    name: "postAdd",
    path: "/post/add"
  },
  {
    component: PostEdit,
    name: "postEdit",
    path: "/post/:id/edit"
  }
];

export default routes;
