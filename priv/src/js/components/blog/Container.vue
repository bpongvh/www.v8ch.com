<template>
  <div>
    <topbar @toggle-offcanvas="toggleOffcanvas" theme="light" />
    <header class="section-header">
      <ul class="keyword-list text-dark text-right">
        <li>
          <span class="keyword-list__term">V8CH</span>
          <span class="keyword-list__definition">Blog</span>
        </li>
      </ul>
    </header>
    <main class="blog container">
      <article class="blog-post" :key="index" v-for="(post, index) in posts">
        <header class="article-header">
          <div class="article-header__kicker">
            <h5>{{post.published}}</h5>
          </div>
          <h2>
            {{post.title}}
          </h2>
        </header>
        <section class="post-content" v-html="post.content" />
      </article>
    </main>
  </div>
</template>

<script type="text/babel">
  import gql from "graphql-tag";
  import moment from "moment";
  import {mapMutations} from "vuex";
  import Topbar from "../shared/Topbar";
  import { types as sessionMutations } from "../../store/session/mutations";
  import postResponseTransformer from "../../transformers/response-data/post";

  export default {
    apollo: {
      postsResponse: {
        query: gql`{posts { content id insertedAt title }}`,
        update(response) {
          return response.posts;
        }
      }
    },
    components: { Topbar },
    computed: {
      posts() {
        return this.postsResponse ? this.postsResponse.map(post => postResponseTransformer(post)) : null;
      }
    },
    methods: {
      ...mapMutations("session", {toggleOffcanvas: sessionMutations.TOGGLE_OFFCANVAS})
    }
  }
</script>
