defmodule I18nWeb.PageController do
  use I18nWeb, :controller

  def index(conn, _params) do
    conn
    |> render("index.html")
  end
end
