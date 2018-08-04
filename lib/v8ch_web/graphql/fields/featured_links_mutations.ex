defmodule V8chWeb.GraphQlFields.FeaturedLinksMutations do
  use Absinthe.Schema.Notation

  alias V8chWeb.GraphQlMiddleware.CheckAuthentication, as: CheckAuthenticationMiddleware
  alias V8chWeb.GraphQlMiddleware.HandleChangesetErrors, as: HandleChangesetErrorsMiddleware
  alias V8chWeb.GraphQlResolvers.FeaturedLinks, as: FeaturedLinksResolver

  object :featured_links_mutations do
    field :create_featured_link, :featured_link_mutation_result do
      arg(:data, non_null(:featured_link_create_input))
      middleware CheckAuthenticationMiddleware
      resolve(&FeaturedLinksResolver.create_featured_link/3)
      middleware HandleChangesetErrorsMiddleware
    end
    
    field :delete_featured_link, :featured_link_mutation_result do
      arg(:id, non_null(:integer))
      middleware CheckAuthenticationMiddleware
      resolve(&FeaturedLinksResolver.delete_featured_link/3)
      middleware HandleChangesetErrorsMiddleware
    end
    
    field :update_featured_link, :featured_link_mutation_result do
      arg(:data, non_null(:featured_link_update_input))
      middleware CheckAuthenticationMiddleware
      resolve(&FeaturedLinksResolver.update_featured_link/3)
      middleware HandleChangesetErrorsMiddleware
    end
  end
end
