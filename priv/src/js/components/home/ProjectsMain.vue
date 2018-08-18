<template>
  <section class="bg-dark">
    <header class="content-block-header">
      <h2>Projects</h2>
    </header>
    <div class="content-block content-block--inset text-light">
      <ul class="featured-link-list">
        <li
          :key="index"
          v-for="(project, index) in projects"
        >
          <a class="featured-link-list__title" :href="project.href" v-text=" project.title" />
          <span class="featured-link-list__description" v-text="project.description" />
        </li>
      </ul>
    </div>
  </section>
</template>

<script type="text/babel">
  export default { props: { projects: Array } };
</script>
