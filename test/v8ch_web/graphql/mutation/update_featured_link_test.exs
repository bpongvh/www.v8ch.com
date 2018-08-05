defmodule V8chWeb.GraphQl.Mutation.UpdateFeaturedLinkTest do
  use V8chWeb.ConnCase, async: true

  @moduletag :update_featured_link_mutation

  alias V8ch.ContentTypes

  describe "UPDATE FEATURED LINKS: " do
    @query """
    mutation ($featuredLink: FeaturedLinkUpdateInput!) {
      updateFeaturedLink(data: $featuredLink) {
        errors {
          key
          message
        }
        featuredLink {
          description
          href
          title
        }
      }
    }
    """

    @invalid_attrs %{
      description: "",
      href: "",
      title: ""
    }
    @update_attrs %{
      description: "updated description",
      href: "http://updated.to.local",
      title: "some updated title"
    }
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

    test "updating a featured_link returns not found with nonexistent id", _ do
      conn = build_conn()

      conn =
        post(conn, "/graphql/v1",
          query: @query,
          variables: %{"featuredLink" => Enum.into(%{id: 7}, @update_attrs)}
        )

      assert json_response(conn, 200) == %{
               "data" => %{"updateFeaturedLink" => nil},
               "errors" => [
                 %{
                   "locations" => [%{"column" => 0, "line" => 2}],
                   "message" => "FEATURED_LINK_NOT_FOUND",
                   "path" => ["updateFeaturedLink"]
                 }
               ]
             }
    end

    test "updating a featured_link validates data", %{featured_link: featured_link} do

      conn = build_conn()

      conn =
        post(conn, "/graphql/v1",
          query: @query,
          variables: %{"featuredLink" => Enum.into(%{id: featured_link.id}, @invalid_attrs)}
        )

      assert json_response(conn, 200) == %{
               "data" => %{
                 "updateFeaturedLink" => %{
                   "errors" => [
                     %{"key" => "description", "message" => "can't be blank"},
                     %{"key" => "href", "message" => "can't be blank"},
                     %{"key" => "title", "message" => "can't be blank"}
                   ],
                   "featuredLink" => nil
                 }
               }
             }
    end

    test "updating a featured_link saves updates", %{featured_link: featured_link} do

      conn = build_conn()

      conn =
        post(conn, "/graphql/v1",
          query: @query,
          variables: %{"featuredLink" => Enum.into(%{id: featured_link.id}, @update_attrs)}
        )

      assert json_response(conn, 200) == %{
               "data" => %{
                 "updateFeaturedLink" => %{
                   "errors" => nil,
                   "featuredLink" => %{
                     "description" => @update_attrs.description,
                     "href" => @update_attrs.href,
                     "title" => @update_attrs.title
                   }
                 }
               }
             }
    end
  end
end
