import Api from "./api";
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
  }
};
