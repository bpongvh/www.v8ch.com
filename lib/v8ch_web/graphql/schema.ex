defmodule V8chWeb.GraphQlSchema do
  use Absinthe.Schema

  alias V8chWeb.GraphQlMiddleware.CheckAuthentication, as: CheckAuthenticationMiddleware
  alias V8chWeb.GraphQlMiddleware.HandleChangesetErrors, as: HandleChangesetErrorsMiddleware
  alias V8chWeb.GraphQlResolvers.FeaturedLinks, as: FeaturedLinksResolver

  # ----------------------
  # Import fields
  # ----------------------

  import_types(V8chWeb.GraphQlFields.FeaturedLinks)

  # ----------------------
  # Import Types
  # ----------------------

  import_types(V8chWeb.GraphQlTypes.FeaturedLink)

  query do
    import_fields(:featured_links_queries)
  end

  mutation do
    field :create_featured_link, :featured_link_mutation_result do
      arg(:data, non_null(:featured_link_input))
      middleware CheckAuthenticationMiddleware
      resolve(&FeaturedLinksResolver.create_featured_link/3)
      middleware HandleChangesetErrorsMiddleware
    end
  end

  @desc "An error result when persisting input"
  object :input_error do
    field(:key, non_null(:string))
    field(:message, non_null(:string))
  end

  # scalar :json do
  #   parse fn input ->
  #     case Poison.decode(input.value) do
  #       {:ok, result} -> result
  #       _ -> :error
  #     end
  #   end

  #   serialize &Poison.encode!/1
  # end
end
