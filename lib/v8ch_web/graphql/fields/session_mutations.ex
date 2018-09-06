defmodule V8chWeb.GraphQlFields.SessionMutations do
  use Absinthe.Schema.Notation

  alias V8chWeb.GraphQlResolvers.Session, as: SessionResolver

  object :session_mutations do
    field :create_session, :session_mutation_result do
      arg(:data, non_null(:session_create_input))
      resolve(&SessionResolver.create_session/3)
    end
  end
end
