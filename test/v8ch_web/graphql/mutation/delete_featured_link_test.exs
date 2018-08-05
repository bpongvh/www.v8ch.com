defmodule V8chWeb.GraphQl.Mutation.DeleteFeaturedLinkTest do
  use V8chWeb.ConnCase, async: true

  @moduletag :delete_featured_link_mutation

  alias V8ch.ContentTypes

  describe "DELETE FEATURED LINKS: " do
    @query """
    mutation ($id: Int!) {
      deleteFeaturedLink(id: $id) {
        errors {
          key
          message
        }
        featuredLink {
          description
          href
          id
          title
        }
      }
    }
    """

    @valid_attrs %{
      description: "some description",
      href: "http://link.to.local",
      title: "some title"
    }

    def featured_link_fixture(attrs \\ %{}) do
      {:ok, featured_link} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ContentTypes.create_featured_link()

      featured_link
    end

    setup do
      {:ok, [featured_link: featured_link_fixture(@valid_attrs)]}
    end

    test "deleting a featured_link returns not found with nonexistent id", _ do
      conn = build_conn()

      conn =
        post(conn, "/graphql/v1",
          query: @query,
          variables: %{"id" => 7}
        )

      assert json_response(conn, 200) == %{
               "data" => %{"deleteFeaturedLink" => nil},
               "errors" => [
                 %{
                   "locations" => [%{"column" => 0, "line" => 2}],
                   "message" => "FEATURED_LINK_NOT_FOUND",
                   "path" => ["deleteFeaturedLink"]
                 }
               ]
             }
    end

    test "deleting a featured_link removes persisted", %{featured_link: featured_link} do
      conn = build_conn()

      conn =
        post(conn, "/graphql/v1",
          query: @query,
          variables: %{"id" => featured_link.id}
        )

      assert json_response(conn, 200) == %{
               "data" => %{
                 "deleteFeaturedLink" => %{
                   "errors" => nil,
                   "featuredLink" => %{
                     "description" => @valid_attrs.description,
                     "href" => @valid_attrs.href,
                     "id" => Integer.to_string(featured_link.id),
                     "title" => @valid_attrs.title
                   }
                 }
               }
             }
    end
  end
end
