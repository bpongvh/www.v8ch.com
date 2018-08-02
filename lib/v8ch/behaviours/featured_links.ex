defmodule V8ch.Behaviours.FeaturedLink do
  alias V8ch.ContentTypes.FeaturedLink

  @callback create_featured_link(
              arg :: %{description: String.t(), href: String.t(), title: String.t()}
            ) :: {:ok, FeaturedLink.t()}

  @callback list_featured_links() :: {:ok, [FeaturedLink.t()]}
end
