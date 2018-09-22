import gql from "graphql-tag";

export default {
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
