<template>
  <section class="bg-dark">
    <header class="block-header">
      <h2>Projects</h2>
    </header>
    <div class="block-content block-content__2col block-content--padded">
      <div
        :key="index"
        class="featured-link text-light"
        v-for="(project, index) in projects"
      >
        <h5>
          <a :href="project.href" v-text=" project.title" />
        </h5>
        <p v-text="project.description" />
      </div>
    </div>
  </section>
</template>

<script type="text/babel">
  export default { props: { projects: Array } };
</script>
