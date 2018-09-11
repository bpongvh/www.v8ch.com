<template>
  <nav :class="{'navbar-dark': isDark}" class="fixed-top navbar">
      <button @click="toggleOffcanvas" class="navbar-toggler">
        <font-awesome-icon icon="bars" />
      </button>
  </nav>
</template>

<script type="text/babel">
import {mapMutations} from "vuex";
import { types as sessionMutations } from "../../store/session/mutations";

export default {
  methods: { ...mapMutations("session", {toggleOffcanvas: sessionMutations.TOGGLE_OFFCANVAS}) },
  props: { isDark: Boolean }
};
</script>
