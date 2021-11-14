defmodule I18nWeb.LayoutView do
  use I18nWeb, :view
  alias I18nWeb.{LanguageDropdownView, LayoutStyle}

  defdelegate body, to: LayoutStyle
end
