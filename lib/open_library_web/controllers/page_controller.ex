defmodule OpenLibraryWeb.PageController do
  use OpenLibraryWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def booklist(conn, _params) do
    render(conn, "booklist.html")
  end
end
