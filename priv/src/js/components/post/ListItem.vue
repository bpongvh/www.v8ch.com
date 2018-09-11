<template>
  <div class="list-group-item">
    <div class="list-group-item__header">
      <h4>{{post.title}}</h4>
      <p>{{posted}}</p>
    </div>
    <div class="list-group-item__actions">
      <button class="btn btn-link" type="button">Delete</button>
    </div>
  </div>
</template>

<script type="text/babel">
  import moment from "moment";
  import Vue from "vue";

  export default {
    computed: {
      posted() {
        return moment(this.post.insertedAt).fromNow();
      }
    },
    props: {
      post: {
        required: true,
        type: Object
      }
    }
  }
</script>
