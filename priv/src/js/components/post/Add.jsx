import Topbar from "../shared/Topbar";
import PostForm from "./Form";

export default {
  methods: {
    close() {
      this.$router.push("/dashboard");
    },
    save(formData) {
      console.log(`[PostAdd] save() formData: ${JSON.stringify(formData)}`);
    }
  },
  render() {
    return (
      <div>
        <Topbar close-overlay={this.close} type="overlay" />
        <header class="section-header">
          <h2>Add Post</h2>
        </header>
        <main class="container">
          <PostForm save={this.save} />
        </main>
      </div>
    );
  }
};
