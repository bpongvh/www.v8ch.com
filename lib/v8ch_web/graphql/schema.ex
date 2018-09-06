defmodule V8chWeb.GraphQlSchema do
  use Absinthe.Schema

  alias V8chWeb.GraphQlTypes.FeaturedLink
  alias V8chWeb.GraphQlFields.FeaturedLinksMutations
  alias V8chWeb.GraphQlFields.FeaturedLinksQueries
  alias V8chWeb.GraphQlTypes.Post
  alias V8chWeb.GraphQlTypes.Session
  alias V8chWeb.GraphQlFields.PostsMutations
  alias V8chWeb.GraphQlFields.PostsQueries
  alias V8chWeb.GraphQlFields.SessionMutations

  # ----------------------
  # Import fields
  # ----------------------

  import_types(FeaturedLinksMutations)
  import_types(FeaturedLinksQueries)
  import_types(PostsMutations)
  import_types(PostsQueries)
  import_types(SessionMutations)

  # ----------------------
  # Import Types
  # ----------------------

  import_types(FeaturedLink)
  import_types(Post)
  import_types(Session)

  # ----------------------
  # Import queries
  # ----------------------

  query do
    import_fields(:featured_links_queries)
    import_fields(:posts_queries)
  end

  # ----------------------
  # Import mutations
  # ----------------------

  mutation do
    import_fields(:featured_links_mutations)
    import_fields(:posts_mutations)
  end

  # ----------------------
  # Global objects
  # ----------------------

  @desc "An error result when persisting input"
  object :input_error do
    field(:key, non_null(:string))
    field(:message, non_null(:string))
  end

  # ----------------------
  # Custom types
  # ----------------------

  scalar :iso8601 do
    parse fn input ->
      case Timex.parse(Map.get(input, "submittedBy"), "{ISO:Extended:Z}") do
        {:ok, result} -> result
        _ -> :error
      end
    end

    serialize fn (datetime) ->
      case Timex.format(datetime, "{ISO:Extended:Z}") do
        {:ok, result} -> result
        _ -> :error
      end
    end
  end
end
