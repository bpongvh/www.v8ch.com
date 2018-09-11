<template>
  <section class="content-list">  
    <div class="list-group">
      <h3>Contacts</h3>
      <contact-list-item :contact="contact" :key="index" v-for="(contact, index) in contacts" />
    </div>
  </section>
</template>

<script type="text/babel">
  import ContactListItem from "./ListItem";

  export default {
    components: {ContactListItem},
    props: {
      contacts: {
        default: null,
        type: [Array, Object],
        validator: function (value) {
          if (Array.isArray(value)) {
            return true
          }
          return value === null ? true : false;
        }
      }
    }
  }
</script>
