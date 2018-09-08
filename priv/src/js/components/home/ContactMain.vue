<template>
  <section class="bg-medium">
    <header class="content-block-header">
      <h2>Contact</h2>
    </header>
    <div
      v-if="!isContactSubmitted"
      class="content-block content-block--form"
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
      class="content-block content-block--padded content-block--vcenter"
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

  export default {
    components: {
      GithubLogo,
      TwitterLogo,
      V8chLogo,
      V8chLogotype
    },
    data() {
      return {
        email: '',
        message: ''
      };
    },
    methods: {
      onSubmit() {
        const contact = { email: this.email, message: this.message };
        this.$emit("save-contact", contact);
      },
      viewAtGithub() {
        window.location.href = 'https://github.com/V8CH';
      },
      viewAtTwitter() {
        window.location.href = 'https://twitter.com/bponghneng';
      },
    },
    props: { isContactSubmitted: Boolean }
  };
</script>
