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
  `,
  DELETE_POST: gql`
    mutation deletePost($data: PostDeleteInput!) {
      deletePost(data: $data) {
        post {
          content
          id
          insertedAt
          title
        }
      }
    }
  `,
  UPDATE_POST: gql`
    mutation updatePost($data: PostUpdateInput!) {
      updatePost(data: $data) {
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
