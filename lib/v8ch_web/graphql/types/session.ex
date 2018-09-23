defmodule V8chWeb.GraphQlTypes.Session do
  use Absinthe.Schema.Notation

  @desc "Session query object"
  object :session do
    field(:token, :string)
  end

  @desc "Session mutation result object"
  object :session_mutation_result do
    field :session, :session
    field :errors, list_of(:input_error)
  end

  @desc "Session input object for create requests"
  input_object :session_create_input do
    field :code, non_null(:string)
  end
end
