import actions from "./actions";
import mutations from "./mutations";

const getters = {};

const state = { errors: [], isOffcanvasShowing: false, tokens: null };

export default {
  actions,
  getters,
  mutations,
  namespaced: true,
  state
};
