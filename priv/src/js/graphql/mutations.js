import gql from "graphql-tag";

export default {
  CREATE_POST: gql`
    mutation createPost($data: PostCreateInput!) {
      createPost(data: $data) {
        post {
          content
          id
          insertedAt
          title
        }
      }
    }
  `
};
