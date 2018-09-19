<template>
    <div>
      <topbar />
      <header class="section-header">
        <h2>Dashboard</h2>
      </header>
      <main class="container">        
        <content-list title="Contacts">
          <contact-list-item :contact="contact" :key="index" v-for="(contact, index) in contacts" />
        </content-list>       
        <content-list>
          <div class="content-list__header content-list__header--action">
            <h3>Recent Posts</h3>
            <action-button :do-action="addPost" icon="plus" />
          </div>
          <post-list-item :post="post" :key="index" v-for="(post, index) in posts" />
        </content-list>
      </main>
    </div>
</template>

<script type="text/babel">
  import gql from 'graphql-tag';
  import ContactListItem from "../contact/ListItem";
  import PostListItem from "../post/ListItem";
  import ActionButton from "../shared/ActionButton";
  import ContentList from "../shared/ContentList";
  import Topbar from "../shared/Topbar";

  export default {
    apollo: {
      contacts: gql`{contacts {email id insertedAt message}}`,
      posts: gql`{posts {content id insertedAt title}}`
    },
    components: {ActionButton, ContactListItem, ContentList, PostListItem, Topbar},
    methods: {
      addPost() {
        this.$router.push("/post/add");
      }
    },
  }
</script>
