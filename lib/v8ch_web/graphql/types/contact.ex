defmodule V8chWeb.GraphQlTypes.Contact do
  use Absinthe.Schema.Notation

  @desc "Contact query object"
  object :contact do
    field(:email, :string)
    field(:id, :id)
    field(:message, :string)
    field(:inserted_at, :iso8601)
  end

  @desc "Contact mutation result object"
  object :contact_mutation_result do
    field :contact, :contact
    field :errors, list_of(:input_error)
  end

  @desc "Contact input object for create requests"
  input_object :contact_create_input do
    field :email, non_null(:string)
    field :message, non_null(:string)
  end

  @desc "Contact input object for update requests"
  input_object :contact_update_input do
    field :email, non_null(:string)
    field :message, non_null(:integer)
  end
end
