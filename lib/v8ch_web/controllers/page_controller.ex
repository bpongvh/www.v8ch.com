defmodule V8chWeb.PageController do
  use V8chWeb, :controller

  def index(conn, _params) do
    html(conn, File.read!("priv/static/index.html"))
  end
end
