defmodule V8chWeb.GraphQlTypes.Post do
  use Absinthe.Schema.Notation

  @desc "Post query object"
  object :post do
    field(:content, :string)
    field(:inserted_at, :iso8601)
    field(:id, :id)
    field(:title, :string)
  end

  @desc "Post mutation result object"
  object :post_mutation_result do
    field :post, :post
    field :errors, list_of(:input_error)
  end

  @desc "Post input object for create requests"
  input_object :post_create_input do
    field :content, non_null(:string)
    field :title, non_null(:string)
  end

  @desc "Post input object for update requests"
  input_object :post_update_input do
    field :content, non_null(:string)
    field :id, non_null(:integer)
    field :title, non_null(:string)
  end
end
