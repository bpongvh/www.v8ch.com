defmodule V8chWeb.GraphQl.Mutation.DeletePostTest do
  use V8chWeb.ConnCase, async: true

  @moduletag :delete_post_mutation

  alias V8ch.ContentTypes

  describe "DELETE POSTS: " do
    @query """
    mutation ($id: Int!) {
      deletePost(id: $id) {
        errors {
          key
          message
        }
        post {
          content
          id
          title
        }
      }
    }
    """

    @valid_attrs %{
      content: "some content",
      title: "some title"
    }

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ContentTypes.create_post()

      post
    end

    setup do
      {:ok, [post: post_fixture(@valid_attrs)]}
    end

    test "deleting a post returns not found with nonexistent id", _ do
      conn = build_conn()

      conn =
        post(conn, "/graphql/v1",
          query: @query,
          variables: %{"id" => 7}
        )

      assert json_response(conn, 200) == %{
               "data" => %{"deletePost" => nil},
               "errors" => [
                 %{
                   "locations" => [%{"column" => 0, "line" => 2}],
                   "message" => "POST_NOT_FOUND",
                   "path" => ["deletePost"]
                 }
               ]
             }
    end

    test "deleting a post removes persisted", %{post: post} do
      conn = build_conn()

      conn =
        post(conn, "/graphql/v1",
          query: @query,
          variables: %{"id" => post.id}
        )

      assert json_response(conn, 200) == %{
               "data" => %{
                 "deletePost" => %{
                   "errors" => nil,
                   "post" => %{
                     "content" => @valid_attrs.content,
                     "id" => Integer.to_string(post.id),
                     "title" => @valid_attrs.title
                   }
                 }
               }
             }
    end
  end
end
