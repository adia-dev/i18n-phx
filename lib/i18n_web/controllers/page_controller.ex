defmodule I18nWeb.PageController do
  use I18nWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
