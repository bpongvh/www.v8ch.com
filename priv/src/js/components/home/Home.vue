<template>
  <div>
    <landing-main logo-size="medium" />
    <skills-main />
    <projects-main />
    <contact-main />
  </div>
</template>

<script type="text/babel">
import ContactMain from './ContactMain.vue';
import LandingMain from './LandingMain.vue';
import ProjectsMain from './ProjectsMain.vue';
import SkillsMain from './SkillsMain.vue';

export default {
  components: {
    ContactMain,
    LandingMain,
    ProjectsMain,
    SkillsMain,
  },
};
</script>
