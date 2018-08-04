<template>
  <div>
    <landing-main logo-size="medium" />
    <skills-main />
    <projects-main :projects="featuredLinks" />
    <contact-main />
  </div>
</template>

<script type="text/babel">
import gql from 'graphql-tag'
import ContactMain from './ContactMain.vue';
import LandingMain from './LandingMain.vue';
import ProjectsMain from './ProjectsMain.vue';
import SkillsMain from './SkillsMain.vue';

export default {
  apollo: { featuredLinks: gql`{featuredLinks {description href title}}` },
  components: {
    ContactMain,
    LandingMain,
    ProjectsMain,
    SkillsMain,
  },
  data () {
    return { featuredLinks: [] };
  },
}
</script>
