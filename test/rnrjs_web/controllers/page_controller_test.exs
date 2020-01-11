defmodule RnrjsWeb.PageControllerTest do
  use RnrjsWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Rock N Rolla JS"
  end
end
