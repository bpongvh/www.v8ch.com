defmodule V8chWeb.GraphQl.Mutation.UpdatePostTest do
  use V8chWeb.ConnCase, async: true

  @moduletag :update_post_mutation

  alias V8ch.ContentTypes

  describe "UPDATE POSTS: " do
    @query """
    mutation ($post: PostUpdateInput!) {
      updatePost(data: $post) {
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
    @update_attrs %{
      content: "updated content",
      title: "some updated title"
    }
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

    test "updating a post returns not found with nonexistent id", _ do
      conn = build_conn()

      conn =
        post(conn, "/graphql/v1",
          query: @query,
          variables: %{"post" => Enum.into(%{id: 7}, @update_attrs)}
        )

      assert json_response(conn, 200) == %{
               "data" => %{"updatePost" => nil},
               "errors" => [
                 %{
                   "locations" => [%{"column" => 0, "line" => 2}],
                   "message" => "POST_NOT_FOUND",
                   "path" => ["updatePost"]
                 }
               ]
             }
    end

    test "updating a post validates data", %{post: post} do

      conn = build_conn()

      conn =
        post(conn, "/graphql/v1",
          query: @query,
          variables: %{"post" => Enum.into(%{id: post.id}, @invalid_attrs)}
        )

      assert json_response(conn, 200) == %{
               "data" => %{
                 "updatePost" => %{
                   "errors" => [
                     %{"key" => "content", "message" => "can't be blank"},
                     %{"key" => "title", "message" => "can't be blank"}
                   ],
                   "post" => nil
                 }
               }
             }
    end

    test "updating a post saves updates", %{post: post} do

      conn = build_conn()

      conn =
        post(conn, "/graphql/v1",
          query: @query,
          variables: %{"post" => Enum.into(%{id: post.id}, @update_attrs)}
        )

      assert json_response(conn, 200) == %{
               "data" => %{
                 "updatePost" => %{
                   "errors" => nil,
                   "post" => %{
                     "content" => @update_attrs.content,
                     "title" => @update_attrs.title
                   }
                 }
               }
             }
    end
  end
end
