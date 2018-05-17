defmodule BoardAppWeb.PageController do
  use BoardAppWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
