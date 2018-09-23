import gql from "graphql-tag";

export default {
  GET_POST: gql`
    query Post($data: Int!) {
      post(id: $data) {
        content
        id
        insertedAt
        title
      }
    }
  `,
  LIST_CONTACTS: gql`
    {
      contacts {
        email
        id
        insertedAt
        message
      }
    }
  `,
  LIST_POSTS: gql`
    {
      posts {
        content
        id
        insertedAt
        title
      }
    }
  `
};
