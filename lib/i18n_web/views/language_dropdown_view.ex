defmodule I18nWeb.LanguageDropdownView do
  use I18nWeb, :view
  alias I18nWeb.LanguageDropdownStyle
  alias __MODULE__, as: LanguageDropdownView

  @locales Gettext.known_locales(I18nWeb.Gettext)
  @locale_strings %{
    "en" => "English",
    "fr" => "French",
    "it" => "Italiano",
    "ja" => "日本語"
  }

  defdelegate caret, to: LanguageDropdownStyle
  defdelegate current_selection(show_available_locales), to: LanguageDropdownStyle
  defdelegate current_selection_link, to: LanguageDropdownStyle
  defdelegate dropdown_container, to: LanguageDropdownStyle
  defdelegate dropdown_list(show_available_locales), to: LanguageDropdownStyle
  defdelegate dropdown_list_item, to: LanguageDropdownStyle
  defdelegate dropdown_list_item_link, to: LanguageDropdownStyle

  def locale_string(locale), do: @locale_strings[locale]
  def current_locale_string, do: locale_string(Gettext.get_locale())
  def selectable_locales, do: List.delete(@locales, Gettext.get_locale())
end
