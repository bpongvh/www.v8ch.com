<template>
  <div class="main main--dark-background main--framed">
    <div class="main__container">
      <div class="header header--light">
        <h3>Projects</h3>
      </div>
    </div>
    <div class="main__2col">
      <div
        :key="index"
        class="featured-link featured-link--light featured-link--margin-bottom"
        v-for="(project, index) in projects"
      >
        <h5>
          <a :href="project.href" v-text=" project.title" />
        </h5>
        <p v-text="project.description" />
      </div>
    </div>
  </div>
</template>

<script type="text/babel">
  export default { props: { projects: Array } };
</script>
