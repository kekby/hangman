defmodule Dictionary.WordList do
  def start do
    word_list
  end

  def random_word(words) do
    words
    |> Enum.random()
  end

  defp word_list do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split("\n")
  end
end
