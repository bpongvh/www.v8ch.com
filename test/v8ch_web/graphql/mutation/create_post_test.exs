defmodule V8chWeb.GraphQl.Query.CreatePostTest do
  use V8chWeb.ConnCase, async: true

  @moduletag :create_post_mutation

  describe "CREATE POSTS" do
    @query """
    mutation ($post: PostCreateInput!) {
      createPost(data: $post) {
        errors {
          key
          message
        }
        post {
          content
          title
        }
      }
    }
    """

    @invalid_attrs %{
      content: "",
      title: ""
    }
    @valid_attrs %{
      content: "some content",
      title: "some title"
    }
    test "creating a featured_link validates data", _ do
      conn = build_conn()

      conn =
        post(conn, "/graphql/v1", query: @query, variables: %{"post" => @invalid_attrs})

      assert json_response(conn, 200) == %{
               "data" => %{
                 "createPost" => %{
                   "errors" => [
                     %{"key" => "content", "message" => "can't be blank"},
                     %{"key" => "title", "message" => "can't be blank"}
                   ],
                   "post" => nil
                 }
               }
             }
    end

    test "createPost field creates a featured_link", _ do
      conn = build_conn()

      conn =
        post(conn, "/graphql/v1", query: @query, variables: %{"post" => @valid_attrs})

      assert json_response(conn, 200) == %{
               "data" => %{
                 "createPost" => %{
                   "errors" => nil,
                   "post" => %{
                     "content" => @valid_attrs.content,
                     "title" => @valid_attrs.title
                   }
                 }
               }
             }
    end
  end
end
