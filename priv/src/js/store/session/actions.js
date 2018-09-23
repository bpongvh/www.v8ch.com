import Api from "../../services/aws-cognito-authentication";
import { types } from "./mutations";

export default {
  fetchTokens({ commit }, code) {
    Api.postAuthorizationCode(code)
      .then(response => {
        commit({
          tokens: {
            access: response.access_token,
            id: response.id_token,
            refresh: response.refresh_token
          },
          type: types.SET_TOKENS
        });
      })
      .catch(error => {
        commit({ error: error.message, type: types.PUSH_ERROR });
      });
  },
  refreshTokens({ commit, state }) {
    Api.postRefreshToken(state.tokens.refresh)
      .then(response => {
        commit({
          tokens: {
            ...state.tokens,
            access: response.access_token,
            id: response.id_token
          },
          type: types.SET_TOKENS
        });
        return Promise.resolve();
      })
      .catch(error => {
        commit({ error: error.message, type: types.PUSH_ERROR });
        return Promise.reject();
      });
  }
};
