defmodule V8ch.ContentTypes.FeaturedLink do
  use Ecto.Schema
  import Ecto.Changeset
  alias V8ch.ContentTypes.FeaturedLink

  schema "featured_links" do
    field(:description, :string)
    field(:href, :string)
    field(:title, :string)

    timestamps()
  end

  @doc false
  def changeset(%FeaturedLink{} = featured_link, attrs) do
    featured_link
    |> cast(attrs, [:description, :href, :id, :title])
    |> validate_required([:description, :href, :title])
  end
end
