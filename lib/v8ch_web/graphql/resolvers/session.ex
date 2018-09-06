defmodule V8chWeb.GraphQlResolvers.Session do
  @session_module Application.get_env(:v8ch, :session_module)

  def create_session(_, %{data: params}, _) do
    with {:ok, session} <- @session_module.create_session(params) do
      {:ok, %{session: session}}
    end
  end
end
