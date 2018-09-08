<template>
  <div>
    <offcanvas @toggle-offcanvas="toggleOffcanvas" :isOffcanvasShowing="isOffcanvasShowing" />
    <router-view />
  </div>
</template>

<script type="text/babel">
import {mapMutations, mapState} from "vuex";
import { types as sessionMutations } from "../store/session/mutations";
import Home from './home/Home.vue';
import Offcanvas from './Offcanvas.vue';

export default {
  components: { Home, Offcanvas },
  computed: {...mapState("session", {isOffcanvasShowing: (state) => state.isOffcanvasShowing})},
  methods: { ...mapMutations("session", {toggleOffcanvas: sessionMutations.TOGGLE_OFFCANVAS}) }, 
  watch: {
    "$route"() {
      if (this.isOffcanvasShowing) {
        this.toggleOffcanvas();
      }
    }
  }
};
</script>
