defmodule V8chWeb.GraphQlFields.ContactsMutations do
  use Absinthe.Schema.Notation

  alias V8chWeb.GraphQlMiddleware.CheckAuthentication, as: CheckAuthenticationMiddleware
  alias V8chWeb.GraphQlMiddleware.HandleChangesetErrors, as: HandleChangesetErrorsMiddleware
  alias V8chWeb.GraphQlResolvers.Contacts, as: ContactsResolver

  object :contacts_mutations do
    field :create_contact, :contact_mutation_result do
      arg(:data, non_null(:contact_create_input))
      resolve(&ContactsResolver.create_contact/3)
      middleware HandleChangesetErrorsMiddleware
    end

    field :delete_contact, :contact_mutation_result do
      arg(:id, non_null(:integer))
      middleware CheckAuthenticationMiddleware
      resolve(&ContactsResolver.delete_contact/3)
      middleware HandleChangesetErrorsMiddleware
    end

    field :update_contact, :contact_mutation_result do
      arg(:data, non_null(:contact_update_input))
      middleware CheckAuthenticationMiddleware
      resolve(&ContactsResolver.update_contact/3)
      middleware HandleChangesetErrorsMiddleware
    end
  end
end
