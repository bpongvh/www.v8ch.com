defmodule V8chWeb.FeaturedLinkController do
  use V8chWeb, :controller

  @featured_links_module Application.get_env(:v8ch, :featured_links_module)

  action_fallback(V8chWeb.FallbackController)

  def create(conn, %{"description" => description, "href" => href, "title" => title}) do
    params = %{
      description: description,
      href: href,
      guid: Ecto.UUID.generate(),
      title: title,
    }
    with {:ok, featured_link} <- @featured_links_module.create_featured_link(params) do
      conn
      |> render(FeaturedLinkView, "featured_link.json", %{featured_link: featured_link})
    end
  end
end
