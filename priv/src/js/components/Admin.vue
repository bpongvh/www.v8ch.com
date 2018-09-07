<template>
  <div>
    <offcanvas @toggle-offcanvas="toggleOffcanvas" :isOffcanvasShowing="isOffcanvasShowing" />
    <router-view />
  </div>
</template>

<script type="text/babel">
  import { mapActions, mapState } from "vuex";
  import AppContext from "../app-context";
  import Dashboard from './dashboard/Dashboard.vue';
  import Offcanvas from './Offcanvas.vue';

  export default {
    components: { Dashboard, Offcanvas },
    computed: {
      ...mapState("session", { errors: state => state.errors })
    },
    data() {
      return { isOffcanvasShowing: false };
    },
    methods: {
      ...mapActions("session", ["fetchTokens"]),
      toggleOffcanvas() {
        this.isOffcanvasShowing = !this.isOffcanvasShowing;
      }
    },  
    mounted() {
      if (this.$route.query.code) {
        this.fetchTokens(this.$route.query.code);
      }
      
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
