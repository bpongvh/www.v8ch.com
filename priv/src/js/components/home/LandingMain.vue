<template>
  <section class="bg-dark hero">
    <header class="site-header">
      <dl class="text-light text-right">
        <dd>Robert Pratt</dd>
        <dt>Full-Stack Developer</dt>
      </dl>
    </header>
    <div class="block-content block-content--center">
      <v8ch-logo :size="logoSize" />
    </div>
    <footer class="tagline">
      <p>Favor creation</p>
      <p>over consumption</p>
    </footer>
  </section>
</template>

<script type="text/babel">
import V8chLogo from '../icons/V8chLogo.vue';

export default {
  components: { V8chLogo },

  // ----------------------
  // Data
  // ----------------------

  data() {
    return { logoSize: 'small' };
  },

  // ----------------------
  // Lifecycle
  // ----------------------

  mounted() {
    if (window.matchMedia('(min-width: 768px)').matches) {
      this.logoSize = 'medium';
    }
    if (window.matchMedia('(min-width: 992px)').matches) {
      this.logoSize = 'large';
    }
  },
};
</script>
