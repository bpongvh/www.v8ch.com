<template>
  <div>
    <topbar @toggle-offcanvas="toggleOffcanvas" :is-dark="true" />
    <landing-main logo-size="medium" />
    <skills-main />
    <projects-main :projects="featuredLinks" />
    <contact-main />
  </div>
</template>

<script type="text/babel">
  import gql from 'graphql-tag';
  import {mapMutations} from "vuex";
  import { types as sessionMutations } from "../../store/session/mutations";
  import Topbar from "../Topbar";
  import ContactMain from './ContactMain';
  import LandingMain from './LandingMain';
  import ProjectsMain from './ProjectsMain';
  import SkillsMain from './SkillsMain';

  export default {
    apollo: { featuredLinks: gql`{featuredLinks {description href title}}` },
    components: {
      ContactMain,
      LandingMain,
      ProjectsMain,
      SkillsMain,
      Topbar
    },
    data() {
      return { featuredLinks: [] };
    },
    methods: { ...mapMutations("session", {toggleOffcanvas: sessionMutations.TOGGLE_OFFCANVAS}) },
  }
</script>
