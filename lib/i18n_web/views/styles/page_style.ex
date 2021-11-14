defmodule I18nWeb.PageStyle do
  @article_classes ~w[
    mt-5
    text-green-500
    w-screen
    flex
    justify-center
  ] |> Enum.join(" ")

  @heading_container_classes ~w[
    dtc
    ph-3 ph4-l
    tc
    v-mid
  ] |> Enum.join(" ")

  @heading_classes ~w[
    f6 f2-m f-subheadline-l
    fw6
    tc
  ] |> Enum.join(" ")

  def article, do: @article_classes
  def heading_container, do: @heading_container_classes
  def heading, do: @heading_classes
end
