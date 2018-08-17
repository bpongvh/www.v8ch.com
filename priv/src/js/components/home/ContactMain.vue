<template>
  <section class="bg-medium">
    <header class="block-header">
      <h2>Contact</h2>
    </header>
    <div
      v-if="!isSubmitted"
      class="block-content block-content--padded"
    >
      <form
        novalidate
        @submit.prevent="onSubmit"
      >
        <div class="form-group">
          <label for="email">Email address</label>
          <input
            id="email"
            v-model="email"
            class="form-control"
            type="email"
          >
          <div class="invalid-feedback">
            Email is required.
          </div>
        </div>
        <div class="form-group">
          <label for="message">Message</label>
          <textarea
            id="message"
            v-model="message"
            class="form-control"
            rows="5"
          />
          <div class="invalid-feedback">
            Message is required.
          </div>
        </div>
        <button
          class="btn btn-block btn-primary"
          type="submit"
        >
          Submit
        </button>
      </form>
    </div>
    <div
      v-else
      class="block-content block-content--padded block-content--vcenter"
    >
      <div class="feedback feedback-dark">
        <v8ch-logo
          color="dark"
          size="x-small"
        />
        <div class="feedback-content">
          <h5>Thank you!</h5>
          <p>I will respond as soon as I can.</p>
        </div>
      </div>
    </div>
    <footer class="site-links">
      <div class="social-icons">
        <github-logo
          size="small"
          @click="viewAtGithub"
        />
        <twitter-logo
          size="small"
          @click="viewAtTwitter"
        />
      </div>
      <v8ch-logotype size="small" />
    </footer>
  </section>
</template>

<script type="text/babel">
import GithubLogo from '../icons/GithubLogo.vue';
import TwitterLogo from '../icons/TwitterLogo.vue';
import V8chLogo from '../icons/V8chLogo.vue';
import V8chLogotype from '../icons/V8chLogotype.vue';
import ApiService from '../../services/api-service';

export default {
  components: {
    GithubLogo,
    TwitterLogo,
    V8chLogo,
    V8chLogotype,
  },

  // ----------------------
  // Data
  // ----------------------

  data() {
    return {
      email: '',
      isSubmitted: false,
      message: '',
    };
  },

  // ----------------------
  // Methods
  // ----------------------

  methods: {
    onSubmit() {
      const post = { email: this.email, message: this.message };
      console.log(`[Contactblock-content] onSubmit() post: ${JSON.stringify(post)}`);
      ApiService.post('/api/v1/contact', post)
        .then(() => { this.isSubmitted = true; });
    },
    viewAtGithub() {
      window.location.href = 'https://github.com/V8CH';
    },
    viewAtTwitter() {
      window.location.href = 'https://twitter.com/bponghneng';
    },
  },
};
</script>

<style lang="scss">
.social-icons {
  & > :not(:last-child) {
    padding: 0 1em 0 0;
  }
}
</style>
