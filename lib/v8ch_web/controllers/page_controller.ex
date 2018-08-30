defmodule V8chWeb.PageController do
  use V8chWeb, :controller

  def index(conn, _params) do
    html(conn, File.read!("priv/static/index.html"))
  end

  def trivia_challenge(conn, _params) do
    html(conn, File.read!("priv/static/trivia-challenge.html"))
  end
end
