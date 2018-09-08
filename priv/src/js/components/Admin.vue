<template>
  <div>
    <offcanvas @toggle-offcanvas="toggleOffcanvas" :isOffcanvasShowing="isOffcanvasShowing" />
    <router-view />
  </div>
</template>

<script type="text/babel">
  import { mapActions, mapMutations, mapState } from "vuex";
  import { types as sessionMutations } from "../store/session/mutations";
  import Dashboard from './dashboard/Dashboard.vue';
  import Offcanvas from './Offcanvas.vue';

  export default {
    components: { Dashboard, Offcanvas },
    computed: {
      ...mapState("session", {
        errors: state => state.errors,
        isOffcanvasShowing: state => state.isOffcanvasShowing,
        tokens: state => state.tokens }
    )},
    data() {
      return { isOffcanvasShowing: false };
    },
    methods: {
      ...mapActions("session", ["fetchTokens"]),
      ...mapMutations("session", {toggleOffcanvas: sessionMutations.TOGGLE_OFFCANVAS})
    },  
    mounted() {
      // Handles case of redirect to /dashboard on login
      if (this.$route.query.code & !this.tokens) {
        this.fetchTokens(this.$route.query.code);
      }
      
      AppContext.$on("toggle-offcanvas", () => {
        this.toggleOffcanvas();
      });
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
