<template>
  <svg
    :height="height"
    :width="width"
    aria-labelledby="title"
    viewBox="0 0 2000 2000"
    xmlns="http://www.w3.org/2000/svg"
    @click="$emit('click')"
  >
    <title id="title">GitHub Logo</title>
    <g>
      <!-- eslint-disable max-len -->
      <path
        class="github-black"
        d="M1000.83,24.8C448.62,24.8.83,472.5.83,1024.8c0,441.83,286.53,816.67,683.86,948.9,50,9.25,68.33-21.7,68.33-48.11,0-23.84-.93-102.62-1.36-186.18-278.2,60.5-336.9-118-336.9-118-45.49-115.58-111-146.32-111-146.32-90.74-62.07,6.84-60.79,6.84-60.79,100.41,7,153.29,103.06,153.29,103.06,89.19,152.87,233.94,108.68,291,83.12,9-64.62,34.88-108.75,63.49-133.72-222.12-25.28-455.62-111-455.62-494.2,0-109.17,39.07-198.38,103-268.42-10.39-25.19-44.62-126.89,9.68-264.64,0,0,84-26.87,275.07,102.52,79.77-22.17,165.32-33.28,250.3-33.67,85,.39,170.59,11.5,250.51,33.67,190.87-129.39,274.72-102.52,274.72-102.52,54.44,137.75,20.2,239.45,9.82,264.64,64.12,70,102.92,159.25,102.92,268.42,0,384.09-233.94,468.65-456.62,493.41,35.86,31,67.82,91.89,67.82,185.18,0,133.8-1.15,241.49-1.15,274.43,0,26.62,18,57.8,68.68,48,397.13-132.38,683.3-507.09,683.3-948.77C2000.83,472.5,1553.1,24.8,1000.83,24.8Z"
      />
      <path
        class="github-black"
        d="M379.58,1460.58c-2.2,5-10,6.47-17.14,3.05-7.26-3.26-11.32-10-9-15,2.15-5.11,10-6.53,17.22-3.12s11.4,10.11,8.89,15.09Zm-12.3-9.12"
      />
      <path
        class="github-black"
        d="M420.09,1505.76c-4.77,4.42-14.1,2.36-20.42-4.62-6.55-7-7.76-16.31-2.93-20.78s14-2.35,20.51,4.62,7.82,16.3,2.84,20.78Zm-9.54-10.24"
      />
      <path
        class="github-black"
        d="M459.52,1563.35c-6.13,4.27-16.16.27-22.35-8.62s-6.13-19.57.14-23.84,16.08-.42,22.36,8.39c6.11,9,6.11,19.72-.15,24.07Zm0,0"
      />
      <path
        class="github-black"
        d="M513.53,1619c-5.48,6-17.16,4.42-25.7-3.83-8.74-8.05-11.17-19.5-5.69-25.55s17.31-4.35,25.91,3.83,11.32,19.57,5.48,25.55Zm0,0"
      />
      <path
        class="github-black"
        d="M588.05,1651.3c-2.43,7.83-13.66,11.39-25,8.06s-18.72-12.6-16.44-20.51,13.65-11.59,25-8,18.72,12.51,16.37,20.48Zm0,0"
      />
      <path
        class="github-black"
        d="M669.9,1657.29c.27,8.25-9.34,15.09-21.22,15.23s-21.64-6.4-21.77-14.52c0-8.33,9.4-15.09,21.35-15.3s21.64,6.41,21.64,14.59Zm0,0"
      />
      <path
        class="github-black"
        d="M746.05,1644.33c1.42,8-6.84,16.31-18.65,18.5-11.61,2.14-22.35-2.84-23.84-10.81-1.43-8.25,7-16.52,18.57-18.65,11.82-2,22.41,2.78,23.92,11Zm0,0"
      />
      <!-- eslint-enable max-len -->
    </g>
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
.github-black {
  fill: #181616;
}
</style>
