defmodule V8chWeb.GraphQlResolvers.Posts do
  @posts_module Application.get_env(:v8ch, :posts_module)

  def create_post(_, %{data: params}, _) do
    with {:ok, post} <- @posts_module.create_post(params) do
      {:ok, %{post: post}}
    end
  end

  def delete_post(_, %{id: id}, _) do
    with {:ok, post} <- fetch_post(id),
        {:ok, deleted} <- @posts_module.delete_post(post) do
      {:ok, %{post: deleted}}
    end
  end

  def update_post(_, %{data: params}, _) do
    with {:ok, post} <- fetch_post(params.id),
        {:ok, updated} <- @posts_module.update_post(post, params) do
      {:ok, %{post: updated}}
    end
  end

  defp fetch_post(id) do
    post = @posts_module.get_post(id)
    case post do
      nil -> {:error, "POST_NOT_FOUND"}
      _ -> {:ok, post}
    end
  end
end
