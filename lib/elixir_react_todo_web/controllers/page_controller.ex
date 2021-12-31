defmodule ElixirReactTodoWeb.PageController do
  use ElixirReactTodoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
