import actions from "./actions";
import mutations from "./mutations";

const state = { errors: [], tokens: null };

const getters = {};

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
};
