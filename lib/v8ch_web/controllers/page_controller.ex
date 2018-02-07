defmodule V8chWeb.PageController do
  use V8chWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
