defmodule V8chWeb.GraphQlTypes.FeaturedLink do
  use Absinthe.Schema.Notation

  @desc "Featured link query object"
  object :featured_link do
    field(:description, :string)
    field(:id, :id)
    field(:href, :string)
    field(:title, :string)
  end

  @desc "Featured link mutation result object"
  object :featured_link_mutation_result do
    field :featured_link, :featured_link
    field :errors, list_of(:input_error)
  end

  @desc "Featured link input object"
  input_object :featured_link_input do
    field :description, non_null(:string)
    field :href, non_null(:string)
    field :title, non_null(:string)
  end
end
