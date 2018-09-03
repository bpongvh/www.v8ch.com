defmodule V8chWeb.GraphQlTypes.FeaturedLink do
  use Absinthe.Schema.Notation

  @desc "Featured link query object"
  object :featured_link do
    field(:description, :string)
    field(:id, :id)
    field(:inserted_at, :iso8601)
    field(:href, :string)
    field(:title, :string)
  end

  @desc "Featured link mutation result object"
  object :featured_link_mutation_result do
    field :featured_link, :featured_link
    field :errors, list_of(:input_error)
  end

  @desc "Featured link input object for create requests"
  input_object :featured_link_create_input do
    field :description, non_null(:string)
    field :href, non_null(:string)
    field :title, non_null(:string)
  end

  @desc "Featured link input object for update requests"
  input_object :featured_link_update_input do
    field :description, non_null(:string)
    field :href, non_null(:string)
    field :id, non_null(:integer)
    field :title, non_null(:string)
  end
end
