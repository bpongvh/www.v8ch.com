<template>
  <div>
    <topbar @toggle-offcanvas="toggleOffcanvas" theme="light" />
    <header class="section-header">
      <ul class="keyword-list text-dark text-right">
        <li>
          <span class="keyword-list__term">V8CH</span>
          <span class="keyword-list__definition">Blog</span>
        </li>
      </ul>
    </header>
    <main class="container">
      <article class="blog-post">
        <header>
          <h2>
            Donec nec justo eget felis facilisis fermentum
          </h2>
        </header>
        <p>
          Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio.
          Quisque volutpat mattis eros. Nullam malesuada erat ut turpis.
          Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.
        </p>
        <p>
          Donec nec justo eget felis facilisis fermentum. Aliquam porttitor
          mauris sit amet orci. Aenean dignissim pellentesque felis.
        </p>
        <p>
          Morbi in sem quis dui placerat ornare. Pellentesque odio nisi,
          euismod in, pharetra a, ultricies in, diam. Sed arcu. Cras consequat.
        </p>
        <p>
          Praesent dapibus, neque id cursus faucibus, tortor neque egestas
          auguae, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam
          dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.
        </p>
        <p>
          Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec
          consectetuer ligula vulputate sem tristique cursus. Nam nulla quam,
          gravida non, commodo a, sodales sit amet, nisi.
        </p>
      </article>
    </main>
  </div>
</template>

<script type="text/babel">
import Topbar from "../Topbar";
export default {
  components: { Topbar },
  methods: {
    toggleOffcanvas() {      
      AppContext.$emit("toggle-offcanvas");
    }
  }
}
</script>
