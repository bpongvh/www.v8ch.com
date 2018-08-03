defmodule V8chWeb.GraphQl.Mutation.CreateFeaturedLinkTest do
  use V8chWeb.ConnCase, async: true

  # alias V8ch.{Repo, FeaturedLinks}
  # import Ecto.Query

  @query """
  mutation ($featuredLink: FeaturedLinkInput!) {
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

  test "createFeaturedLink field creates a featured_link", _ do
    featured_link = %{
      "description" => "some description",
      "href" => "http://link.to.local",
      "title" => "some title"
    }

    conn = build_conn()
    conn = post(conn, "/graphql/v1", query: @query, variables: %{"featuredLink" => featured_link})

    assert json_response(conn, 200) == %{
             "data" => %{
               "createFeaturedLink" => %{
                 "errors" => nil,
                 "featuredLink" => %{
                   "description" => featured_link["description"],
                   "href" => featured_link["href"],
                   "title" => featured_link["title"]
                 }
               }
             }
           }
  end

  test "creating a featured_link validates data", _ do
    featured_link = %{
      "description" => "",
      "href" => "",
      "title" => ""
    }

    conn = build_conn()
    conn = post(conn, "/graphql/v1", query: @query, variables: %{"featuredLink" => featured_link})

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
end
