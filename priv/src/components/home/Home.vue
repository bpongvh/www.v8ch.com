<template>
  <div>
    <landing-main />
    <skills-main />
    <projects-main />
  </div>
</template>

<script type="text/babel">
import LandingMain from './LandingMain.vue';
import ProjectsMain from './ProjectsMain.vue';
import SkillsMain from './SkillsMain.vue';
import V8chLogo from '../icons/V8chLogo.vue';

export default {
  components: {
    LandingMain,
    ProjectsMain,
    SkillsMain,
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
