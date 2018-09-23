import Vue from "vue";
import Vuex from "vuex";
import PersistedState from "vuex-persistedstate";
import contact from "./contact/index";
import session from "./session/index";
import { types as contactTypes } from "./contact/mutations";
import { types as sessionTypes } from "./session/mutations";

Vue.use(Vuex);

// Config vuex-persistedstate
const persistedState = PersistedState({
  filter: mutation => {
    switch (mutation.type) {
      case `contact/${contactTypes.SET_IS_CONTACT_SUBMITTED}`:
      case `session/${sessionTypes.SET_TOKENS}`:
        return true;
      default:
        return false;
    }
  },
  paths: ["contact", "session"],
  reducer: state => {
    return Object.assign(
      {},
      {
        contact: { isContactSubmitted: state.contact.isContactSubmitted },
        session: { tokens: state.session.tokens }
      }
    );
  }
});

export default new Vuex.Store({
  modules: { contact, session },
  plugins: [persistedState]
});
