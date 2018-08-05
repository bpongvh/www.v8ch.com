defmodule V8chWeb.GraphQl.Query.PostsTest do
  use V8chWeb.ConnCase, async: true

  @moduletag :posts_query

  alias V8ch.ContentTypes

  describe "POSTS: " do
    @query """
    {
      posts {
        content
        id
        title
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

    test "listing posts shows all", %{post: post} do
      conn = build_conn()

      conn = post(conn, "/graphql/v1", query: @query)

      assert json_response(conn, 200) == %{
               "data" => %{
                 "posts" => [
                   %{
                     "content" => @valid_attrs.content,
                     "id" => Integer.to_string(post.id),
                     "title" => @valid_attrs.title
                   }
                 ]
               }
             }
    end
  end
end
