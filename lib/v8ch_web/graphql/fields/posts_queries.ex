defmodule V8chWeb.GraphQlFields.PostsQueries do
  use Absinthe.Schema.Notation

  @posts_module Application.get_env(:v8ch, :posts_module)

  object :posts_queries do
    field :posts, list_of(:post) do
      resolve(fn _, _, _ ->
        {:ok, @posts_module.list_posts()}
      end)
    end
  end
end
