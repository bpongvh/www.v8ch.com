import Vue from "vue";
import Vuex from "vuex";
import session from "./session/index";

Vue.use(Vuex);

export default new Vuex.Store({ modules: { session } });
