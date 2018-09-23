import { mapMutations, mapState } from "vuex";
import { types as sessionMutations } from "../store/session/mutations";
import Offcanvas from "./Offcanvas";

export default {
  computed: {
    ...mapState("session", {
      isOffcanvasShowing: state => state.isOffcanvasShowing
    })
  },
  watch: {
    $route() {
      if (this.isOffcanvasShowing) {
        this.toggleOffcanvas();
      }
    }
  },
  methods: {
    ...mapMutations("session", {
      toggleOffcanvas: sessionMutations.TOGGLE_OFFCANVAS
    })
  },
  render() {
    return (
      <div>
        <Offcanvas
          toggleOffcanvas={this.toggleOffcanvas}
          isOffcanvasShowing={this.isOffcanvasShowing}
        />
        <router-view />
      </div>
    );
  }
};
