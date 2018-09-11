<template>
    <div>
      <topbar @toggle-offcanvas="toggleOffcanvas" theme="dark" />
      <header class="section-header">
        <h2>Dashboard</h2>
      </header>
      <div class="container">        
        <content-list title="Contacts">
          <contact-list-item :contact="contact" :key="index" v-for="(contact, index) in contacts" />
        </content-list>       
        <content-list title="Recent Posts">
          <post-list-item :post="post" :key="index" v-for="(post, index) in posts" />
        </content-list>
      </div>
    </div>
</template>

<script type="text/babel">
  import gql from 'graphql-tag';
  import {mapMutations} from "vuex";
  import { types as sessionMutations } from "../../store/session/mutations";
  import ContactListItem from "../contact/ListItem";
  import PostListItem from "../post/ListItem";
  import ContentList from "../shared/ContentList";
  import Topbar from "../shared/Topbar";

  export default {
    apollo: {
      contacts: gql`{contacts {email id insertedAt message}}`,
      posts: gql`{posts {content id insertedAt title}}`
    },
    components: {ContactListItem, ContentList, PostListItem, Topbar},
    methods: {
      ...mapMutations("session", {toggleOffcanvas: sessionMutations.TOGGLE_OFFCANVAS})
    },
  }
</script>
