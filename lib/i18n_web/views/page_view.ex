defmodule I18nWeb.PageView do
  use I18nWeb, :view

  alias I18nWeb.PageStyle

  defdelegate article, to: PageStyle
  defdelegate heading, to: PageStyle
  defdelegate heading_container, to: PageStyle
end
