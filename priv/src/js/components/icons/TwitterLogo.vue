<template>
  <svg
    :height="height"
    :width="width"
    xmlns="http://www.w3.org/2000/svg"
    viewBox="0 0 400 400"
    @click="$emit('click')"
  >
    <title>Twitter Logo Blue</title>
    <!-- eslint-disable max-len -->
    <path
      class="twitter-logo"
      d="M125.79,362.51c151,0,233.51-125.06,233.51-233.5,0-3.56,0-7.09-.24-10.61A167,167,0,0,0,400,75.92a163.65,163.65,0,0,1-47.14,12.91,82.31,82.31,0,0,0,36.08-45.39,164.57,164.57,0,0,1-52.11,19.92A82.14,82.14,0,0,0,197,138.21,233,233,0,0,1,27.84,52.46,82.12,82.12,0,0,0,53.25,162,81.39,81.39,0,0,1,16,151.74v1a82.09,82.09,0,0,0,65.84,80.45,81.86,81.86,0,0,1-37.06,1.41,82.18,82.18,0,0,0,76.68,57,164.65,164.65,0,0,1-101.92,35.2A167.85,167.85,0,0,1,0,325.65a232.37,232.37,0,0,0,125.79,36.8"
    />
    <!-- eslint-enable max-len -->
  </svg>
</template>

<script type="text/babel">
export default {
  // ----------------------
  // Props
  // ----------------------

  props: {
    size: {
      default: 'small',
      required: false,
      type: String,
    },
  },

  // ----------------------
  // Computed
  // ----------------------

  computed: {
    height() {
      switch (this.size) {
        case 'large':
          return '90px';
        case 'medium':
          return '60px';
        default:
          return '30px';
      }
    },
    width() {
      switch (this.size) {
        case 'large':
          return '90px';
        case 'medium':
          return '60px';
        default:
          return '30px';
      }
    },
  },
};
</script>

<style lang="scss">
.twitter-logo {
  fill: #1da1f2;
}
</style>
