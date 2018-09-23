import { mapMutations, mapState } from "vuex";
import { types as sessionMutations } from "../store/session/mutations";
export default {
  props: {
    isOffcanvasShowing: {
      required: true,
      type: Boolean
    }
  },
  computed: {
    ...mapState("session", {
      hasTokens: state => !!state.tokens
    })
  },
  methods: {
    ...mapMutations("session", {
      toggleOffcanvas: sessionMutations.TOGGLE_OFFCANVAS
    })
  },
  render() {
    return (
      <div
        class={{
          "offcanvas--showing": this.isOffcanvasShowing,
          "offcanvas text-light": true
        }}
      >
        <nav class="navbar navbar-dark">
          <button onClick={this.toggleOffcanvas} class="navbar-toggler">
            <font-awesome-icon icon="times" />
          </button>
        </nav>
        <nav class="container">
          <ul class="nav">
            {this.hasTokens && (
              <li class="nav-item">
                <router-link class="nav-link" to={{ name: "dashboard" }}>
                  Dashboard
                </router-link>
              </li>
            )}
            <li class="nav-item">
              <router-link class="nav-link" to={{ name: "home" }}>
                Home
              </router-link>
            </li>
            <li class="nav-item">
              <router-link class="nav-link" to={{ name: "blog" }}>
                Blog
              </router-link>
            </li>
          </ul>
        </nav>
      </div>
    );
  }
};
