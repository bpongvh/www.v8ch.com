import Vue from "vue";
import Vuex from "vuex";
import PersistedState from "vuex-persistedstate";
import session from "./session/index";
import { types as sessionTypes } from "./session/mutations";

Vue.use(Vuex);

// Config vuex-persistedstate
const persistedState = PersistedState({
  filter: mutation => {
    switch (mutation.payload.type) {
      case sessionTypes.SET_TOKENS:
        return true;
      default:
        return false;
    }
  },
  paths: ["session"],
  reducer: state => {
    return Object.assign({}, { session: { tokens: state.session.tokens } });
  }
});

export default new Vuex.Store({
  modules: { session },
  plugins: [persistedState]
});
