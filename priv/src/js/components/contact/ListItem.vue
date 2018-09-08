<template>
  <a
    href="#"
    class="list-group-item list-group-item-action align-items-start"
  >
    <div class="">
      <h5 class="mb-1">{{contact.email}}</h5>
      <small>{{posted}}</small>
    </div>
    <p class="mb-1">{{contact.message}}</p>
  </a>
</template>

<script type="text/babel">
  import moment from "moment";
  import Vue from "vue";

  export default {
    computed: {
      posted() {
        return moment(this.contact.insertedAt).fromNow();
      }
    },
    props: {
      contact: {
        required: true,
        type: Object
      }
    }
  }
</script>
