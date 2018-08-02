defmodule V8chWeb.GraphQlSchema do
    use Absinthe.Schema
  
    alias V8chWeb.GraphQlMiddleware.CheckAuthentication, as: CheckAuthenticationMiddleware
  
    # ----------------------
    # Import fields
    # ----------------------
  
    import_types(V8chWeb.GraphQlFields.FeaturedLinks)
  
    # ----------------------
    # Import Types
    # ----------------------
  
    import_types(V8chWeb.GraphQlTypes.FeaturedLink)
  
    query do
      import_fields :featured_links_queries
    end
    def middleware(middleware, _field, _object) do
      [CheckAuthenticationMiddleware] ++ middleware
      # middleware
    end
  
    # mutation do
    #   field :login, :user_context do
    #     arg(:input, non_null(:cognito_access_token_input))
    #     resolve(&AuthResolver.verify_and_sign_in/3)
    #   end
    # end
  
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