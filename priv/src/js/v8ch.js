import VueApollo from "vue-apollo";
import { ApolloClient } from "apollo-client";
import { HttpLink } from "apollo-link-http";
import { InMemoryCache } from "apollo-cache-inmemory";
import Vue from "vue";
import App from "./components/App.vue";

// Apollo config
const httpLink = new HttpLink({
  uri: process.env.GRAPHQL_HOST_URI
});
const apolloClient = new ApolloClient({
  link: httpLink,
  cache: new InMemoryCache(),
  connectToDevTools: process.env.NODE_ENV !== "production"
});
const apolloProvider = new VueApollo({ defaultClient: apolloClient });
Vue.use(VueApollo);

new Vue({
  provide: apolloProvider.provide(),
  render: h => h(App)
}).$mount("#v8ch");
