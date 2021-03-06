defmodule I18nWeb.LocalePlug do
  alias Plug.Conn
  @behaviour Plug

  @locales Gettext.known_locales(I18nWeb.Gettext)
  @cookie "i18nlanguage"
  @ten_days 10 * 24 * 60 * 60

  defguard known_locale?(locale) when locale in @locales

  @impl Plug
  def init(_opts), do: nil

  @impl Plug
  def call(conn, _opts) do
    locale = fetch_and_set_locale(conn)

    conn
    |> determine_language_dropdown_state
    |> persist_locale(locale)
  end

  defp fetch_and_set_locale(conn) do
    case locale_from_params(conn) || locale_from_cookies(conn) do
      nil ->
        Gettext.get_locale()

      locale ->
        if locale != Gettext.get_locale() do
          Gettext.put_locale(locale)
        end
    end
  end

  defp locale_from_params(%Conn{params: %{"locale" => locale}}) when known_locale?(locale) do
    locale
  end

  defp locale_from_params(_conn), do: nil

  defp locale_from_cookies(%Conn{cookies: %{@cookie => locale}}) when known_locale?(locale) do
    locale
  end

  defp locale_from_cookies(_conn), do: nil

  defp determine_language_dropdown_state(conn) do
    show_available_language =
      case conn.params["show_available_locales "] do
        "true" -> true
        _ -> false
      end

    Conn.assign(conn, :show_available_locales, show_available_language)
  end

  defp persist_locale(%Conn{cookies: %{@cookie => locale}} = conn, locale) do
    conn
  end

  defp persist_locale(conn, locale) do
    Conn.put_resp_cookie(conn, @cookie, locale, max_age: @ten_days, sign: true)
  end
end
