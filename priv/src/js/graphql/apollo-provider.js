import { ApolloClient } from "apollo-client";
import { ApolloLink } from "apollo-link";
import { setContext } from "apollo-link-context";
import { onError } from "apollo-link-error";
import { createHttpLink } from "apollo-link-http";
import { InMemoryCache } from "apollo-cache-inmemory";
import VueApollo from "vue-apollo";
import store from "../store/index";

const authLink = setContext((_request, prevContext) => {
  return {
    ...prevContext,
    headers: addAuthorizationHeader(prevContext.headers)
  };
});
const errorLink = onError(
  ({ forward, graphQLErrors, networkError, operation }) => {
    if (graphQLErrors) {
      for (let error of graphQLErrors) {
        switch (error.message) {
          case "TOKEN_EXPIRED":
            store.dispatch("session/refreshTokens").then(() => {
              const prevContext = operation.getContext();
              operation.setContext({
                ...prevContext,
                headers: addAuthorizationHeader(prevContext.headers)
              });
              return forward(operation);
            });
          default:
            console.error(
              `[apollo-provider] GraphQL Error: ${JSON.stringify(error)}`
            );
        }
      }
    }
    if (networkError) {
      console.error(`[apollo-provider] Network Error: ${networkError}`);
    }
  }
);
const httpLink = createHttpLink({ uri: process.env.GRAPHQL_HOST_URI });

const apolloClient = new ApolloClient({
  link: ApolloLink.from([authLink, errorLink, httpLink]),
  cache: new InMemoryCache(),
  connectToDevTools: process.env.NODE_ENV !== "production"
});
const apolloProvider = new VueApollo({ defaultClient: apolloClient });

function addAuthorizationHeader(headers) {
  return {
    ...headers,
    authorization: getAuthorizationHeader()
  };
}

function getAuthorizationHeader() {
  const token = store.state.session.tokens
    ? store.state.session.tokens.access
    : null;
  return token ? `Bearer ${token}` : "";
}

export default apolloProvider;
