defmodule V8chWeb.GraphQlTypes.FeaturedLink do
  use Absinthe.Schema.Notation

  object :featured_link do
    field(:description, :string)
    field(:guid, :id)
    field(:href, :string)
    field(:title, :string)
  end
end
