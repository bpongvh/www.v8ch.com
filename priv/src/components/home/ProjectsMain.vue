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
          <a :href="project.data.href" v-text=" project.title.rendered" />
        </h5>
        <p v-text="project.data.description" />
      </div>
    </div>
  </div>
</template>

<script type="text/babel">
  export default {
    data() {
      return { projects: [] }
    },
    async mounted() {
      const baseUrl = 'http://cms.local/wp-json/wp/v2/featured-links';
      const params = new URLSearchParams();
      params.set('filter[featured_link_tag]', 'front-page--projects');
      params.set('filter[order]', 'ASC');
      params.set('filter[orderby]', 'menu_order');
      const url = `${baseUrl}?${params.toString()}`;
      this.projects = await fetch(url, { method: 'GET' })
        .then((response) => {
          if (response.ok) {
            return response.json();
          }
          throw new Error('Response not ok');
        })
    }
  };
</script>
