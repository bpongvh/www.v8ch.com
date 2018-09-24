import VueApollo from "vue-apollo";
import { library } from "@fortawesome/fontawesome-svg-core";
import { faBars, faPlus, faTimes } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import Vue from "vue";
import VueRouter from "vue-router";
import Admin from "./components/Admin";
import Public from "./components/Public";
import apolloProvider from "./graphql/apollo-provider";
import routes from "./router/index";
import store from "./store/index";

// Apollo config
Vue.use(VueApollo);

// Font Awesome config
library.add(faBars, faPlus, faTimes);
Vue.component("font-awesome-icon", FontAwesomeIcon);

// Vue Router config
Vue.use(VueRouter);
const router = new VueRouter({ mode: "history", routes });

new Vue({
  apolloProvider,
  router,
  render: h => {
    const adminPaths = ["/dashboard", "/post/add"];
    if (adminPaths.includes(window.location.pathname)) {
      return h(Admin);
    }
    return h(Public);
  },
  store
}).$mount("#v8ch");
