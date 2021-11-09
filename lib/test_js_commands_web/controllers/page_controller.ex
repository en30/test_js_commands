defmodule TestJsCommandsWeb.PageController do
  use TestJsCommandsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
