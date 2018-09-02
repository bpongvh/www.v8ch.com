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
import AppContext from "../../app-context";
import Topbar from "../Topbar";
import ContactMain from './ContactMain';
import LandingMain from './LandingMain';
import ProjectsMain from './ProjectsMain';
import SkillsMain from './SkillsMain';

export default {
  apollo: { featuredLinks: gql`{featuredLinks {createdAt description href title}}` },
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
  methods: {
    toggleOffcanvas() {      
      AppContext.$emit("toggle-offcanvas");
    }
  },
}
</script>
