defmodule V8chWeb.Plugs.GraphQlContext do
    import Plug.Conn
    require Logger
  
    @behaviour Plug
  
    @contexts_module Application.get_env(:v8ch, :contexts_module)
  
    def init(_), do: :ok
  
    def call(conn, _) do
      with {:ok, jwt} <- get_token(conn),
           {:ok, verified_jwt} <- @contexts_module.verify_jwt(jwt),
           {:ok, user} <- @contexts_module.get_user_from_jwt(verified_jwt) do
        Absinthe.Plug.put_options(conn, context: %{authenticated: user})
      else
        {:error, error} ->
          Logger.error("[V8ch.Plugs.GraphQlContext] Error fetching context: #{error}")
          Absinthe.Plug.put_options(conn, context: %{error: error})
  
        unknown ->
          Logger.error("[V8ch.Plugs.GraphQlContext] Unknown error")
          Absinthe.Plug.put_options(conn, context: %{error: unknown})
      end
    end
  
    defp get_token(conn) do
      with ["Bearer " <> jwt] <- get_req_header(conn, "authorization") do
        {:ok, jwt}
      else
        _ -> {:error, "TOKEN_NOT_FOUND"}
      end
    end
  end