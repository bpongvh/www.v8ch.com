<template>
  <div>
    <offcanvas @toggle-offcanvas="toggleOffcanvas" :isOffcanvasShowing="isOffcanvasShowing" />
    <router-view />
  </div>
</template>

<script type="text/babel">
import AppContext from "../app-context";
import Home from './home/Home.vue';
import Offcanvas from './Offcanvas.vue';

export default {
  components: { Home, Offcanvas },
  data() {
    return { isOffcanvasShowing: false };
  },
  methods: {
    toggleOffcanvas() {
      this.isOffcanvasShowing = !this.isOffcanvasShowing;
    }
  },  
  mounted() {
    AppContext.$on("toggle-offcanvas", () => {
      this.toggleOffcanvas();
    });
  },
  watch: {
    "$route"() {
      this.isOffcanvasShowing = false;
    }
  }
};
</script>
