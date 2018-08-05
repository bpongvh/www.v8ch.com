defmodule V8chWeb.GraphQlFields.FeaturedLinksQueries do
  use Absinthe.Schema.Notation

  @featured_links_module Application.get_env(:v8ch, :featured_links_module)

  object :featured_links_queries do
    field :featured_links, list_of(:featured_link) do
      resolve(fn _, _, _ ->
        {:ok, @featured_links_module.list_featured_links()}
      end)
    end
  end
end
