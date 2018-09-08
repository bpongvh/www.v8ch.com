<template>
    <div>
        <contact-list :contacts="contacts" />
    </div>
</template>

<script type="text/babel">
  import gql from 'graphql-tag';
  import ContactList from "../contact/List";

  export default {
    apollo: { contacts: gql`{contacts {email id insertedAt message}}` },
    components: {ContactList}
  }
</script>
