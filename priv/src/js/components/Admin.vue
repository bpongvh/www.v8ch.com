<template>
  <div>
    <offcanvas @toggle-offcanvas="toggleOffcanvas" :isOffcanvasShowing="isOffcanvasShowing" />
    <router-view />
  </div>
</template>

<script type="text/babel">
import AppContext from "../app-context";
import Dashboard from './dashboard/Dashboard.vue';
import Offcanvas from './Offcanvas.vue';

export default {
  components: { Dashboard, Offcanvas },
  data() {
    return { isOffcanvasShowing: false };
  },
  methods: {
    toggleOffcanvas() {
      this.isOffcanvasShowing = !this.isOffcanvasShowing;
    }
  },  
  mounted() {
    console.log(`[Dashboard] mounted() this.$route.query: ${JSON.stringify(this.$route.query)}`);
    
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
