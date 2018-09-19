<template>
  <nav :class="{'navbar-dark': isDark}" class="fixed-top navbar">
      <button @click="closeOverlay" class="navbar-toggler" v-if="isOverlay">
        <font-awesome-icon icon="times" />
      </button>
      <button @click="toggleOffcanvas" class="navbar-toggler" v-else>
        <font-awesome-icon icon="bars" />
      </button>
  </nav>
</template>

<script type="text/babel">
import {mapMutations} from "vuex";
import { types as sessionMutations } from "../../store/session/mutations";

export default {
  computed: {
    isOverlay() {
      return this.type === "overlay"
    }
  },
  methods: { ...mapMutations("session", {toggleOffcanvas: sessionMutations.TOGGLE_OFFCANVAS}) },
  props: {
    closeOverlay: {
      required: false,
      type: Function
    },
    isDark: Boolean,
    type: {
      required: false,
      type: String
    }
  }
};
</script>
