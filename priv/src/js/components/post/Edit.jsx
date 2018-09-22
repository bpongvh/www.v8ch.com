import Topbar from "../shared/Topbar";
import PostForm from "./Form";
// import mutations from "../../graphql/mutations";
import queries from "../../graphql/queries";
import postResponseTransformer from "../../transformers/response-data/post";

export default {
  apollo: {
    postResponse: {
      query: queries.GET_POST,
      update(response) {
        return response.post;
      },
      variables() {
        return {
          data: this.$route.params.id
        };
      }
    }
  },
  computed: {
    post() {
      return this.postResponse
        ? postResponseTransformer(this.postResponse)
        : null;
    }
  },
  methods: {
    close() {
      this.$router.push("/dashboard");
    },
    save(formData) {
      // this.$apollo
      //   .mutate({
      //     mutation: mutations.CREATE_POST,
      //     update: (store, { data }) => {
      //       const updatedData = store.readQuery({ query: queries.LIST_POSTS });
      //       updatedData.posts.push(data.createPost.post);
      //       store.writeQuery({ query: queries.LIST_POSTS, data: updatedData });
      //     },
      //     variables: { data: formData }
      //   })
      //   .then(() => {
      //     this.close();
      //   })
      //   .catch(error => {
      //     console.error(`[PostAdd] save() error: ${JSON.stringify(error)}`);
      //   });
    }
  },
  render() {
    return (
      <div>
        <Topbar close-overlay={this.close} type="overlay" />
        <header class="section-header">
          <h2>Edit Post</h2>
        </header>
        <main class="container">
          <PostForm initialValues={this.post} save={this.save} />
        </main>
      </div>
    );
  }
};
