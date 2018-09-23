<template>
  <section class="content-list">
    <div class="list-group">
      <slot name="header" />
      <div class="content-list__header" v-if="title">
        <h3>{{ title }}</h3>
      </div>
      <slot />
    </div>
  </section>
</template>

<script type="text/babel">
  export default {
    props: { title: String }
  }
</script>
