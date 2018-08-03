defmodule V8chWeb.GraphQlResolvers.FeaturedLinks do
  @featured_links_module Application.get_env(:v8ch, :featured_links_module)

  def create_featured_link(_, %{data: params}, _) do
    with {:ok, featured_link} <- @featured_links_module.create_featured_link(params) do
      {:ok, %{featured_link: featured_link}}
    end
  end
end
