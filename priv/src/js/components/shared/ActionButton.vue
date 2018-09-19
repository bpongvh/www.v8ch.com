<template>
    <button @click="doAction" class="btn btn-link" type="button">
        <font-awesome-icon :icon="icon" />
    </button>
</template>

<script type="text/babel">
  export default {
    props: {
        icon: String,
        doAction: Function
    }
  }
</script>
