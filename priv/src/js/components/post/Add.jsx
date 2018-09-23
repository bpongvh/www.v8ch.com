import Topbar from "../shared/Topbar";
import PostForm from "./Form";
import mutations from "../../graphql/mutations";
import queries from "../../graphql/queries";

export default {
  methods: {
    close() {
      this.$router.push("/dashboard");
    },
    save(formData) {
      this.$apollo
        .mutate({
          mutation: mutations.CREATE_POST,
          update: (store, { data }) => {
            const updatedData = store.readQuery({ query: queries.LIST_POSTS });
            updatedData.posts.push(data.createPost.post);
            store.writeQuery({ query: queries.LIST_POSTS, data: updatedData });
          },
          variables: { data: formData }
        })
        .then(() => {
          this.close();
        })
        .catch(error => {
          console.error(`[PostAdd] save() error: ${JSON.stringify(error)}`);
        });
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
