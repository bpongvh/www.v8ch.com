defmodule V8chWeb.GraphQlFields.PostsQueries do
  use Absinthe.Schema.Notation

  alias V8chWeb.GraphQlResolvers.Posts, as: PostsResolvers

  object :posts_queries do
    field :posts, list_of(:post) do
      resolve &PostsResolvers.list_posts/3
    end
    field :post, :post do
      arg :id, :string
      resolve &PostsResolvers.get_post/3
    end
  end
end
