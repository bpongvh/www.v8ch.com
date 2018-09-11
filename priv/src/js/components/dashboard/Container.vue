<template>
    <div>
      <topbar @toggle-offcanvas="toggleOffcanvas" theme="dark" />
      <header class="section-header">
        <h2>Dashboard</h2>
      </header>
      <div class="container">        
        <contact-list :contacts="contacts" />
      </div>
    </div>
</template>

<script type="text/babel">
  import gql from 'graphql-tag';
  import {mapMutations} from "vuex";
  import { types as sessionMutations } from "../../store/session/mutations";
  import ContactList from "../contact/List";
  import Topbar from "../shared/Topbar";

  export default {
    apollo: { contacts: gql`{contacts {email id insertedAt message}}` },
    components: {ContactList, Topbar},
    methods: {
      ...mapMutations("session", {toggleOffcanvas: sessionMutations.TOGGLE_OFFCANVAS})
    },
  }
</script>
