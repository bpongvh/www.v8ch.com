<template>
  <div>
    <offcanvas @toggle-offcanvas="toggleOffcanvas" :isOffcanvasShowing="isOffcanvasShowing" />
    <router-view v-if="isAuthenticated" />
  </div>
</template>

<script type="text/babel">
  import { mapActions, mapMutations, mapState } from "vuex";
  import { types as sessionMutations } from "../store/session/mutations";
  import Offcanvas from './Offcanvas.vue';

  export default {
    components: { Offcanvas },
    computed: {
      ...mapState("session", {
        errors: state => state.errors,
        isAuthenticated: state => !!state.tokens,
        isOffcanvasShowing: state => state.isOffcanvasShowing
      }
    )},
    methods: {
      ...mapActions("session", ["fetchTokens"]),
      ...mapMutations("session", {toggleOffcanvas: sessionMutations.TOGGLE_OFFCANVAS})
    },  
    mounted() {
      // Authentication checks
      // Handles case of redirect to /dashboard on login
      if (this.$route.query.code && !this.isAuthenticated) {
        this.fetchTokens(this.$route.query.code);
      }
      // Handles case of redirect direct navigation and not authenticated
      if (!this.$route.query.code && !this.isAuthenticated) {
        window.location.href = `${window.location.origin}/login`;
      }
    },
    watch: {
      "$route"() {
        if (this.isOffcanvasShowing) {
          this.toggleOffcanvas();
        }
      }
    }
  };
</script>
