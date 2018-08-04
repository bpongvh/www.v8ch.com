defmodule V8chWeb.GraphQl.Query.CreateFeaturedLinkTest do
  use V8chWeb.ConnCase, async: true

  describe "CREATE FEATURED LINKS" do
    @query """
    mutation ($featuredLink: FeaturedLinkCreateInput!) {
      createFeaturedLink(data: $featuredLink) {
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
    @valid_attrs %{
      description: "some description",
      href: "http://link.to.local",
      title: "some title"
    }
    test "creating a featured_link validates data", _ do
      conn = build_conn()

      conn =
        post(conn, "/graphql/v1", query: @query, variables: %{"featuredLink" => @invalid_attrs})

      assert json_response(conn, 200) == %{
               "data" => %{
                 "createFeaturedLink" => %{
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

    test "createFeaturedLink field creates a featured_link", _ do
      conn = build_conn()

      conn =
        post(conn, "/graphql/v1", query: @query, variables: %{"featuredLink" => @valid_attrs})

      assert json_response(conn, 200) == %{
               "data" => %{
                 "createFeaturedLink" => %{
                   "errors" => nil,
                   "featuredLink" => %{
                     "description" => @valid_attrs.description,
                     "href" => @valid_attrs.href,
                     "title" => @valid_attrs.title
                   }
                 }
               }
             }
    end
  end
end
