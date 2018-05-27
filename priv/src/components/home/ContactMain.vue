<template>
  <div class="main main--light-background main--framed">
    <div class="main__container">
      <div class="header header--dark">
        <h3>Contact</h3>
      </div>
    </div>
    <div class="main_form-container main__container--margin-bottom">
      <form novalidate>
        <div class="form-group">
          <label
            class="v8ch-dark-green"
            for="email"
          >Email address</label>
          <input
            id="email"
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
      <github-logo size="small" />
      <v8ch-logotype
        size="small"
        @click="viewAtGithub"
      />
    </div>
  </div>
</template>

<script type="text/babel">
import GithubLogo from '../icons/GithubLogo.vue';
import V8chLogotype from '../icons/V8chLogotype.vue';

export default {
  components: {
    GithubLogo,
    V8chLogotype,
  },
};
</script>

<style lang="scss">
</style>
