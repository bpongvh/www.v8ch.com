import { mapMutations } from "vuex";
import Topbar from "../shared/Topbar";
import queries from "../../graphql/queries";
import { types as sessionMutations } from "../../store/session/mutations";
import postResponseTransformer from "../../transformers/response-data/post";

export default {
  apollo: {
    postsResponse: {
      query: queries.LIST_POSTS,
      update(response) {
        return response.posts;
      }
    }
  },
  computed: {
    posts() {
      return this.postsResponse
        ? this.postsResponse.map(post => postResponseTransformer(post))
        : null;
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
        <Topbar toggleOffcanvas={this.toggleOffcanvas} theme="light" />
        <header class="section-header">
          <ul class="keyword-list text-dark text-right">
            <li>
              <span class="keyword-list__term">V8CH</span>
              <span class="keyword-list__definition">Blog</span>
            </li>
          </ul>
        </header>
        <main class="blog container">
          {this.posts &&
            this.posts.map(post => (
              <article class="blog-post" key={post.id}>
                <header class="article-header">
                  <div class="article-header__kicker">
                    <h5>{post.published}</h5>
                  </div>
                  <h2>{post.title}</h2>
                </header>
                <section class="post-content" v-html="post.content.html" />
              </article>
            ))}
        </main>
      </div>
    );
  }
};
