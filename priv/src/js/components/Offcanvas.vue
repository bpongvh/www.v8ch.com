<template>
    <div :class="{ 'offcanvas--showing': isOffcanvasShowing }" class="offcanvas text-light">
        <nav class="navbar navbar-dark">
            <button @click="toggleOffcanvas" class="navbar-toggler">
                <font-awesome-icon icon="times" />
            </button>
        </nav>
        <nav class="container">
            <ul class="nav">
                <li class="nav-item">
                    <router-link class="nav-link" :to="{ name: 'home' }">Home</router-link>
                </li>
                <li class="nav-item">
                    <router-link class="nav-link" :to="{ name: 'blog' }">Blog</router-link>
                </li>
            </ul>
        </nav>
    </div>
</template>

<script type="text/babel">
export default {
  methods: {
    toggleOffcanvas() {
      this.$emit("toggle-offcanvas");
    }
  },
  props: { isOffcanvasShowing: Boolean }
};
</script>

<style lang="scss">
.offcanvas {
  background-color: $color__v8ch-dark-green;
  border-bottom: 1px solid $color__v8ch-light-green;
  border-right: 1px solid $color__v8ch-light-green;
  border-top: 1px solid $color__v8ch-light-green;
  height: calc(100vh - 2px);
  margin: 1px 1px 0 0;
  position: fixed;
  left: -100vw;
  top: 0;
  transition: 0.3s ease all;
  // Viewport width without any vertical scrollbar less 1px
  width: calc(100vw - (100vw - 100%) - 1px);
  z-index: 1040;

  &.offcanvas--showing {
    transform: translateX(calc(100vw - 1px));
  }
}
</style>

