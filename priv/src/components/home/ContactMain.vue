<template>
  <div class="main main--light-background main--framed">
    <div class="main__container">
      <div class="header header--dark">
        <h3>Contact</h3>
      </div>
    </div>
    <div class="main_form-container main__container--margin-bottom">
      <form
        novalidate
        @submit.prevent="onSubmit"
      >
        <div class="form-group">
          <label
            class="v8ch-dark-green"
            for="email"
          >Email address</label>
          <input
            id="email"
            v-model="email"
            class="form-control"
            placeholder="Email address"
            type="email"
          >
          <div class="invalid-feedback">
            Email is required.
          </div>
        </div>
        <div class="form-group">
          <label
            class="v8ch-dark-green"
            for="message"
          >Message</label>
          <textarea
            id="message"
            v-model="message"
            class="form-control"
            rows="5"
            placeholder="Message"
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
    <div class="main__container main__container--space-between">
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
    </div>
  </div>
</template>

<script type="text/babel">
import GithubLogo from '../icons/GithubLogo.vue';
import TwitterLogo from '../icons/TwitterLogo.vue';
import V8chLogotype from '../icons/V8chLogotype.vue';
import ApiService from '../../services/api-service';

export default {
  components: {
    GithubLogo,
    TwitterLogo,
    V8chLogotype,
  },

  // ----------------------
  // Data
  // ----------------------

  data() {
    return {
      email: '',
      message: '',
    };
  },

  // ----------------------
  // Methods
  // ----------------------

  methods: {
    onSubmit() {
      const post = { email: this.email, message: this.message };
      console.log(`[ContactMain] onSubmit() post: ${JSON.stringify(post)}`);
      ApiService.post('/api/v1/contact', post);
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
