defmodule V8chWeb.PageControllerTest do
  use V8chWeb.ConnCase

  @moduletag :page_controller

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "<div id=\"v8ch\""
  end
end
