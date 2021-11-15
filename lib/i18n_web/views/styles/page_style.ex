defmodule I18nWeb.PageStyle do
  @article_classes ~w[
    bg-pink-500
    w-screen
    h-screen

  ] |> Enum.join(" ")

  @heading_container_classes ~w[
    flex
    justify-center
  ] |> Enum.join(" ")

  @heading_classes ~w[
    mt-10
    text-5xl
    text-white
    font-bold
    cursor-pointer
    hover:text-black
  ] |> Enum.join(" ")

  def article, do: @article_classes
  def heading_container, do: @heading_container_classes
  def heading, do: @heading_classes
end
