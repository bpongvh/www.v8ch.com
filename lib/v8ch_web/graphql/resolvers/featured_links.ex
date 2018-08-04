defmodule V8chWeb.GraphQlResolvers.FeaturedLinks do
  @featured_links_module Application.get_env(:v8ch, :featured_links_module)

  alias V8ch.ContentTypes.FeaturedLink
  alias V8ch.Repo

  def create_featured_link(_, %{data: params}, _) do
    with {:ok, featured_link} <- @featured_links_module.create_featured_link(params) do
      {:ok, %{featured_link: featured_link}}
    end
  end

  def delete_featured_link(_, %{id: id}, _) do
    with {:ok, featured_link} <- fetch_featured_link(id),
        {:ok, deleted} <- @featured_links_module.delete_featured_link(featured_link) do
      {:ok, %{featured_link: deleted}}
    end
  end

  def update_featured_link(_, %{data: params}, _) do
    with {:ok, featured_link} <- fetch_featured_link(params.id),
        {:ok, updated} <- @featured_links_module.update_featured_link(featured_link, params) do
      {:ok, %{featured_link: updated}}
    end
  end

  defp fetch_featured_link(id) do
    featured_link = Repo.get(FeaturedLink, id)
    case featured_link do
      nil -> {:error, "FEATURED_LINK_NOT_FOUND"}
      _ -> {:ok, featured_link}
    end
  end
end
