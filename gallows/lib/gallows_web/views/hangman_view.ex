defmodule GallowsWeb.HangmanView do
  use GallowsWeb, :view

  def get_word(letters) do
    letters |> Enum.join(" ")
  end
end
