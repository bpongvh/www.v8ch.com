defmodule V8chWeb.GraphQlSchema do
  use Absinthe.Schema

  alias V8chWeb.GraphQlFields.FeaturedLinksMutations
  alias V8chWeb.GraphQlFields.FeaturedLinksQueries
  alias V8chWeb.GraphQlTypes.FeaturedLink

  # ----------------------
  # Import fields
  # ----------------------

  import_types(FeaturedLinksMutations)
  import_types(FeaturedLinksQueries)

  # ----------------------
  # Import Types
  # ----------------------

  import_types(FeaturedLink)

  query do
    import_fields(:featured_links_queries)
  end

  mutation do
    import_fields(:featured_links_mutations)
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
