defmodule V8chWeb.FallbackController do
    @moduledoc """
    Translates controller action results into valid `Plug.Conn` responses.
  
    See `Phoenix.Controller.action_fallback/1` for more details.
    """
    use V8chWeb, :controller
  
    def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
      conn
      |> put_status(:unprocessable_entity)
      |> render(V8chWeb.ChangesetView, "error.json", changeset: changeset)
    end
  
    def call(conn, {:error, :unauthorized}) do
      conn
      |> put_status(:forbidden)
      |> render(V8chWeb.ErrorView, :"403")
    end
  
    def call(conn, {:error, :not_found}) do
      conn
      |> put_status(:not_found)
      |> render(V8chWeb.ErrorView, :"404")
    end
  
    def call(conn, {:error, :not_found}, _object) do
      conn
      |> put_status(:not_found)
      |> render(V8chWeb.ErrorView, :"404")
    end
  end