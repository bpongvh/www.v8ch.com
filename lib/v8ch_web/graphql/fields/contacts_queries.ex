defmodule V8chWeb.GraphQlFields.ContactsQueries do
  use Absinthe.Schema.Notation

  @contacts_module Application.get_env(:v8ch, :contacts_module)

  object :contacts_queries do
    field :contacts, list_of(:contact) do
      resolve(fn _, _, _ ->
        {:ok, @contacts_module.list_contacts()}
      end)
    end
  end
end
