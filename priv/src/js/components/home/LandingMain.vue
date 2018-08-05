<template>
  <div class="main main--dark-background main--hero">
    <div class="main__container">
      <div class="dual-header dual-header--light">
        <h3>Robert Pratt</h3>
        <h5>Full-stack developer</h5>
      </div>
    </div>
    <div class="main__container main__container--center">
      <v8ch-logo :size="logoSize" />
    </div>
    <div class="main__container main__container--bottom">
      <div class="split-header split-header--light">
        <h4>Favor creation</h4>
        <h5>Over consumption</h5>
      </div>
    </div>
  </div>
</template>

<script type="text/babel">
import V8chLogo from '../icons/V8chLogo.vue';

export default {
  components: {
    V8chLogo,
  },

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

<style lang="scss">
</style>
