defmodule V8chWeb.GraphQlMiddleware.CheckAuthentication do
  @behaviour Absinthe.Middleware

  def call(%{context: %{authenticated: %{}}} = resolution, _config) do
    resolution
  end

  def call(%{context: %{error: error}} = resolution, _config) do
    resolution
    |> Absinthe.Resolution.put_result({:error, error})
  end

  def call(resolution, _config) do
    resolution
    |> Absinthe.Resolution.put_result({:error, "NOT_AUTHENTICATED"})
  end
end
