<template>
  <div>
    <topbar @toggle-offcanvas="toggleOffcanvas" :is-dark="true" />
    <landing-main logo-size="medium" />
    <skills-main />
    <projects-main :projects="featuredLinks" />
    <contact-main :is-contact-submitted="isContactSubmitted" @save-contact="saveContact" />
  </div>
</template>

<script type="text/babel">
  import gql from 'graphql-tag';
  import {mapMutations, mapState} from "vuex";
  import { types as contactMutations } from "../../store/contact/mutations";
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
    computed: { ...mapState("contact", { isContactSubmitted: state => state.isContactSubmitted }) },
    data() {
      return { featuredLinks: [] };
    },
    methods: {
      ...mapMutations("contact", {setIsContactSubmitted: contactMutations.SET_IS_CONTACT_SUBMITTED}),
      ...mapMutations("session", {toggleOffcanvas: sessionMutations.TOGGLE_OFFCANVAS}),
      saveContact({email, message}) {
        this.$apollo.mutate({
          mutation: gql`mutation ($data: ContactCreateInput!) {
            createContact(data: $data) {
              contact {
                email
                id
                message
              }
            }
          }`,
          variables: {
            data: { email, message },
          }
        }).then(() => {
          this.setIsContactSubmitted();
        });
      }
    },
  }
</script>
