defmodule Minty.PageController do
  use Minty.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
