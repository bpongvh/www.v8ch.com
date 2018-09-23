defmodule V8chWeb.GraphQlFields.PostsMutations do
  use Absinthe.Schema.Notation

  alias V8chWeb.GraphQlMiddleware.CheckAuthentication, as: CheckAuthenticationMiddleware
  alias V8chWeb.GraphQlMiddleware.HandleChangesetErrors, as: HandleChangesetErrorsMiddleware
  alias V8chWeb.GraphQlResolvers.Posts, as: PostsResolver

  object :posts_mutations do
    field :create_post, :post_mutation_result do
      arg(:data, non_null(:post_create_input))
      middleware CheckAuthenticationMiddleware
      resolve(&PostsResolver.create_post/3)
      middleware HandleChangesetErrorsMiddleware
    end

    field :delete_post, :post_mutation_result do
      arg(:data, non_null(:post_delete_input))
      middleware CheckAuthenticationMiddleware
      resolve(&PostsResolver.delete_post/3)
      middleware HandleChangesetErrorsMiddleware
    end

    field :update_post, :post_mutation_result do
      arg(:data, non_null(:post_update_input))
      middleware CheckAuthenticationMiddleware
      resolve(&PostsResolver.update_post/3)
      middleware HandleChangesetErrorsMiddleware
    end
  end
end
