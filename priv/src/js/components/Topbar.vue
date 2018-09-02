<template>
  <nav :class="{'navbar-dark': isDark}" class="fixed-top navbar">
      <button @click="toggleOffcanvas" class="navbar-toggler">
        <font-awesome-icon icon="bars" />
      </button>
  </nav>
</template>

<script type="text/babel">
import AppContext from "../app-context";

export default {
  methods: {
    toggleOffcanvas() {
      AppContext.$emit("toggle-offcanvas");
    }
  },
  props: { isDark: Boolean }
};
</script>
