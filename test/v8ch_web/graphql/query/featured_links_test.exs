defmodule V8chWeb.GraphQl.Query.FeaturedLinksTest do
  use V8chWeb.ConnCase, async: true

  @moduletag :featured_links_query

  alias V8ch.ContentTypes

  describe "FEATURED LINKS: " do
    @query """
    {
      featuredLinks {
        description
        href
        id
        title
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

    test "listing featured_links shows all", %{featured_link: featured_link} do
      conn = build_conn()

      conn = post(conn, "/graphql/v1", query: @query)

      assert json_response(conn, 200) == %{
               "data" => %{
                 "featuredLinks" => [
                   %{
                     "description" => @valid_attrs.description,
                     "href" => @valid_attrs.href,
                     "id" => Integer.to_string(featured_link.id),
                     "title" => @valid_attrs.title
                   }
                 ]
               }
             }
    end
  end
end
