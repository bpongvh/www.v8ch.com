import VueApollo from "vue-apollo";
import { ApolloClient } from "apollo-client";
import { HttpLink } from "apollo-link-http";
import { InMemoryCache } from "apollo-cache-inmemory";
import { library } from "@fortawesome/fontawesome-svg-core";
import { faBars, faTimes } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import Vue from "vue";
import VueRouter from "vue-router";
import App from "./components/App.vue";
import Admin from "./components/Admin.vue";
import routes from "./router/index";
import store from "./store/index";

// Apollo config
const httpLink = new HttpLink({ uri: process.env.GRAPHQL_HOST_URI });
const apolloClient = new ApolloClient({
  link: httpLink,
  cache: new InMemoryCache(),
  connectToDevTools: process.env.NODE_ENV !== "production"
});
const apolloProvider = new VueApollo({ defaultClient: apolloClient });
Vue.use(VueApollo);

// Font Awesome config
library.add(faBars, faTimes);
Vue.component("font-awesome-icon", FontAwesomeIcon);

// Vue Router config
Vue.use(VueRouter);
const router = new VueRouter({ mode: "history", routes });

new Vue({
  provide: apolloProvider.provide(),
  router,
  render: h => {
    const adminPaths = ["/dashboard"];
    if (adminPaths.includes(window.location.pathname)) {
      return h(Admin);
    }
    return h(App);
  },
  store
}).$mount("#v8ch");
